test_that("rats.csv has expected shape and values", {
  path <- system.file("examples", "rats", "rats.csv", package = "dagnabit.docs")
  # During dev (before install), also try plain path:
  if (path == "") path <- "inst/examples/rats/rats.csv"
  d <- read.csv(path)
  
  expect_true(all(c("rat","day","weight") %in% names(d)))
  expect_equal(nrow(d), 30 * 5)
  expect_setequal(unique(d$day), c(8,15,22,29,36))
  
  # spot checks first few weights (row 1 across days)
  d1 <- subset(d, rat == 1)
  expect_equal(d1$weight, c(151,199,246,283,320))
})
