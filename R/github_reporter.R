#' Return active branches and the most recent updates of github repository
#'
#' Summarizes recent activity on a remote github repository, listing active branches and their
#' most recent updates. #' Will only process the first 100 branches of a repository.
#' Repository does not need to be an R package, or even contain R code. Will not
#' list activity for "gh-pages", which is the branch used for pkgdown.
#'
#' @param repo_address Github repository address, of the form "user/repository",
#' as in `"FRAMverse/framrsquared"`. Does not need to be an R package.
#'
#' @return Dataframe with `$branch` (branch name) and `$most_recent_update` (date of most recent commit)
#' @export
#'
#' @examples
#' get_branch_activity("FRAMverse/framrsquared")
#' get_branch_activity("tidyverse/dplyr")
get_branch_activity <- function(repo_address){

  owner = gsub("/.*", "", repo_address)
  name = gsub(".*/", "", repo_address)

  gh_query <- sprintf('{
  repository(owner: "%s", name: "%s") {
    refs(refPrefix: "refs/heads/", first: 100) {
      nodes {
        name
        target {
          ... on Commit {
            committedDate
          }
        }
      }
    }
  }
}',
                      owner, name)

  res <- gh::gh_gql(gh_query)
  res_focused <- res$data$repository$refs$nodes
  purrr::map(res_focused,
             .f = \(x){data.frame(branch = x$name, timestamp = x$target$committedDate)}) |>
    do.call(rbind, args = _) |>
    dplyr::mutate(most_recent_update = as.Date(.data$timestamp),
                  link = glue::glue("https://github.com/{repo_address}/tree/{.data$branch}")) |>
    dplyr::select(-.data$timestamp) |>
    dplyr::arrange(dplyr::desc(.data$most_recent_update)) |>
    dplyr::filter(.data$branch != "gh-pages")
}

#' Return summary of open Github Pull Requests
#'
#' Including title, initial text of body, and date
#'
#' @inheritParams get_branch_activity
#' @param max_char Maximum number of characters to return in the "body" column.
#'
#' @return dataframe with `$title`, `$body`, and `$date` of open pull requests.
#' @export
#'
#' @examples
#' get_pull_requests("FRAMverse/framrsquared")
#' get_pull_requests("tidyverse/dplyr")
get_pull_requests <- function(repo_address, max_char = 97) {

  owner = gsub("/.*", "", repo_address)
  name = gsub(".*/", "", repo_address)

  # First page
  q1 <- sprintf('{
    repository(owner: "%s", name: "%s") {
      pullRequests(
        first: 100,
        states: OPEN,
        orderBy: {field: CREATED_AT, direction: DESC}
      ) {
        pageInfo { hasNextPage endCursor }
        nodes {
          title
          createdAt
          body
          url
          assignees(first: 10) { nodes { login } }
        }
      }
    }
  }', owner, name)

  resp <- gh::gh_gql(q1)

  extract <- function(nodes){
    if(length(nodes)>0){
      results <- nodes |>
        purrr::map(.f = function(pr) {
          data.frame(
            title = pr$title,
            creation_ts = pr$createdAt,
            body = pr$body,
            link = pr$url)
        }) |>
        do.call(rbind, args = _) |>
        dplyr::mutate(body = dplyr::if_else(nchar(.data$body) > max_char,
                                     glue::glue("{substr(.data$body, start = 1, stop = max_char)}..."),
                                     .data$body)) |>
        dplyr::mutate(date = as.Date(.data$creation_ts),
                      .before = "link") |>
        dplyr::select(-.data$creation_ts)
    } else {
      results = NULL
    }
    return(results)
  }

  results = extract(resp$data$repository$pullRequests$nodes)


  page <- resp$data$repository$pullRequests$pageInfo

  # Paginated pages
  q_next_template <- sprintf('{
    repository(owner: "%s", name: "%s") {
      pullRequests(
        first: 100,
        after: "%%s",
        states: OPEN,
        orderBy: {field: CREATED_AT, direction: DESC}
      ) {
        pageInfo { hasNextPage endCursor }
        nodes {
          title
          createdAt
          body
          url
          assignees(first: 10) { nodes { login } }
        }
      }
    }
  }', owner, name)

  while (page$hasNextPage) {
    q_next <- sprintf(q_next_template, page$endCursor)
    resp <- gh::gh_gql(q_next)
    results_cur <- extract(resp$data$repository$pullRequests$nodes)
    results <- rbind(results, results_cur)
    page <- resp$repository$pullRequests$pageInfo
  }

  return(results)
}

