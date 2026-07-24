# Build edges of all function dependencies in package

Build edges of all function dependencies in package

## Usage

``` r
build_package_network(package_name, include = "package only")
```

## Arguments

- package_name:

  package name as character string

- include:

  Should only package functions be returned ("package only"), or all
  functions except for base R operators ("no operators"), or all
  functions ("all")?

## Value

dataframe of dependency edges, with `$from` and `$to`

## Examples

``` r
build_package_network("codeInspectr")
#>                           from                          to
#> 1           backup_github_info                  list_repos
#> 2           backup_github_info          validate_character
#> 3           backup_github_info           validate_filepath
#> 4         build_package_manual           compile_vignettes
#> 5         build_package_manual      github_to_repo_address
#> 6         build_package_manual             safe_dir_delete
#> 7         build_package_manual           validate_filepath
#> 8         build_package_manual               validate_flag
#> 9        build_package_network  find_function_dependencies
#> 10       build_package_network           package_functions
#> 11       build_recursive_edges  find_function_dependencies
#> 12       build_recursive_edges find_recursive_dependencies
#> 13     compile_package_manuals        build_package_manual
#> 14     compile_package_manuals                  list_repos
#> 15     compile_package_manuals          validate_character
#> 16     compile_package_manuals           validate_filepath
#> 17     compile_package_manuals               validate_flag
#> 18  find_function_dependencies           package_functions
#> 19 find_recursive_dependencies  find_function_dependencies
#> 20 find_recursive_dependencies           package_functions
#> 21   find_reverse_dependencies       build_package_network
#> 22   find_reverse_dependencies           package_functions
#> 23         get_branch_activity      github_to_repo_address
#> 24                  get_issues      github_to_repo_address
#> 25           get_pull_requests      github_to_repo_address
#> 26              get_raw_issues                  parse_name
#> 27               get_raw_pulls                  parse_name
#> 28      github_to_repo_address          validate_character
#> 29      github_to_repo_address         validate_repository
#> 30                is_r_package      github_to_repo_address
#> 31                is_r_package          validate_character
#> 32                  list_repos                is_r_package
#> 33                  list_repos          validate_character
#> 34                  list_repos               validate_flag
#> 35                  parse_name      github_to_repo_address
#> 36                  parse_name          validate_character
#> 37  plot_function_dependencies       build_recursive_edges
#> 38        summarize_repository         get_branch_activity
#> 39        summarize_repository                  get_issues
#> 40        summarize_repository           get_pull_requests
#> 41        summarize_repository      github_to_repo_address
#> 42           validate_filepath          validate_character
#> 43            validate_integer            validate_numeric
#> 44         validate_repository          validate_character
```
