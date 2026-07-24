# Obtain Github pull requests from a repository

Returns github issues as a list. Github issues themselves are structured
as jsons.

## Usage

``` r
get_raw_pulls(repo_address = NULL, entity_name = NULL, repo_name = NULL)
```

## Arguments

- repo_address:

  Github identifier in the form of {name}/{repository}, as in
  "FRAMverse/codeInspectr". Can also be in the form of full URL (e.g.
  "https://github.com/FRAMverse/framrsquared/"). Character string,
  defaults to NULL. If not provided, users must instead provide the same
  information in `entity_name` and `repo_name`.

- entity_name:

  Only needed if `repo_address` is not provided. Name of a github user
  or organization repository, e.g., "FRAMverse". Character atomic,
  defaults to `NULL`.

- repo_name:

  Only needed if `repo_address` is not provided. Name of individual
  repository, e.g., "codeInspectr". Character atomic, defaults to
  `NULL`.

## Value

A list of class `gh_response` containing all pull requests from a
repository.

## Examples

``` r
# temp <- get_raw_pulls("cbedwards-dfw/codeInspectr")
```
