#!/usr/local/bin/Rscript

writeStdErr <- function(msg, handler, ...) {
  if (length(list(...)) && "dry" %in% names(list(...))) {
    handler$color_msg <- function(msg, level_name) msg
    return(TRUE)
  }

  stopifnot(length(list(...)) > 0)

  level_name <- list(...)[[1]]$levelname
  msg <- handler$color_msg(msg, level_name)
  cat(paste0(msg, "\n"), file = stderr())
}

if (sys.nframe() == 0){
  library(argparse)
  parser <- argparse::ArgumentParser()

  parser$add_argument("-v", "--verbose", action='store_true', default=FALSE, help="print extra output")
  parser$add_argument("-p", "--port", type="integer", default=8000, help="the port to expose the api on")
  parser$add_argument("-b", "--bind", default="127.0.0.1")


  args <- parser$parse_args()
  if (args$verbose) {
    level <- "DEBUG"
  } else {
    level <- "INFO"
  }
  logging::basicConfig(level = level)
  logging::logReset()
  logger <- logging::getLogger("fibo")

  logger$addHandler(writeStdErr)


  plumber_file <- system.file("plumber", package = "fibo", mustWork = TRUE)
  logger$info("loading plumber api from %s", plumber_file)

  plumber::plumb(dir = plumber_file)$run(port = args$port, swagger = TRUE, host = args$bind)

}
