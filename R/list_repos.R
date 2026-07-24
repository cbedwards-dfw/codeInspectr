#' List all repositories of a Github user or organization
#'
#' Creates a dataframe of repositories and associated info for the
#' user or organization specified
#'
#' @param name Name of user or organization (e.g., "FRAMverse" or "cbedwards-dfw"). Character atomic.
#' @param entity_type Is this a Github User ("user") or organization ("org")? Character atomic, defaults to "user".
#' @param repo_type List "all" repos, "public" repos, "private" repos, or only "fork" repos? Character atomic, defaults to "all". Private repos will only be provided if you have access to the private repos of that user or org.
#' @param r_package_status Check if each repository is an R package. Increases runtime considerably (e.g., ~1 sec per repo). Logical, defaults to FALSE
#'
#' @returns Data frame of repositories with columns
#'  - `$name`: repository name, e.g., "codeInspectr"
#'  - `$full_name`: \{user/org\}/\{repository name\}, e.g., "FRAMverse/codeInspectr"
#'  - `$html_url`: web address of repository
#'  - `$description`: description listed for the repository.
#'  - `$stars`: number of followers of the repository
#'  - `$language`: programming language(s) of the repository.
#'  - `$default_branch`: the name of the default branch (e.g., "main").
#'  - `$r_package`: is the repository an R package? Logical, only present for optional argument `r_package_status = TRUE`.
#' @export
#'
#' @examples
#' list_repos("FRAMverse", entity_type = "org", repo_type = "public")
#'
list_repos <- function(name,
                       entity_type = c("user", "org"),
                       repo_type = c("all", "public", "private", "forks"),
                       r_package_status = FALSE){

  validate_character(name, n = 1)
  entity_type <- rlang::arg_match(entity_type)
  repo_type <- rlang::arg_match(repo_type)
  validate_flag(r_package_status)

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
                              language = .x$language,
                              default_branch = .x$default_branch
                            )
  )
  if(r_package_status){
    repo_df <- repo_df |>
      dplyr::rowwise() |>
      dplyr::mutate(r_package = dplyr::if_else(.data$language == "R",
                                        is_r_package(.data$full_name, default_branch = .data$default_branch),
                                        FALSE)) |>
      dplyr::ungroup()
  }

  return(repo_df)

}

# temp <- gh::gh("/users/cbedwards-dfw/repos")

