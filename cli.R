#!/usr/local/bin/Rscript


if (!interactive()) {
  logging::basicConfig()
  logger <- logging::getLogger("fibo.cli")

  plumber_file <- system.file("plumber", package = "fibo", mustWork = TRUE)
  logger$info("loading plumber api from %s", plumber_file)

  plumber::plumb(dir = plumber_file)$run(port = 8000, swagger = FALSE, host = "0.0.0.0")
}
