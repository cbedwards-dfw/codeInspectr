# Helper function to combine repo names if needed

Helper function to combine repo names if needed

## Usage

``` r
parse_name(
  full_name = NULL,
  entity_name = NULL,
  repo_name = NULL,
  call = rlang::caller_env()
)
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

- call:

  Ensure error messages mention the calling function.

## Value

A full github name, as in "FRAMverse/codeInspectr"
