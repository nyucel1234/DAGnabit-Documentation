# Resolves fixture CSV paths for examples (rats, pumps)
path_fixture <- function(example = c("rats","pumps"),
                         file = c("nodes","edges")) {
  example <- match.arg(example)
  file    <- match.arg(file)
  fname   <- if (file == "nodes") "nodes.csv" else "edges.csv"
  
  # 1) Preferred (new) location
  p_new <- testthat::test_path("fixtures", example, fname)
  if (file.exists(p_new)) return(p_new)
  
  # 2) Back-compat (old) location
  p_old <- testthat::test_path("parser-examples", example, fname)
  if (file.exists(p_old)) return(p_old)
  
  stop("Fixture not found for ", example, "/", fname,
       "\nLooked in:\n - ", p_new, "\n - ", p_old)
}
