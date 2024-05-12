library(legiscanr)
library(tidyverse)
library(here)
library(pdftools)


data <- get_master_list(state = "OK")

texts <- data |>
  pull(bill_id) |>
  map(bill_texts, .progress = TRUE) |>
  list_rbind(ptype = NULL) |>
  pull(doc_id) |>
  map(get_bill_text, .progress = TRUE) |>
  list_rbind(ptype = NULL)

doc <- base64enc::base64decode(texts$doc[1])

write_file(
  doc,
  here("inst/docs/test_doc.pdf")
)
