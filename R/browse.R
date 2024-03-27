browse <- function(x) {
  UseMethod("browse")
}

browse.bill <- function(x) {
  browseURL(x$url)
}
