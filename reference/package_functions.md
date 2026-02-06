# List the functions of a package

List the functions of a package

## Usage

``` r
package_functions(package_name)
```

## Arguments

- package_name:

  Name of package as character string

## Value

character vector of function names

## Examples

``` r
package_functions("codeInspectr")
#>  [1] "build_package_network"       "build_recursive_edges"      
#>  [3] "find_function_dependencies"  "find_recursive_dependencies"
#>  [5] "find_reverse_dependencies"   "get_branch_activity"        
#>  [7] "get_issues"                  "get_noncran_dependencies"   
#>  [9] "get_pull_requests"           "package_functions"          
#> [11] "plot_function_dependencies"  "summarize_repository"       
#> [13] "validate_character"          "validate_data_frame"        
#> [15] "validate_flag"               "validate_integer"           
#> [17] "validate_numeric"            "validate_repository"        
```
