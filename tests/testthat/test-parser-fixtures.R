library(testthat)

test_that("parser fixtures are self-consistent", {
  check_one <- function(ex) {
    nodes <- read.csv(path_fixture(ex, "nodes"), stringsAsFactors = FALSE)
    edges <- read.csv(path_fixture(ex, "edges"), stringsAsFactors = FALSE)
    
    # 1) required columns
    expect_true(all(c("id","label","type", "plates") %in% names(nodes)))
    expect_true(all(c("from","to","kind") %in% names(edges)))
    
    # 2) node ids: non-empty & unique
    expect_false(any(is.na(nodes$id) | nodes$id == ""))
    expect_equal(length(unique(nodes$id)), nrow(nodes))
    
    # 3) edges reference defined nodes
    unknown_from <- setdiff(edges$from, nodes$id)
    unknown_to   <- setdiff(edges$to,   nodes$id)
    expect_true(length(unknown_from) == 0,
                info = paste("Unknown `from` ids:", paste(unknown_from, collapse=", ")))
    expect_true(length(unknown_to) == 0,
                info = paste("Unknown `to` ids:",   paste(unknown_to,   collapse=", ")))
  }
  
  for (ex in c("rats","pumps", "dogs","seeds", "surgical_fixed", "surgical_random", "salm","equiv", "dyes", "stacks", "epil", "blocker", "oxford", "LSAT", "beetles", "bones", "inhaler", "mice", "kidney", "leuk", "leukFr", "dugongs", "orange_trees", "orange_trees_repeat", "biopsies", "eyes", "hearts", "air", "cervix", "jaws", "birats", "schools", "ice", "alligators", "endo", "stagnant", "asia")) check_one(ex)
})
