test_that("salm.csv has expected shape and values", {
  # prefer installed path, else the plain inst/ path for dev
  path <- system.file("examples", "salm", "salm.csv", package = "dagnabit.docs")
  if (path == "") path <- "inst/examples/salm/salm.csv"
  d <- read.csv(path)
  
  # structure
  expect_true(all(c("dose","plate","y") %in% names(d)))
  expect_equal(nrow(d), 6 * 3)
  expect_setequal(unique(d$dose), c(0, 10, 33, 100, 333, 1000))
  expect_setequal(unique(d$plate), 1:3)
  
  # a couple of concrete spot checks against the WinBUGS table
  # For dose = 0, the three plates are 15, 21, 29
  d0 <- subset(d, dose == 0)
  expect_equal(d0$y[order(d0$y)], c(15,21,29))
  
  # For dose = 100, the three plates are 27, 41, 60 (see Data list)
  d100 <- subset(d, dose == 100)
  expect_equal(sort(d100$y), c(27,41,60))
})
