# Summarize Github activity across all repositories of users or organizations

Counts issues closed, pull requests opened, pull requests merged, and
new repositories created since a given date, across every repository
owned by the users and/or organizations in `owners`. Uses the Github
search API, so private repositories are included whenever your Github
token can see them.

## Usage

``` r
summarize_github_activity(
  owners,
  since,
  until = Sys.Date(),
  author = NULL,
  include_forks = TRUE,
  verbose = TRUE
)
```

## Arguments

- owners:

  Github users and/or organizations whose repositories should be
  summarized, e.g. `c("cbedwards-dfw", "FRAMverse")`. Character vector.
  Whether each owner is a user or an organization is detected
  automatically.

- since:

  Start of the reporting window (inclusive). Date, or character in
  "YYYY-MM-DD" form.

- until:

  End of the reporting window (inclusive). Date, or character in
  "YYYY-MM-DD" form. Optional, Defaults to today.

- author:

  Optional Github username. If provided, pull request counts are
  restricted to pull requests authored by this person. Use `"@me"` for
  the account your Github token belongs to. Issue counts are not
  affected, since Github search cannot filter by who closed an issue.
  Character atomic, defaults to `NULL` (all authors).

- include_forks:

  Count newly created forks as new repositories? Logical, defaults to
  `TRUE`.

- verbose:

  Print a summary to the console? Logical, defaults to `TRUE`.

## Value

A list with

- `$totals`: one row per owner (plus a "TOTAL" row) with columns
  `$issues_closed`, `$prs_opened`, `$prs_merged`, and `$repos_created`.

- `$by_repo`: the same issue and pull request counts for each repository
  with any activity in the window.

- `$items`: one row per issue or pull request counted, with links (see
  [`get_github_activity()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_github_activity.md)).
  Issues closed as "not planned" can be dropped with
  `dplyr::filter(items, state_reason != "not_planned")`.

- `$new_repos`: repositories created in the window (see
  [`get_new_repos()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_new_repos.md)).

- `$since`, `$until`: the reporting window.

## See also

[`get_github_activity()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_github_activity.md),
[`get_new_repos()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_new_repos.md),
[`list_repos()`](https://cbedwards-dfw.github.io/codeInspectr/reference/list_repos.md)

## Examples

``` r
if (FALSE) { # \dontrun{
activity <- summarize_github_activity(c("cbedwards-dfw", "FRAMverse"),
                                      since = "2026-01-01")
activity$totals

## only count pull requests you wrote yourself
summarize_github_activity("FRAMverse", since = "2026-01-01", author = "@me")
} # }
```
