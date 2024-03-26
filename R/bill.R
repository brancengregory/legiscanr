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

  res$bill |>
    map_at("session", as_tibble) |>
    map_at(
      c("progress", "referrals", "history", "sponsors", "sasts", "texts", "votes", "supplements"),
      ~ map(.x, as_tibble) |> list_rbind()
    )
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
