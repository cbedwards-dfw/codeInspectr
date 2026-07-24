#' Test if repository is an R package
#'
#' Uses the existence of a DESCRIPTION file and the first line being "Package:..." to decide if
#' the provided repository is an R package. Accesses first few lines of DESCRIPTION in `raw.githubusercontent.com/`
#' for speed.
#'
#' @param full_name Repository name including user or organization prefix, e.g., "FRAMverse/framrsquared". Character atomic
#' @param default_branch Name of the default/primary repository. Character atomic, defaults to "main". Older repositories often use "master" as the default repo name.
#'
#' @returns Logical: `TRUE` if the repo is an R package, `FALSE` if it is not.
#' @export
#'
#' @examples
#' # framrsquared is an R package
#' is_r_package("FRAMverse/framrsquared")
#' # the snippets repository is not.
#' is_r_package("FRAMverse/snippets")
is_r_package <- function(full_name, default_branch = "main") {

  validate_repository(full_name)
  validatr::validate_character(default_branch, n = 1)

  url <- glue::glue("https://raw.githubusercontent.com/{full_name}/{default_branch}/DESCRIPTION")
  resp <- tryCatch(
    httr2::request(url) |>
      httr2::req_headers(Range = "bytes=0-100") |>
      httr2::req_error(is_error = \(resp) FALSE) |>
      httr2::req_perform(),
    error = function(e) NULL
  )

  ## failed get
  if (is.null(resp) || httr2::resp_status(resp) >= 400){
    is_package = FALSE
  } else {

  first_line <- strsplit(httr2::resp_body_string(resp), "\n")[[1]][1]
  is_package = grepl("^Package:", first_line)
  }

  if(is.na(is_package)){
    is_package = FALSE
  }

  return(is_package)
}



