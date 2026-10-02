#' Summarize Github activity across all repositories of users or organizations
#'
#' Counts issues closed, pull requests opened, pull requests merged, and new
#' repositories created since a given date, across every repository owned by
#' the users and/or organizations in `owners`. Uses the Github search API, so
#' private repositories are included whenever your Github token can see them.
#'
#' @param owners Github users and/or organizations whose repositories should be
#'   summarized, e.g. `c("cbedwards-dfw", "FRAMverse")`. Character vector. Whether
#'   each owner is a user or an organization is detected automatically.
#' @param since Start of the reporting window (inclusive). Date, or character in
#'   "YYYY-MM-DD" form.
#' @param until End of the reporting window (inclusive). Date, or character in
#'   "YYYY-MM-DD" form. Optional, Defaults to today.
#' @param author Optional Github username. If provided, pull request counts are
#'   restricted to pull requests authored by this person. Use `"@me"` for the
#'   account your Github token belongs to. Issue counts are not affected, since
#'   Github search cannot filter by who closed an issue. Character atomic,
#'   defaults to `NULL` (all authors).
#' @param include_forks Count newly created forks as new repositories? Logical,
#'   defaults to `TRUE`.
#' @param verbose Print a summary to the console? Logical, defaults to `TRUE`.
#'
#' @returns A list with
#'  - `$totals`: one row per owner (plus a "TOTAL" row) with columns
#'    `$issues_closed`, `$prs_opened`, `$prs_merged`, and `$repos_created`.
#'  - `$by_repo`: the same issue and pull request counts for each repository
#'    with any activity in the window.
#'  - `$items`: one row per issue or pull request counted, with links (see
#'    [get_github_activity()]). Issues closed as "not planned" can be dropped
#'    with `dplyr::filter(items, state_reason != "not_planned")`.
#'  - `$new_repos`: repositories created in the window (see [get_new_repos()]).
#'  - `$since`, `$until`: the reporting window.
#' @export
#'
#' @seealso [get_github_activity()], [get_new_repos()], [list_repos()]
#'
#' @examples
#' \dontrun{
#' activity <- summarize_github_activity(c("cbedwards-dfw", "FRAMverse"),
#'                                       since = "2026-01-01")
#' activity$totals
#'
#' ## only count pull requests you wrote yourself
#' summarize_github_activity("FRAMverse", since = "2026-01-01", author = "@me")
#' }
summarize_github_activity <- function(owners,
                                      since,
                                      until = Sys.Date(),
                                      author = NULL,
                                      include_forks = TRUE,
                                      verbose = TRUE){

  validate_character(owners)
  since <- validate_date(since)
  until <- validate_date(until)
  if(until < since){
    cli::cli_abort("{.arg until} ({until}) must not be earlier than {.arg since} ({since}).")
  }
  validate_character(author, n = 1, allow_null = TRUE)
  validate_flag(include_forks)
  validate_flag(verbose)

  owners <- unique(owners)

  items <- purrr::map(owners,
                      \(x) get_github_activity(x, since = since, until = until, author = author)) |>
    purrr::list_rbind()

  new_repos <- purrr::map(owners,
                          \(x) get_new_repos(x, since = since, until = until, include_forks = include_forks)) |>
    purrr::list_rbind()

  activity_types <- c("issues_closed", "prs_opened", "prs_merged")

  by_repo <- items |>
    dplyr::count(.data$owner, .data$repo, .data$activity) |>
    tidyr::pivot_wider(names_from = "activity", values_from = "n", values_fill = 0L)
  for(a in setdiff(activity_types, names(by_repo))){
    by_repo[[a]] <- rep(0L, nrow(by_repo))
  }
  by_repo <- by_repo |>
    dplyr::select("owner", "repo", dplyr::all_of(activity_types)) |>
    dplyr::arrange(.data$owner, .data$repo)

  totals <- tibble::tibble(owner = owners) |>
    dplyr::left_join(
      by_repo |>
        dplyr::group_by(.data$owner) |>
        dplyr::summarise(dplyr::across(dplyr::all_of(activity_types), sum)),
      by = "owner") |>
    dplyr::left_join(dplyr::count(new_repos, .data$owner, name = "repos_created"),
                     by = "owner") |>
    dplyr::mutate(dplyr::across(-"owner", \(x) dplyr::coalesce(as.integer(x), 0L)))

  totals <- dplyr::bind_rows(
    totals,
    totals |>
      dplyr::summarise(dplyr::across(-"owner", sum)) |>
      dplyr::mutate(owner = "TOTAL", .before = 1)
  )

  if(verbose){
    grand <- totals[totals$owner == "TOTAL", ]
    cli::cli_h2("Github activity, {since} to {until}")
    cli::cli_text("Owners: {.val {owners}}")
    if(!is.null(author)){
      cli::cli_text("Pull requests restricted to author {.val {author}}")
    }
    cli::cli_bullets(c(
      "*" = "Issues closed: {grand$issues_closed}",
      "*" = "Pull requests opened: {grand$prs_opened}",
      "*" = "Pull requests merged: {grand$prs_merged}",
      "*" = "New repositories: {grand$repos_created}"
    ))
  }

  list(totals = totals,
       by_repo = by_repo,
       items = items,
       new_repos = new_repos,
       since = since,
       until = until)
}

