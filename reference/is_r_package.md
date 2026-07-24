# Test if repository is an R package

Uses the existence of a DESCRIPTION file and the first line being
"Package:..." to decide if the provided repository is an R package.
Accesses first few lines of DESCRIPTION in `raw.githubusercontent.com/`
for speed.

## Usage

``` r
is_r_package(repo_address, default_branch = "main")
```

## Arguments

- repo_address:

  Repository name including user or organization prefix, e.g.,
  "FRAMverse/framrsquared". Character atomic

- default_branch:

  Name of the default/primary repository. Character atomic, defaults to
  "main". Older repositories often use "master" as the default repo
  name.

## Value

Logical: `TRUE` if the repo is an R package, `FALSE` if it is not.

## Examples

``` r
# framrsquared is an R package
is_r_package("FRAMverse/framrsquared")
#> [1] TRUE
# the snippets repository is not.
is_r_package("FRAMverse/snippets")
#> [1] FALSE
```
