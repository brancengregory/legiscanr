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

bill_texts |>
  summarise(
    total_size = sum(text_size) |>
      rlang::as_bytes()
  )

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