#' List issues closed and pull requests opened or merged for a user or organization
#'
#' Searches all repositories owned by a Github user or organization for issues
#' closed, pull requests opened, and pull requests merged within a date window.
#' Github search returns at most 1,000 results per query; when a window holds
#' more than that, it is split into smaller windows automatically.
#'
#' @param owner Github user or organization, e.g. "FRAMverse". Character atomic.
#' @inheritParams summarize_github_activity
#'
#' @returns Tibble with one row per issue or pull request, with columns
#'  - `$owner`: the user or organization searched
#'  - `$repo`: repository address, e.g. "FRAMverse/framrsquared"
#'  - `$activity`: "issues_closed", "prs_opened", or "prs_merged". A pull request
#'    opened and merged in the window appears once under each.
#'  - `$number`, `$title`, `$author`: issue or pull request number, title, and
#'    author's Github username
#'  - `$state_reason`: for issues, "completed", "not_planned", or `NA`
#'  - `$created`, `$closed`, `$merged`: dates
#'  - `$link`: web address
#' @export
#'
#' @examples
#' \dontrun{
#' get_github_activity("FRAMverse", since = "2026-01-01")
#' }
get_github_activity <- function(owner, since, until = Sys.Date(), author = NULL){

  validate_character(owner, n = 1)
  since <- validate_date(since)
  until <- validate_date(until)
  validate_character(author, n = 1, allow_null = TRUE)

  scope <- owner_qualifier(owner)
  if(is.null(author)){
    pr_author <- ""
  } else {
    pr_author <- paste0(" author:", author)
  }

  queries <- tibble::tribble(
    ~q,                                                ~status,     ~activity,
     glue::glue("{scope} is:issue is:closed"),          "closed",   "issues_closed",
     glue::glue("{scope} is:pr{pr_author}"),            "created",  "prs_opened",
     glue::glue("{scope} is:pr is:merged{pr_author}"),  "merged",   "prs_merged"

  )

  purrr::pmap_df(queries, \(q, status, activity){
      search_github("issues", q, status, since, until) |>
      parse_issue_items(activity = activity)
  })|>
    dplyr::mutate(owner = owner, .before = 1)

}

#' List repositories created by a user or organization within a date window
#'
#' Unlike [list_repos()], this includes your own private repositories, since it
#' uses the Github search API (which returns any repository your token can see).
#'
#' @inheritParams get_github_activity
#' @param include_forks Should forks count as new repos? Logical, defaults to TRUE.
#'
#' @returns Tibble with `$owner`, `$repo` (e.g. "FRAMverse/framrsquared"),
#'   `$description`, `$private`, `$fork`, `$created` (date), and `$link`.
#' @export
#'
#' @examples
#' \dontrun{
#' get_new_repos("FRAMverse", since = "2026-01-01")
#' }
get_new_repos <- function(owner, since, until = Sys.Date(), include_forks = TRUE){

  validate_character(owner, n = 1)
  since <- validate_date(since)
  until <- validate_date(until)
  validate_flag(include_forks)

  ## repository search leaves out forks unless asked for them
  q <- paste0(owner_qualifier(owner), if(include_forks) " fork:true" else "")

  search_github("repositories", q, "created", since, until) |>
    parse_repo_items() |>
    dplyr::mutate(owner = owner, .before = 1)
}


