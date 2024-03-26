#' @title Get Person
#'
#' @description Get a person by ID
#'
#' @param id A person ID
#'
#' @export
#'
get_person <- function(id) {
  res <- req_legiscan(op = "getPerson", id = id)

  res$person
}
