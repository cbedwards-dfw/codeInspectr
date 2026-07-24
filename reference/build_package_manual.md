# Build manual (and optionally vignettes) for individual repository

For an R package stored on Github, compile a pdf reference manual and
optionally build any vignettes. Requires LaTeX to run. Under the hood,
downloads temporary copy of github repo, compiles document(s), then
deletes repository.

## Usage

``` r
build_package_manual(
  repo_address,
  output_path,
  build_vignettes = FALSE,
  verbose = TRUE
)
```

## Arguments

- repo_address:

  Github repository "full name" of form `{user}/{repository}`, as in
  `"FRAMverse/framrsquared"`. Also accepts full url (e.g.,
  `"https://github.com/FRAMverse/framrsquared/`) Character atomic.

- output_path:

  Filepath for a directory into which to save manuals. Character atomic.

- build_vignettes:

  Attempt to build vignettes for any package that has them? Logical,
  defaults to `FALSE`.

- verbose:

  Print progress statements? Logical, defaults to `TRUE`.

## Value

Nothing

## Examples

``` r
if (FALSE) { # \dontrun{
build_package_manual(repo = "FRAMverse/framrsquared",
  output_path = "C:/Repos/test_manuals",
  build_vignettes = TRUE)
} # }
```
