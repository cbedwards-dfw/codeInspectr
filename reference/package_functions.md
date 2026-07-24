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
#>  [1] "backup_github_info"          "build_package_manual"       
#>  [3] "build_package_network"       "build_recursive_edges"      
#>  [5] "compile_package_manuals"     "compile_vignettes"          
#>  [7] "find_function_dependencies"  "find_recursive_dependencies"
#>  [9] "find_reverse_dependencies"   "get_branch_activity"        
#> [11] "get_issues"                  "get_noncran_dependencies"   
#> [13] "get_pull_requests"           "get_raw_issues"             
#> [15] "get_raw_pulls"               "github_to_repo_address"     
#> [17] "is_r_package"                "list_repos"                 
#> [19] "package_functions"           "parse_name"                 
#> [21] "plot_function_dependencies"  "process_repo"               
#> [23] "quiet_console"               "safe_dir_delete"            
#> [25] "summarize_repository"        "validate_character"         
#> [27] "validate_data_frame"         "validate_filepath"          
#> [29] "validate_flag"               "validate_integer"           
#> [31] "validate_numeric"            "validate_repository"        
```
