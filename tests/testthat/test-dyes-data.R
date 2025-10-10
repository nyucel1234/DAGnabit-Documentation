test_that("dyes.csv has expected shape and values", {
  # Find the example CSV whether installed or in dev
  path <- system.file("examples", "dyes", "dyes.csv", package = "dagnabit.docs")
  if (path == "") path <- "inst/examples/dyes/dyes.csv"
  d <- read.csv(path)
  
  # Structure checks
  expect_true(all(c("batch","sample","y") %in% names(d)))
  expect_equal(nrow(d), 6 * 5)
  expect_setequal(unique(d$batch),  1:6)
  expect_setequal(unique(d$sample), 1:5)
  
  # Spot checks against the WinBUGS table
  # Sample 1 across batches (column 1 of the 6x5 matrix): 1545,1440,1440,1520,1580,1540
  s1 <- subset(d, sample == 1)
  expect_equal(s1$y, c(1545,1440,1440,1520,1580,1540))
  
  # A few individual cells by (batch, sample) = matrix[row, col]
  expect_equal(subset(d, batch == 3 & sample == 3)$y, 1560)  # mat[3,3]
  expect_equal(subset(d, batch == 4 & sample == 4)$y, 1630)  # mat[4,4]
  expect_equal(subset(d, batch == 6 & sample == 5)$y, 1445)  # mat[6,5]
})
