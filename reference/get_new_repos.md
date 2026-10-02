# List repositories created by a user or organization within a date window

Unlike
[`list_repos()`](https://cbedwards-dfw.github.io/codeInspectr/reference/list_repos.md),
this includes your own private repositories, since it uses the Github
search API (which returns any repository your token can see).

## Usage

``` r
get_new_repos(owner, since, until = Sys.Date(), include_forks = TRUE)
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

- include_forks:

  Should forks count as new repos? Logical, defaults to TRUE.

## Value

Tibble with `$owner`, `$repo` (e.g. "FRAMverse/framrsquared"),
`$description`, `$private`, `$fork`, `$created` (date), and `$link`.

## Examples

``` r
if (FALSE) { # \dontrun{
get_new_repos("FRAMverse", since = "2026-01-01")
} # }
```
