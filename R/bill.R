#' @title Get Bill
#'
#' @description Get a bill by ID.
#'
#' @param id A bill ID
#'
#' @export
#'
get_bill <- function(id) {
  res <- legiscan_request(op = "getBill", id = id)

  res$bill
}

new_bill <- function(x) {
  x <- purrr::map(x, list_to_tibble)

  structure(x, class = "bill")
}

validate_bill <- function(x) {
  x
}

bill <- function(id) {
  b <- get_bill(id)

  new_bill(b) |>
    validate_bill()
}

bill_info <- function(bill) {
  if (rlang::is_string(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    rlang::abort("blah err in bill_info")
  }

  res <- bill |>
    purrr::keep(rlang::is_scalar_atomic) |>
    tibble::as_tibble()

  return(res)
}


#' @title Get Bill Text
#'
#' @description Get the text of a bill by ID
#'
#' @param id A bill ID
#'
get_bill_text <- function(id) {
  res <- legiscan_request(op = "getBillText", id = id)

  res$text |>
    dplyr::as_tibble()
}

#' @title Get Amendment
#'
#' @description Get an amendment by ID
#'
#' @param id An amendment ID
#'
get_amendment <- function(id) {
  res <- legiscan_request(op = "getAmendment", id = id)

  res$amendment
}


#' @title Get Supplement
#'
#' @description Get a supplement by ID
#'
#' @param id A supplement ID
#'
get_supplement <- function(id) {
  res <- legiscan_request(op = "getSupplement", id = id)

  res$supplement
}

#' @title Get Roll Call
#'
#' @description Get a roll call by ID
#'
#' @param id A roll call ID
#'
#' @export
#'
get_roll_call <- function(id) {
  res <- legiscan_request(op = "getRollCall", id = id)

  res$rollcall
}
