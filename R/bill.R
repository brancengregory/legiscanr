#' @title Get Bill
#' @description FUNCTION_DESCRIPTION
#' @param id PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname get_bill
#'
get_bill <- function(id) {
  res <- legiscan_request(op = "getBill", id = id)

  res$bill
}

#' @title New Bill
#' @description FUNCTION_DESCRIPTION
#' @param x PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[purrr]{map}}
#' @rdname new_bill
#' @importFrom purrr map
#'
new_bill <- function(x) {
  x <- purrr::map(x, list_to_tibble)

  structure(x, class = "bill")
}

#' @title Validate Bill
#' @description FUNCTION_DESCRIPTION
#' @param x PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname validate_bill
#'
validate_bill <- function(x) {
  x
}

#' @title Bill
#' @description FUNCTION_DESCRIPTION
#' @param id PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname bill
#' @export
#'
bill <- function(id) {
  b <- get_bill(id)

  new_bill(b) |>
    validate_bill()
}

#' @title Bill Info
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{is_integerish}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{keep}}
#'  \code{\link[tibble]{as_tibble}}
#' @rdname bill_info
#' @export
#' @importFrom rlang is_string is_integerish abort is_scalar_atomic
#' @importFrom purrr keep
#' @importFrom tibble as_tibble
#'
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

#' @title Bill Progress
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{is_integerish}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_progress
#' @export
#' @importFrom rlang is_string is_integerish abort
#' @importFrom purrr pluck
#'
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

#' @title Bill Committee
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{is_integerish}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_committee
#' @export
#' @importFrom rlang is_string is_integerish abort
#' @importFrom purrr pluck
#'
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

#' @title Bill Referrals
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{is_integerish}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_referrals
#' @export
#' @importFrom rlang is_string is_integerish abort
#' @importFrom purrr pluck
#'
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

#' @title Bill History
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{is_integerish}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_history
#' @export
#' @importFrom rlang is_string is_integerish abort
#' @importFrom purrr pluck
#'
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

#' @title Bill Sponsors
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_sponsors
#' @export
#' @importFrom rlang is_string abort
#' @importFrom purrr pluck
#'
bill_sponsors <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
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

#' @title Bill SASTs
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_sasts
#' @export
#' @importFrom rlang is_string abort
#' @importFrom purrr pluck
#'
bill_sasts <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
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

#' @title Bill Texts
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_texts
#' @export
#' @importFrom rlang is_string abort
#' @importFrom purrr pluck
#'
bill_texts <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
    bill <- bill(bill)
  }

  if (!inherits(bill, "bill")) {
    # TODO: handle error better
    rlang::abort("blah err in bill_texts")
  }

  res <- bill |>
    purrr::pluck("texts")

  return(res)
}

#' @title Bill Votes
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_votes
#' @export
#' @importFrom rlang is_string abort
#' @importFrom purrr pluck
#'
bill_votes <- function(bill) {
  if (rlang::is_string(bill) | rlang::is_integerish(bill)) {
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

#' @title Bill Amendments
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{is_integerish}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_amendments
#' @export
#' @importFrom rlang is_string is_integerish abort
#' @importFrom purrr pluck
#'
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

#' @title Bill Supplements
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{is_integerish}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_supplements
#' @export
#' @importFrom rlang is_string is_integerish abort
#' @importFrom purrr pluck
#'
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

#' @title Bill Calendar
#' @description FUNCTION_DESCRIPTION
#' @param bill PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rlang]{scalar-type-predicates}}, \code{\link[rlang]{is_integerish}}, \code{\link[rlang]{abort}}
#'  \code{\link[purrr]{pluck}}
#' @rdname bill_calendar
#' @export
#' @importFrom rlang is_string is_integerish abort
#' @importFrom purrr pluck
#'
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
#' @description FUNCTION_DESCRIPTION
#' @param id PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[dplyr]{reexports}}
#' @rdname get_bill_text
#' @importFrom dplyr as_tibble
#'
get_bill_text <- function(id) {
  res <- legiscan_request(op = "getBillText", id = id)

  res$text |>
    dplyr::as_tibble()
}

#' @title Get Amendment
#' @description FUNCTION_DESCRIPTION
#' @param id PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname get_amendment
#'
get_amendment <- function(id) {
  res <- legiscan_request(op = "getAmendment", id = id)

  res$amendment
}


#' @title Get Supplement
#' @description FUNCTION_DESCRIPTION
#' @param id PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname get_supplement
#'
get_supplement <- function(id) {
  res <- legiscan_request(op = "getSupplement", id = id)

  res$supplement
}

#' @title Get Roll Call
#' @description FUNCTION_DESCRIPTION
#' @param id PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname get_roll_call
#'
get_roll_call <- function(id) {
  res <- legiscan_request(op = "getRollCall", id = id)

  res$rollcall
}
