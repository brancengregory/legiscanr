#' @title Get Person
#'
#' @description Get a person by ID
#'
#' @param id A person ID
#'
#' @export
#'
get_person <- function(id) {
  res <- legiscan_request(op = "getPerson", id = id)

  res$person |>
    dplyr::as_tibble()
}


#' @title Get Sponsored List
#'
#' @description Get a list of bills sponsored by a person
#'
#' @param id A person ID
#'
#' @export
#'
get_sponsored_list <- function(id) {
  res <- legiscan_request(op = "getSponsoredList", id = id)

  res$sponsoredbills$bills |>
    purrr::map(tibble::as_tibble) |>
    purrr::list_rbind()
}
