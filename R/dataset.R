#' @title Get Dataset List
#'
#' @description Get a list of all datasets
#'
#' @param state Optional state abbreviation
#' @param year Optional year
#'
#' @export
#'
get_dataset_list <- function(state = NULL, year = NULL) {

  if (is.null(state) & is.null(year)) {
    res <- legiscan_request(op = "getDatasetList")
  } else {
    params <- list(
      state = state,
      year = year
    )

    res <- legiscan_request(op = "getDatasetList", params)
  }

  res$datasetlist |>
    purrr::map(
      ~ .x |>
        purrr::flatten() |>
        tibble::as_tibble()
    ) |>
    purrr::list_rbind()
}

#' @title Get Dataset
#'
#' @description Get a dataset by ID
#'
#' @param id A dataset ID
#' @param access_key An access key
#'
#' @export
#'
get_dataset <- function(id, access_key) {
  res <- legiscan_request(op = "getDataset", id = id, access_key = access_key)

  res$dataset
}
