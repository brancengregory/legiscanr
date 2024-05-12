library(legiscanr)
library(reticulate)
library(jsonlite)
library(readr)
library(stringr)
library(pdftools)
library(here)

ai <- import("openai")
rich <- import("rich")

client <- ai$OpenAI()

doc <- pdftools::pdf_text(here("inst/docs/test_doc.pdf")) |>
  str_flatten(collapse = " ")

summarise_bill <- function(text) {
  response <- client$chat$completions$create(
    model = "gpt-4-turbo",
    messages = list(
      list(
        role = "system",
        content = "You are an analyst at a progressive policy institute in Oklahoma. You speak technically to domain experts. You focus on interpersonal politics, leverage points, your institution's policy and legislative agendas."
      ),
      list(
        role = "user",
        content = str_glue("Please provide a detailed and markdown structured summary of the following legislation doc, including summary of the key components and changes proposed in the bill as well as at least three labels for this bill within a catalogue.
<doc> {doc} </doc>")
      )
    ),
    temperature = 0
  )

  res_text <- fromJSON(response$to_json())$choices$message$content[1]

  return(res_text)
}

res <- summarise_bill(doc)

write_lines(
  res,
  here("inst/docs/test_summary.md")
)
