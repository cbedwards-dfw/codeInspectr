
#' Copy all Issues and PRs for a user or organization
#'
#' To provide a backup on github failure, this function streamlines downloading all github Issues and Pull Requests of all repositories of a focal user or organization into local jsons.
#'
#' @param name Name of github user or organization (e.g., "cbedwards-dfw", "FRAMverse"). Character atomic.
#' @param save_location Filepath for directory to save issue and pulls to.
#' @param entity_type Either "user" or "org" to identify if `name` is describing a github user or github organization. Defaults to "user"
#'
#' @returns Invisibly returns a tibble with:
#'    - `$repo_name` = name of repository
#'    - `$full_name` = full github name (\{user or org\}/\{repo name\})
#'    - `$issues_path` = filepath to the json of issues
#'    - `$pulls_path` = filepath to the json of pulls
#'    - `$issues_status`, `$pulls_status` = Did the backup work? "success" or "error"
#'    - `$issues_error_msg`, `$pulls_error_msg` = error messages on attempting to back up (NA if there was no error.)
#' @export
#'
#' @examples
#' \dontrun{
#' ## backing up all issues and PRs for repos hosted by `cbedwards-dfw`
#' out <- backup_github_info("cbedwards-dfw", "user", save_location = "C:/Repos/cbe_github_backups")
#'}

backup_github_info <- function(name, save_location, entity_type = c("user", "org")){

  #validate save location
  validate_character(name, n = 1)
  entity_type = rlang::arg_match(entity_type)
  validate_filepath(save_location, n = 1)


  repos_orig <- list_repos(name = name,
             entity_type = entity_type,
             repo_type = "all"
             )

  cli::cli_alert_info("Beginning backups for {nrow(repos_orig)} repos. Minimum runtime: {nrow(repos_orig)/2} seconds.")

  ## actual downloading, tracking process

  repos_df <- repos_orig |>
    dplyr::select(repo_name = "name",
                  "full_name") |>
    dplyr::mutate(result = purrr::pmap(.l = list(repo_name = .data$repo_name,
                                                 repo_address = .data$full_name),
                                       .f = process_repo,
                                                      save_location = .env$save_location)) |>
    tidyr::unnest(.data$result)

  ## write logfile
  text_table <- knitr::kable(repos_df)

  log_file = glue::glue("{save_location}/backup_summary.md")

  file.create(log_file, overwrite = TRUE)

  cat(glue::glue("Backup of issues and PRs for {name} last run {date()}.\n\n\n"),
      file = log_file,
      append = TRUE)

  cat("Table of repos and success/failure:\n==================================\n\n",
      file = log_file,
      append = TRUE)
  cat(text_table, file = log_file,
      sep = "\n",
      append = TRUE)


  return(invisible(repos_df))

}

#' Helper function to download issues/pulls of single repo
#'
#' Intended for use in purr workflow in [backup_github_info()].
#'
#' @param repo_name Name of repository (e.g. "codeInspectr")
#' @param repo_address Full github name (e.g., "FRAMverse/codeInspectr")
#' @inheritParams backup_github_info
#'
#' @returns Tibble with filepaths and success/failure info.
#'
process_repo <- function(repo_name, repo_address, save_location) {

  ## to avoid running afoul of Github rate limites
  Sys.sleep(0.5)

  issues_path <- glue::glue("{save_location}/{repo_name}_issues.json")
  pulls_path  <- glue::glue("{save_location}/{repo_name}_pull_requests.json")

  # safely() turns errors into a $result/$error list instead of stopping execution
  safe_get_issues <- purrr::safely(get_raw_issues)
  safe_get_pulls  <- purrr::safely(get_raw_pulls)

  issues_res <- safe_get_issues(repo_address = repo_address)
  pulls_res  <- safe_get_pulls(repo_address = repo_address)

  # Only write to disk if the fetch succeeded
  if (is.null(issues_res$error)) {
    jsonlite::write_json(issues_res$result, path = issues_path, auto_unbox = TRUE, pretty = TRUE)
  }

  if (is.null(pulls_res$error)) {
    jsonlite::write_json(pulls_res$result, path = pulls_path, auto_unbox = TRUE, pretty = TRUE)
  }

  tibble::tibble(
    issues_path      = if (is.null(issues_res$error)) issues_path else NA_character_,
    pulls_path       = if (is.null(pulls_res$error)) pulls_path else NA_character_,
    issues_status    = if (is.null(issues_res$error)) "success" else "error",
    pulls_status     = if (is.null(pulls_res$error)) "success" else "error",
    issues_error_msg = if (is.null(issues_res$error)) NA_character_ else conditionMessage(issues_res$error),
    pulls_error_msg  = if (is.null(pulls_res$error)) NA_character_ else conditionMessage(pulls_res$error)
  )
}
