# Helper function to combine repo names if needed

Helper function to combine repo names if needed

## Usage

``` r
parse_name(
  repo_address = NULL,
  entity_name = NULL,
  repo_name = NULL,
  call = rlang::caller_env()
)
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

- call:

  Ensure error messages mention the calling function.

## Value

A full github name, as in "FRAMverse/codeInspectr"
