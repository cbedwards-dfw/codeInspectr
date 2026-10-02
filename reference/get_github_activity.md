# List issues closed and pull requests opened or merged for a user or organization

Searches all repositories owned by a Github user or organization for
issues closed, pull requests opened, and pull requests merged within a
date window. Github search returns at most 1,000 results per query; when
a window holds more than that, it is split into smaller windows
automatically.

## Usage

``` r
get_github_activity(owner, since, until = Sys.Date(), author = NULL)
```

## Arguments

- owner:

  Github user or organization, e.g. "FRAMverse". Character atomic.

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

## Value

Tibble with one row per issue or pull request, with columns

- `$owner`: the user or organization searched

- `$repo`: repository address, e.g. "FRAMverse/framrsquared"

- `$activity`: "issues_closed", "prs_opened", or "prs_merged". A pull
  request opened and merged in the window appears once under each.

- `$number`, `$title`, `$author`: issue or pull request number, title,
  and author's Github username

- `$state_reason`: for issues, "completed", "not_planned", or `NA`

- `$created`, `$closed`, `$merged`: dates

- `$link`: web address

## Examples

``` r
if (FALSE) { # \dontrun{
get_github_activity("FRAMverse", since = "2026-01-01")
} # }
```
