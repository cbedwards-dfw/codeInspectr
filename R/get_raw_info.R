#' Helper function to combine repo names if needed
#'
#'
#' @param full_name Github identifier in the form of \{name\}/\{repository\}, as in "FRAMverse/codeInspectr". Character string, defaults to NULL. If not provided, users must instead provide the same information in `entity_name` and `repo_name`.
#' @param entity_name Only needed if `full_name` is not provided. Name of a github user or organization repository, e.g., "FRAMverse". Character atomic, defaults to `NULL`.
#' @param repo_name Only needed if `full_name` is not provided. Name of individual repository, e.g., "codeInspectr". Character atomic, defaults to `NULL`.
#' @param call Ensure error messages mention the calling function.
#'
#' @returns A full github name, as in "FRAMverse/codeInspectr"
#'
parse_name <- function(full_name = NULL,
                       entity_name = NULL,
                       repo_name = NULL,
                       call = rlang::caller_env()){

  validate_character(full_name, n = 1, allow_null = TRUE, call = call)
  validate_character(entity_name, n = 1, allow_null = TRUE, call = call)
  validate_character(repo_name, n = 1, allow_null = TRUE, call = call)

  if(is.null(full_name)){
    if(!is.null(entity_name) & !is.null(repo_name)){
      full_name <- paste0(entity_name, "/", repo_name)
    } else {
      cli::cli_abort("You must either provide `full_name` (e.g., 'FRAMverse/framrsquared') or both entity_name (e.g., 'FRAMverse') and repo_name (e.g., 'framrsquared')!", call = call)
    }
  }

  slash_count = stringr::str_count(full_name, "/")
  if(slash_count != 1){
    cli::cli_abort("Full name should contain exactly one /, in the shape of '{entity_name}/{repo_name}. Currently full name contains {slash_count} forward slashes! Current full name: \"{full_name}\".",
                   call = call)
  }

  return(full_name)

}

#' Obtain Github Issues from a repository
#'
#' Returns github issues as a list. Github issues themselves are structured as jsons.
#' If there are no issues (not even closed ones) or issues are not enabled, will error.
#'
#' @inheritParams parse_name
#'
#' @returns A list of class `gh_response` containing all issues from a repository.
#' @export
#'
#' @examples
#' temp <- get_raw_issues("cbedwards-dfw/codeInspectr")
#' head(temp[[1]])
get_raw_issues <- function(full_name = NULL,
                           entity_name = NULL,
                           repo_name = NULL){

  full_name <- parse_name(full_name = full_name, entity_name = entity_name, repo_name = repo_name)


  cur_issues <- gh::gh("/repos/{full_name}/issues", full_name = full_name)

  return(cur_issues)
}

#' Obtain Github pull requests from a repository
#'
#' Returns github issues as a list. Github issues themselves are structured as jsons.
#' If there are no issues (not even closed ones) or issues are not enabled, will error.
#'
#' @inheritParams parse_name
#'
#' @returns A list of class `gh_response` containing all pull requests from a repository.
#' @export
#'
#' @examples
#' # temp <- get_raw_pulls("cbedwards-dfw/codeInspectr")
#' #  head(temp[[1]])
get_raw_pulls <- function(full_name = NULL,
                          entity_name = NULL,
                          repo_name = NULL){

  full_name <- parse_name(full_name = full_name, entity_name = entity_name, repo_name = repo_name)

  cur_pulls <- gh::gh("/repos/{full_name}/pulls", full_name = full_name)

  return(cur_pulls)
}