# Internal helpers --------------------------------------------------------

## search_github() paces itself to stay under the search API rate limit
## (30 requests per minute when authenticated).
.search_state <- new.env(parent = emptyenv())

search_pause <- function(min_gap = 2.1){
  last <- .search_state$last_call
  if(!is.null(last)){
    wait <- min_gap - as.numeric(difftime(Sys.time(), last, units = "secs"))
    if(wait > 0) Sys.sleep(wait)
  }
  .search_state$last_call <- Sys.time()
}

## one page of results from the Github search API
search_page <- function(endpoint, q, page){
  search_pause()
  gh::gh("GET /search/{search_type}", search_type = endpoint,
         q = q, per_page = 100, page = page)
}

## Every item matching `q` with `date_field` in since..until. Github stops at
## 1,000 results per query, so larger windows are split in half recursively.
search_github <- function(endpoint, q, date_field, since, until){
  full_q <- glue::glue("{q} {date_field}:{format(since)}..{format(until)}")
  first <- search_page(endpoint, full_q, page = 1)
  total <- first$total_count

  if (is.null(total)) {
    cli::cli_abort("Response from search_page is missing {.field total_count}; got {.obj_type_friendly first}.")
  }

  if(total > 1000){
    if(until > since){
      mid <- since + floor(as.numeric(until - since) / 2)
      return(c(search_github(endpoint, q, date_field, since, mid),
               search_github(endpoint, q, date_field, mid + 1, until)))
    }
    cli::cli_warn("More than 1,000 results for {.val {full_q}} on a single day; only the first 1,000 are included.")
  }

  items <- first$items
  n_pages <- ceiling(min(total, 1000) / 100)
  if(n_pages > 1){
    for(page in 2:n_pages){
      items <- c(items, search_page(endpoint, full_q, page = page)$items)
    }
  }
  items
}

## search qualifier for a user ("user:x") or organization ("org:x")
owner_qualifier <- function(owner){
  type <- gh::gh("/users/{owner}", owner = owner)$type
  if(identical(type, "Organization")) paste0("org:", owner) else paste0("user:", owner)
}

null_to_na <- function(x, na = NA_character_){
  if(is.null(x)) na else x
}

parse_issue_items <- function(items, activity){
  if(length(items) == 0){
    return(tibble::tibble(repo = character(), activity = character(), number = integer(),
                          title = character(), author = character(), state_reason = character(),
                          created = as.Date(character()), closed = as.Date(character()),
                          merged = as.Date(character()), link = character()))
  }
  purrr::map(items, \(x){
    tibble::tibble(
      repo = sub("^.*/repos/", "", x$repository_url),
      activity = activity,
      number = as.integer(x$number),
      title = x$title,
      author = null_to_na(x$user$login),
      state_reason = null_to_na(x$state_reason),
      created = as.Date(null_to_na(x$created_at)),
      closed = as.Date(null_to_na(x$closed_at)),
      merged = as.Date(null_to_na(x$pull_request$merged_at)),
      link = x$html_url
    )
  }) |>
    purrr::list_rbind()
}

parse_repo_items <- function(items){
  if(length(items) == 0){
    return(tibble::tibble(repo = character(), description = character(), private = logical(),
                          fork = logical(), created = as.Date(character()), link = character()))
  }
  purrr::map(items, \(x){
    tibble::tibble(
      repo = x$full_name,
      description = null_to_na(x$description),
      private = isTRUE(x$private),
      fork = isTRUE(x$fork),
      created = as.Date(x$created_at),
      link = x$html_url
    )
  }) |>
    purrr::list_rbind()
}



