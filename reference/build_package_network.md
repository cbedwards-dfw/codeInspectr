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
#> 1        build_package_network  find_function_dependencies
#> 2        build_package_network           package_functions
#> 3        build_recursive_edges  find_function_dependencies
#> 4        build_recursive_edges find_recursive_dependencies
#> 5   find_function_dependencies           package_functions
#> 6  find_recursive_dependencies  find_function_dependencies
#> 7  find_recursive_dependencies           package_functions
#> 8    find_reverse_dependencies       build_package_network
#> 9    find_reverse_dependencies           package_functions
#> 10  plot_function_dependencies       build_recursive_edges
#> 11        summarize_repository         get_branch_activity
#> 12        summarize_repository                  get_issues
#> 13        summarize_repository           get_pull_requests
#> 14        summarize_repository         validate_repository
#> 15            validate_integer            validate_numeric
```
