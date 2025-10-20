# data-raw/winbugs_extract_diagrams.R
# Run this ONCE locally, then commit the PNG(s) under inst/extdata/winbugs/.

pdf_file <- "WinBUGS_help_examples.pdf"
out_dir  <- "inst/extdata/winbugs"
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

# deps (install if missing)
if (!requireNamespace("pdftools", quietly = TRUE)) install.packages("pdftools")
if (!requireNamespace("png",      quietly = TRUE)) install.packages("png")
library(pdftools); library(png)

# helper to render a page to PNG
render_page <- function(pdf, pageno, filename, dpi = 200) {
  img <- pdftools::pdf_render_page(pdf, page = pageno, dpi = dpi)
  png::writePNG(img, target = filename)
}

# choose the page number that shows "Graphical model for rats"
pageno_rats <- 2  # adjust after skimming the PDF (1-indexed)
render_page(pdf_file, pageno_rats, file.path(out_dir, "rats_diagram.png"))

message("Wrote diagram to: ", normalizePath(file.path(out_dir, "rats_diagram.png")))

