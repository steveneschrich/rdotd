#' Run all scripts
#'
#' @param dir Directory to use for R.d files (default = R.d)
#' @param verbose Should the files processed be printed.
#'
#' @return Logical value (TRUE) invisibly
#' @export
#'
#' @examples
#' \dontrun{
#' run_all(dir="~/mydir/R.dx")
#' }
run_all <- function(dir = "R.d", verbose = TRUE) {

  files <- list.files(dir, pattern="\\d+-.*\\.R$")

  purrr::walk(files, function(f) {
    if ( verbose )
      logger::log_info("Executing {basename(f)}.")
    source(f)
  })

  invisible(TRUE)
}
