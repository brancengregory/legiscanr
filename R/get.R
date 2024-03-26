#' @title Get Session List
#'
#' @description Get a list of all sessions, optionally for a specific state.
#'
#' @param state A state abbreviation
#'
#' @export
#' @returns
#'
get_session_list <- function(state = NULL) {
  if (is.null(state)) {
    res <- req_legiscan(op = "getSessionList")
  } else {
    res <- req_legiscan(op = "getSessionList", state = state)
  }

  res$sessions |>
    purrr::map(
      ~ .x |>
          purrr::flatten() |>
          tibble::as_tibble()
    ) |>
    purrr::list_rbind()
}

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
    id = req_legiscan(op = "getMasterList", id = id),
    state = req_legiscan(op = "getMasterList", state = state),
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
    id = req_legiscan(op = "getMasterList", id = id),
    state = req_legiscan(op = "getMasterList", state = state),
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

#' @title Get Amendment
#'
#' @description Get an amendment by ID
#'
#' @param id An amendment ID
#'
get_amendment <- function(id) {
  res <- req_legiscan(op = "getAmendment", id = id)

  res$amendment
}

#' @title Get Supplement
#'
#' @description Get a supplement by ID
#'
#' @param id A supplement ID
#'
get_supplement <- function(id) {
  res <- req_legiscan(op = "getSupplement", id = id)

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
  res <- req_legiscan(op = "getRollCall", id = id)

  res$rollcall
}


#' @title Get Search
#'
## TODO: This is the hardest one to wrap because it's so flexible

#' @title Get Search Raw
#'
## TODO: This is the hardest one to wrap because it's so flexible


#' @title Get Sponsored List
#'
#' @description Get a list of bills sponsored by a person
#'
#' @param id A person ID
#'
#' @export
#'
get_sponsored_list <- function(id) {
  res <- req_legiscan(op = "getSponsoredList", id = id)

  res$sponsoredbills$bills |>
    purrr::map_df(~ tibble::as_tibble(.x))
}

#' @title Get Monitor List
#'
## TODO: Decide whether to implement GAITS features

#' @title Get Monitor List Raw
#'
## TODO: Decide whether to implement GAITS features
