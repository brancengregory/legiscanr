browse <- function(x) {
  UseMethod("browse")
}

#' @export
browse.bill <- function(x) {
  browseURL(x$url)
}
