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
#> 24         get_github_activity             owner_qualifier
#> 25         get_github_activity           parse_issue_items
#> 26         get_github_activity               search_github
#> 27         get_github_activity          validate_character
#> 28         get_github_activity               validate_date
#> 29                  get_issues      github_to_repo_address
#> 30               get_new_repos             owner_qualifier
#> 31               get_new_repos            parse_repo_items
#> 32               get_new_repos               search_github
#> 33               get_new_repos          validate_character
#> 34               get_new_repos               validate_date
#> 35               get_new_repos               validate_flag
#> 36           get_pull_requests      github_to_repo_address
#> 37              get_raw_issues                  parse_name
#> 38               get_raw_pulls                  parse_name
#> 39      github_to_repo_address          validate_character
#> 40      github_to_repo_address         validate_repository
#> 41                is_r_package      github_to_repo_address
#> 42                is_r_package          validate_character
#> 43                  list_repos                is_r_package
#> 44                  list_repos          validate_character
#> 45                  list_repos               validate_flag
#> 46           parse_issue_items                  null_to_na
#> 47                  parse_name      github_to_repo_address
#> 48                  parse_name          validate_character
#> 49            parse_repo_items                  null_to_na
#> 50  plot_function_dependencies       build_recursive_edges
#> 51               search_github               search_github
#> 52               search_github                 search_page
#> 53                 search_page                search_pause
#> 54   summarize_github_activity         get_github_activity
#> 55   summarize_github_activity               get_new_repos
#> 56   summarize_github_activity          validate_character
#> 57   summarize_github_activity               validate_date
#> 58   summarize_github_activity               validate_flag
#> 59        summarize_repository         get_branch_activity
#> 60        summarize_repository                  get_issues
#> 61        summarize_repository           get_pull_requests
#> 62        summarize_repository      github_to_repo_address
#> 63           validate_filepath          validate_character
#> 64            validate_integer            validate_numeric
#> 65         validate_repository          validate_character
```
