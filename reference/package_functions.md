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
#>  [5] "find_reverse_dependencies"   "package_functions"          
#>  [7] "plot_function_dependencies"  "validate_character"         
#>  [9] "validate_data_frame"         "validate_flag"              
#> [11] "validate_integer"            "validate_numeric"           
```
