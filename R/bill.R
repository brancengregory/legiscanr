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
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_info")
  }

  res <- bill |>
    purrr::keep(rlang::is_scalar_atomic) |>
    tibble::as_tibble()

  return(res)
}

bill_progress <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_progress")
  }

  res <- bill |>
    purrr::pluck("progress")

  return(res)
}

bill_committee <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_committee")
  }

  res <- bill |>
    purrr::pluck("committee")

  return(res)
}

bill_referrals <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_referrals")
  }

  res <- bill |>
    purrr::pluck("referrals")

  return(res)
}

bill_history <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_history")
  }

  res <- bill |>
    purrr::pluck("history")

  return(res)
}

bill_sponsors <- function(bill) {
  if (rlang::is_string(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_sponsors")
  }

  res <- bill |>
    purrr::pluck("sponsors")

  return(res)
}

bill_sasts <- function(bill) {
  if (rlang::is_string(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_sasts")
  }

  res <- bill |>
    purrr::pluck("sasts")

  return(res)
}

bill_texts <- function(bill) {
  if (rlang::is_string(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "texts")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_texts")
  }

  res <- bill |>
    purrr::pluck("texts")

  return(res)
}

bill_votes <- function(bill) {
  if (rlang::is_string(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_votes")
  }

  res <- bill |>
    purrr::pluck("votes")

  return(res)
}

bill_amendments <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_amendments")
  }

  res <- bill |>
    purrr::pluck("amendments")

  return(res)
}

bill_supplements <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_supplements")
  }

  res <- bill |>
    purrr::pluck("supplements")

  return(res)
}

bill_calendar <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_calendar")
  }

  res <- bill |>
    purrr::pluck("calendar")

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
