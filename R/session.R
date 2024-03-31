#' @title Get Session List
#'
#' @description Get a list of all sessions, optionally for a specific state.
#'
#' @param state A state abbreviation
#'
#' @export
#'
get_session_list <- function(state = NULL) {
  if (is.null(state)) {
    res <- legiscan_request(op = "getSessionList")
  } else {
    res <- legiscan_request(op = "getSessionList", state = state)
  }

  res$sessions |>
    purrr::map(
      ~ .x |>
        purrr::flatten() |>
        tibble::as_tibble()
    ) |>
    purrr::list_rbind()
}

#' @title Get Session People
#'
#' @description Get a list of people for a session
#'
#' @param id A session ID
#'
#' @export
#'
get_session_people <- function(id) {
  res <- legiscan_request(op = "getSessionPeople", id = id)

  res$sessionpeople$people |>
    purrr::map(tibble::as_tibble) |>
    purrr::list_rbind()
}
