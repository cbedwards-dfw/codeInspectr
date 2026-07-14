# Obtain Github Issues from a repository

Returns github issues as a list. Github issues themselves are structured
as jsons.

## Usage

``` r
get_raw_issues(full_name = NULL, entity_name = NULL, repo_name = NULL)
```

## Arguments

- full_name:

  Github identifier in the form of {name}/{repository}, as in
  "FRAMverse/codeInspectr". Character string, defaults to NULL. If not
  provided, users must instead provide the same information in
  `entity_name` and `repo_name`.

- entity_name:

  Only needed if `full_name` is not provided. Name of a github user or
  organization repository, e.g., "FRAMverse". Character atomic, defaults
  to `NULL`.

- repo_name:

  Only needed if `full_name` is not provided. Name of individual
  repository, e.g., "codeInspectr". Character atomic, defaults to
  `NULL`.

## Value

A list of class `gh_response` containing all issues from a repository.

## Examples

``` r
temp <- get_raw_issues("cbedwards-dfw/codeInspectr")
```
