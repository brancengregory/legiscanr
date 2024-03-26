#' @title Get Bill
#'
#' @description Get a bill by ID.
#'
#' @param id A bill ID
#'
#' @export
#'
get_bill <- function(id) {
  res <- req_legiscan(op = "getBill", id = id)

  res$bill
}

#' @title Get Bill Text
#'
#' @description Get the text of a bill by ID
#'
#' @param id A bill ID
#'
get_bill_text <- function(id) {
  res <- req_legiscan(op = "getBillText", id = id)

  res$text |>
    dplyr::as_tibble()
}
