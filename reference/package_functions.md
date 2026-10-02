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
#> [11] "get_github_activity"         "get_issues"                 
#> [13] "get_new_repos"               "get_noncran_dependencies"   
#> [15] "get_pull_requests"           "get_raw_issues"             
#> [17] "get_raw_pulls"               "github_to_repo_address"     
#> [19] "is_r_package"                "list_repos"                 
#> [21] "null_to_na"                  "owner_qualifier"            
#> [23] "package_functions"           "parse_issue_items"          
#> [25] "parse_name"                  "parse_repo_items"           
#> [27] "plot_function_dependencies"  "process_repo"               
#> [29] "quiet_console"               "safe_dir_delete"            
#> [31] "search_github"               "search_page"                
#> [33] "search_pause"                "summarize_github_activity"  
#> [35] "summarize_repository"        "validate_character"         
#> [37] "validate_data_frame"         "validate_date"              
#> [39] "validate_filepath"           "validate_flag"              
#> [41] "validate_integer"            "validate_numeric"           
#> [43] "validate_repository"        
```
