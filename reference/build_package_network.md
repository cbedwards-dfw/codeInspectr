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
#> 4        build_package_network  find_function_dependencies
#> 5        build_package_network           package_functions
#> 6        build_recursive_edges  find_function_dependencies
#> 7        build_recursive_edges find_recursive_dependencies
#> 8   find_function_dependencies           package_functions
#> 9  find_recursive_dependencies  find_function_dependencies
#> 10 find_recursive_dependencies           package_functions
#> 11   find_reverse_dependencies       build_package_network
#> 12   find_reverse_dependencies           package_functions
#> 13              get_raw_issues                  parse_name
#> 14               get_raw_pulls                  parse_name
#> 15                  list_repos          validate_character
#> 16                  parse_name          validate_character
#> 17  plot_function_dependencies       build_recursive_edges
#> 18        summarize_repository         get_branch_activity
#> 19        summarize_repository                  get_issues
#> 20        summarize_repository           get_pull_requests
#> 21        summarize_repository         validate_repository
#> 22           validate_filepath          validate_character
#> 23            validate_integer            validate_numeric
```
