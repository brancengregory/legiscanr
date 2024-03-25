legiscan_api_url <- "https://api.legiscan.com/"


req_legiscan <- function(..., base_url = legiscan_api_url, op = NULL, key = Sys.getenv("LEGISCAN_API_KEY")) {
  if (is.null(op)) {
    stop("Must specify an operation")
  }
  if (is.null(key)) {
    stop("Must specify an API key")
  }

  params <- list(
    key = key,
    op = op,
    ...
  )

  req <- httr2::request(base_url) |>
    httr2::req_url_query(!!!params)

  res <- httr2::req_perform(req) |>
    httr2::resp_body_json()

  if (res$status == "ERROR") {
    stop(res$alert$message)
  }

  return(res)
}
