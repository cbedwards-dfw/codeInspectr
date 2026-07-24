# Create vignettes for R package

If the git repository for an R package contains vignettes, builds them
and saves them in `output_path`, with prefix matching the package name.

## Usage

``` r
compile_vignettes(repo_address, repo_dir, output_path, verbose)
```

## Arguments

- repo_address:

  Github repository "full name" of form `{user}/{repository}`, as in
  `"FRAMverse/framrsquared"`. Also accepts full url (e.g.,
  `"https://github.com/FRAMverse/framrsquared/`) Character atomic.

- repo_dir:

  Temporary filepath for cloned github repository

- output_path:

  Filepath for a directory into which to save manuals. Character atomic.

- verbose:

  Print progress statements? Logical, defaults to `TRUE`.

## Value

Character vector of vignette filepaths (if successful and vignettes
exist) or empty character string
