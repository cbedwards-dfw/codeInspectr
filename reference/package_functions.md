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
#>  [1] "backup_github_info"          "build_package_network"      
#>  [3] "build_recursive_edges"       "find_function_dependencies" 
#>  [5] "find_recursive_dependencies" "find_reverse_dependencies"  
#>  [7] "get_branch_activity"         "get_issues"                 
#>  [9] "get_noncran_dependencies"    "get_pull_requests"          
#> [11] "get_raw_issues"              "get_raw_pulls"              
#> [13] "list_repos"                  "package_functions"          
#> [15] "parse_name"                  "plot_function_dependencies" 
#> [17] "process_repo"                "summarize_repository"       
#> [19] "validate_character"          "validate_data_frame"        
#> [21] "validate_filepath"           "validate_flag"              
#> [23] "validate_integer"            "validate_numeric"           
#> [25] "validate_repository"        
```
