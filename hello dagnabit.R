#' Hello DAGnabit
#'
#' A simple example function for testing documentation + package build.
#'
#' @param name Character string; the name to greet.
#' @return A length-1 character vector with the greeting.
#' @export
#' @examples
#' hello_dagnabit("Naz")
hello_dagnabit <- function(name = "World") {
  paste("Hello", name)
}

