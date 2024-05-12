library(legiscanr)
library(tidyverse)
library(here)
library(zip)
library(jsonlite)
library(httr2)


datasets <- get_dataset_list(state = "OK") |>
  mutate(
    dataset = map2(
      session_id,
      access_key,
      ~ get_dataset(.x, .y)
    )
  )

zip_content <- datasets |>
  mutate(
    zip = map_chr(
      dataset,
      ~ .x$zip,
      .progress = TRUE
    )
  ) |>
  select(zip)

zip_content$zip |>
  walk(
    ~ {
      write_file(
        .x |> base64enc::base64decode(),
        here("inst/data/zip_content")
      )
      zip::unzip(here("inst/data/zip_content"), exdir = here("inst/data"))
    },
    .progress = TRUE
  )

write_file(
  zip_content$zip[1] |> base64enc::base64decode(),
  here("inst/data/zip_content")
)

session_dirs <- fs::dir_ls(here("inst/data/OK"), regexp = "Regular_Session") |>
  as_tibble_col(column_name = "dir") |>
  arrange(desc(dir))

extract_text_links <- function(file) {
  bill <- fromJSON(file)
  bill$bill$texts |>
    as_tibble()
}

bill_texts <- session_dirs |>
  mutate(
    bill_texts = map(
      dir,
      ~ fs::dir_ls(str_c(.x, "/bill"), regexp = ".json") |>
        map(extract_text_links) |>
        list_rbind(ptype = NULL),
      .progress = TRUE
    )
  ) |>
  unnest(
    cols = "bill_texts"
  )

write_csv(bill_texts, here("inst/data/bill_texts.csv"))

# Check total file size: ~19GB
bill_texts |>
  summarise(
    total_size = sum(text_size) |>
      rlang::as_bytes()
  )

# Get PDFs
download_and_save_text <- function(url, file) {
  dest <- here("inst/docs/bills", str_c(file, ".pdf"))

  request(url) |>
    req_perform() |>
    resp_body_raw() |>
    write_file(dest)

  invisible()
}

safely_download_and_save_text <- safely(download_and_save_text)

walk2(
  bill_texts$state_link,
  bill_texts$doc_id,
  safely_download_and_save_text,
  .progress = TRUE
)

# Check which weren't downloaded
# Small network errors are expected, hence using purrr::safely
# 120k network requests is a lot to go right!

bill_texts <- read_csv(here("inst/data/bill_texts.csv"))

bill_text_docs <- fs::dir_ls(here("inst/docs/bills/")) |>
  fs::path_file() |>
  fs::path_ext_remove() |>
  as_tibble_col(column_name = "doc_id")

new_docs <- bill_texts |>
  filter(
    !doc_id %in% bill_text_docs$doc_id
  )

walk2(
  new_docs$url,
  new_docs$doc_id,
  safely_download_and_save_text,
  .progress = TRUE
)

# Get summary stats for docs
bill_texts |>
  count(type)

bill_texts |>
  count(dir) |>
  mutate(
    dir = str_extract(dir, "OK\\/\\d{4}-(\\d{4})_Regular_Session", group = 1)
  ) |>
  rename(session = dir)


# Convert pdfs to text files and store grouped by regular session year

extract_text_to_file <- function(src) {
  src_name <- src |>
    fs::path_file() |>
    fs::path_ext_remove()

  dest_name <- src_name |>
    fs::path_ext_set("txt")

  dest_dir <- here("inst/docs/full_text/")

  dest_path <- fs::path(dest_dir, dest_name)

  pdftools::pdf_text(src) |>
    str_flatten(collapse = " ") |>
    write_file(dest_path)
}

safely_extract_text_to_file <- safely(extract_text_to_file)

fs::dir_ls(here("inst/docs/bills/")) |>
  walk(
    safely_extract_text_to_file,
    .progress = TRUE
  )
