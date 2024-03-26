#' @title Get Master List
#'
#' @description Get a master list of all bills, optionally for a specific state.
#'
#' @param id A session ID
#' @param state A state abbreviation
#'
#' @export
#'
get_master_list <- function(id = NULL, state = NULL) {
  # Make sure id and state are mutually exclusive in the rlang way
  # By default, at least one of them must be specified
  res <- switch(
    rlang::check_exclusive(id, state),
    id = legiscan_request(op = "getMasterList", id = id),
    state = legiscan_request(op = "getMasterList", state = state),
  )

  res$masterlist |>
    purrr::map(
      ~ .x |>
        purrr::flatten() |>
        tibble::as_tibble()
    ) |>
    purrr::discard_at(1) |>
    purrr::list_rbind()
}

#' @title Get Master List Raw
#'
#' @description Get a master list of all bills, optionally for a specific state.
#'
#' @param id A session ID
#' @param state A state abbreviation
#'
#' @export
#'
get_master_list_raw <- function(id = NULL, state = NULL) {
  # Make sure id and state are mutually exclusive in the rlang way
  # By default, at least one of them must be specified
  res <- switch(
    rlang::check_exclusive(id, state),
    id = legiscan_request(op = "getMasterListRaw", id = id),
    state = legiscan_request(op = "getMasterListRaw", state = state),
  )

  res$masterlist |>
    purrr::map(
      ~ .x |>
        purrr::flatten() |>
        tibble::as_tibble()
    ) |>
    purrr::discard_at(1) |>
    purrr::list_rbind()
}
