list_examples <- function() {
  roots <- c(testthat::test_path("fixtures"),
             testthat::test_path("parser-examples"))
  roots <- roots[file.exists(roots)]
  unique(unlist(lapply(roots, function(d)
    list.dirs(d, full.names = FALSE, recursive = FALSE))))
}

path_fixture <- function(example, file = c("nodes","edges")) {
  # validate example against discovered dirs
  stopifnot(example %in% list_examples())
  file  <- match.arg(file)
  fname <- if (file == "nodes") "nodes.csv" else "edges.csv"
  cand <- c(
    testthat::test_path("fixtures",        example, fname),
    testthat::test_path("parser-examples", example, fname)
  )
  cand <- cand[file.exists(cand)]
  if (length(cand)) return(cand[[1]])
  stop("Fixture not found for ", example, "/", fname)
}
