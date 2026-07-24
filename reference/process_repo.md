# Helper function to download issues/pulls of single repo

Intended for use in purr workflow in
[`backup_github_info()`](https://cbedwards-dfw.github.io/codeInspectr/reference/backup_github_info.md).

## Usage

``` r
process_repo(repo_name, repo_address, save_location)
```

## Arguments

- repo_name:

  Name of repository (e.g. "codeInspectr")

- repo_address:

  Full github name (e.g., "FRAMverse/codeInspectr")

- save_location:

  Filepath for directory to save issue and pulls to.

## Value

Tibble with filepaths and success/failure info.
