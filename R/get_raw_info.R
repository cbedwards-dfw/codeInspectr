#' Helper function to combine repo names if needed
#'
#'
#' @param repo_address Github identifier in the form of \{name\}/\{repository\}, as in "FRAMverse/codeInspectr".
#' Can also be in the form of full URL (e.g. "https://github.com/FRAMverse/framrsquared/").
#' Character string, defaults to NULL. If not provided, users must instead provide the same information in `entity_name` and `repo_name`.
#' @param entity_name Only needed if `repo_address` is not provided. Name of a github user or organization repository, e.g., "FRAMverse". Character atomic, defaults to `NULL`.
#' @param repo_name Only needed if `repo_address` is not provided. Name of individual repository, e.g., "codeInspectr". Character atomic, defaults to `NULL`.
#' @param call Ensure error messages mention the calling function.
#'
#' @returns A full github name, as in "FRAMverse/codeInspectr"
#'
parse_name <- function(repo_address = NULL,
                       entity_name = NULL,
                       repo_name = NULL,
                       call = rlang::caller_env()){


  repo_address = github_to_repo_address(repo_address, allow_null = TRUE, call = call)
  validate_character(entity_name, n = 1, allow_null = TRUE, call = call)
  validate_character(repo_name, n = 1, allow_null = TRUE, call = call)

  if(is.null(repo_address)){
    if(!is.null(entity_name) & !is.null(repo_name)){
      repo_address <- paste0(entity_name, "/", repo_name)
    } else {
      cli::cli_abort("You must either provide `repo_address` (e.g., 'FRAMverse/framrsquared') or both entity_name (e.g., 'FRAMverse') and repo_name (e.g., 'framrsquared')!", call = call)
    }
  }

  slash_count = stringr::str_count(repo_address, "/")
  if(slash_count != 1){
    cli::cli_abort("Repo address should contain exactly one /, in the shape of '{entity_name}/{repo_name}. Currently full name contains {slash_count} forward slashes! Current full name: \"{repo_address}\".",
                   call = call)
  }

  return(repo_address)

}

#' Obtain Github Issues from a repository
#'
#' Returns github issues as a list. Github issues themselves are structured as jsons.
#'
#' @inheritParams parse_name
#'
#' @returns A list of class `gh_response` containing all issues from a repository.
#' @export
#'
#' @examples
#' temp <- get_raw_issues("cbedwards-dfw/codeInspectr")
get_raw_issues <- function(repo_address = NULL,
                           entity_name = NULL,
                           repo_name = NULL){

  repo_address <- parse_name(repo_address = repo_address, entity_name = entity_name, repo_name = repo_name)


  cur_issues <- gh::gh("/repos/{repo_address}/issues", repo_address = repo_address)

  return(cur_issues)
}

#' Obtain Github pull requests from a repository
#'
#' Returns github issues as a list. Github issues themselves are structured as jsons.
#'
#' @inheritParams parse_name
#'
#' @returns A list of class `gh_response` containing all pull requests from a repository.
#' @export
#'
#' @examples
#' # temp <- get_raw_pulls("cbedwards-dfw/codeInspectr")
get_raw_pulls <- function(repo_address = NULL,
                          entity_name = NULL,
                          repo_name = NULL){

  repo_address <- parse_name(repo_address = repo_address, entity_name = entity_name, repo_name = repo_name)

  cur_pulls <- gh::gh("/repos/{repo_address}/pulls", repo_address = repo_address)

  return(cur_pulls)
}

