# Identify all functions that are called by the specified function, and all functions called by *them*, etc

Recursively walk downwards through function calls. Two options to reduce
traversal of functions that may not be of interest (e.g.,
"validate\_.\*" functions): `pattern_ignore` will completely ignore
functions matching a

## Usage

``` r
find_recursive_dependencies(
  package_name,
  fun,
  pattern_ignore = NULL,
  pattern_dont_recurse = NULL
)
```

## Arguments

- package_name:

  Name of pattern. Character vector, length 1

- fun:

  Name of function. Character vector, length 1

- pattern_ignore:

  NULL or character vector of regex patterns. If present, recursive_deps
  will ignore any functions that match the pattern(s) character vector.
  Can take multiple patterns.

- pattern_dont_recurse:

  NULL or character vector of regex patterns. If present, recursive_deps
  will list functions that match the pattern(s), but will not recurse
  into those functions.. Can take multiple patterns.

## Value

character vector

## Examples

``` r
find_recursive_dependencies("purrr", "map")
#>  [1] "map_"                          "as_mapper"                    
#>  [3] "as_progress"                   "call_with_cleanup"            
#>  [5] "mmap_"                         "running_in_parallel"          
#>  [7] "vctrs_vec_compat"              "with_indexed_errors"          
#>  [9] "stop_input_type"               "simplify_impl"                
#> [11] "with_parallel_indexed_errors"  "parallel_pkgs_installed"      
#> [13] "obj_type_friendly"             "oxford_comma"                 
#> [15] ".rlang_as_friendly_type"       ".rlang_stop_unexpected_typeof"
#> [17] "vec_type_friendly"            
```
