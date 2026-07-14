#' List all repositories of a Github user or organization
#'
#' Creates a dataframe of repositories and associated info for the
#' user or organization specified
#'
#' @param name Name of user or organization (e.g., "FRAMverse" or "cbedwards-dfw"). Character atomic.
#' @param entity_type Is this a Github User ("user") or organization ("org")? Character atomic, defaults to "user".
#' @param repo_type List "all" repos, "public" repos, "private" repos, or only "fork" repos? Character atomic, defaults to "all". Private repos will only be provided if you have access to the private repos of that user or org.
#'
#' @returns Data frame of repositories with columns
#'  - `$name`: repository name, e.g., "codeInspectr"
#'  - `$full_name`: \{user/org\}/\{repository name\}, e.g., "FRAMverse/codeInspectr"
#'  - `$html_url`: web address of repository
#'  - `$description`: description listed for the repository.
#'  - `$stars`: number of followers of the repository
#'  - `$language`: programming language(s) of the repository.
#' @export
#'
#' @examples
#' list_repos("FRAMverse", entity_type = "org", repo_type = "public")
#'
list_repos <- function(name,
                       entity_type = c("user", "org"),
                       repo_type = c("all", "public", "private", "forks")){

  validate_character(name, n = 1)
  entity_type <- rlang::arg_match(entity_type)
  repo_type <- rlang::arg_match(repo_type)

  repos <- gh::gh("/{entity_type}s/{name}/repos",
                  type = repo_type,
                  .limit = Inf,
                  entity_type = entity_type,
                  name = name)

  repo_df <- purrr::map_dfr(repos,
                            ~ dplyr::tibble(
                              name = .x$name,
                              full_name = .x$full_name,
                              html_url = .x$html_url,
                              description = .x$description,
                              stars = .x$stargazers_count,
                              language = .x$language
                            )
  )

  return(repo_df)

}