#' Return summary of open Github Issues
#'
#' @inheritParams get_pull_requests
#'
#' @return dataframe with `$title`, `$body`, and `$date` of open issues.
#' @export
#'
#' @examples
#' get_issues("FRAMverse/framrsquared")
#' get_issues("tidyverse/dplyr")
get_issues <- function(repo_address, max_char = 97) {

  owner = gsub("/.*", "", repo_address)
  name = gsub(".*/", "", repo_address)

  # First page
  q1 <- sprintf('{
    repository(owner: "%s", name: "%s") {
      issues(
        first: 100,
        states: OPEN,
        orderBy: {field: CREATED_AT, direction: DESC}
      ) {
        pageInfo { hasNextPage endCursor }
        nodes {
          title
          createdAt
          body
          url
          assignees(first: 10) {
            nodes {
              login
            }
          }

        }
      }
    }
  }', owner, name)

  resp <- gh::gh_gql(q1)

  extract <- function(nodes){
    if(length(nodes)>0){
      results <- nodes |>
        purrr::map(.f = function(x) {
          data.frame(
            title = x$title,
            creation_ts = x$createdAt,
            body = x$body,
            link = x$url)
        }) |>
        do.call(rbind, args = _) |>
        dplyr::mutate(body = dplyr::if_else(nchar(.data$body) > max_char,
                                     glue::glue("{substr(.data$body, start = 1, stop = max_char)}..."),
                                     .data$body)) |>
        dplyr::mutate(date = as.Date(.data$creation_ts),
                      .before = "link") |>
        dplyr::select(-.data$creation_ts)
    } else {
      results = NULL
    }
    return(results)
  }

  results = extract(resp$data$repository$issues$nodes)


  page <- resp$data$repository$issues$pageInfo

  # Paginated pages
  q_next_template <- sprintf('{
    repository(owner: "%s", name: "%s") {
      issues(
        first: 100,
        after: "%%s",
        states: OPEN,
        orderBy: {field: CREATED_AT, direction: DESC}
      ) {
        pageInfo { hasNextPage endCursor }
        nodes {
          title
        createdAt
        body
        url
        assignees(first: 10) {
          nodes {
            login
          }
        }

        }
      }
    }
  }', owner, name)

  while (page$hasNextPage) {
    q_next <- sprintf(q_next_template, page$endCursor)
    resp <- gh::gh_gql(q_next)
    results_cur <- extract(resp$data$repository$issues$nodes)
    results <- rbind(results, results_cur)
    page <- resp$repository$issues$pageInfo
  }

  return(results)
}


#' Summarize information about a github R package
#'
#'
#'
#' @param repo_address Github repository address for an R package, of the form "user/repository",
#' as in `"FRAMverse/framrsquared"`
#' @inheritParams get_pull_requests
#'
#' @return List summarizing github repository information.
#' @export
#'
#' @seealso [get_issues()], [get_pull_requests()], [get_branch_activity()]
#'
#' @examples
#' summarize_repository("FRAMverse/framrsquared")
#' summarize_repository("cbedwards-dfw/xldiff")
summarize_repository <- function(repo_address, max_char = 70){

  ## updates
  branch_activity <- get_branch_activity(repo_address = repo_address)

  ## issues
  issues <- get_issues(repo_address = repo_address, max_char = max_char)

  ## PRs
  pull_requests = get_pull_requests(repo_address = repo_address, max_char = max_char)

  ## repo description
  repo_description <- gh::gh(glue::glue("GET /repos/{repo_address}"))$description

  ## dependencies
  description_url = glue::glue("https://raw.githubusercontent.com/{repo_address}/main/DESCRIPTION")
  description_raw <- readLines(description_url)
  ## skip the "Description: line, as it sometimes contains
  ## special characters that read_yaml doesn't like
  repo_long_summary <-grep("^Description:",
                           x = description_raw,
                           value = TRUE)
  repo_long_summary <- gsub("^Description:[ ]*",
                            "",
                            repo_long_summary)
  description_raw <- grep("^Description:",
                          x = description_raw,
                          value = TRUE, invert = TRUE)
  desc_yaml <- yaml::read_yaml(text = description_raw)
  framverse_dependencies <- desc_yaml$Remotes

  return(list(repo = basename(repo_address),
              repo_address = repo_address,
              repo_description = repo_description,
              repo_long_summary = repo_long_summary,
              branch_activity = branch_activity,
              issues = issues,
              pull_requests = pull_requests,
              github_dependencies = framverse_dependencies))
}

