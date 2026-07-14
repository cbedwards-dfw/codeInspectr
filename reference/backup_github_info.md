# Copy all Issues and PRs for a user or organization

To provide a backup on github failure, this function streamlines
downloading all github Issues and Pull Requests of all repositories of a
focal user or organization into local jsons.

## Usage

``` r
backup_github_info(name, save_location, entity_type = c("user", "org"))
```

## Arguments

- name:

  Name of github user or organization (e.g., "cbedwards-dfw",
  "FRAMverse"). Character atomic.

- save_location:

  Filepath for directory to save issue and pulls to.

- entity_type:

  Either "user" or "org" to identify if `name` is describing a github
  user or github organization. Defaults to "user"

## Value

Invisibly returns a tibble with:

- `$repo_name` = name of repository

- `$full_name` = full github name ({user or org}/{repo name})

- `$issues_path` = filepath to the json of issues

- `$pulls_path` = filepath to the json of pulls

- `$issues_status`, `$pulls_status` = Did the backup work? "success" or
  "error"

- `$issues_error_msg`, `$pulls_error_msg` = error messages on attempting
  to back up (NA if there was no error.)

## Examples

``` r
if (FALSE) { # \dontrun{
## backing up all issues and PRs for repos hosted by `cbedwards-dfw`
out <- backup_github_info("cbedwards-dfw", "user", save_location = "C:/Repos/cbe_github_backups")
} # }
```
