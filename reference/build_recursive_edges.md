# Build dataframe of edges of recursive dependencies

Build dataframe of edges of recursive dependencies

## Usage

``` r
build_recursive_edges(
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

dataframe, with `$from` and `$to` representing the "from" and "to" nodes
of every edge

## Examples

``` r
build_recursive_edges("purrr", "map")
#>                   from                            to
#> 1                  map                          map_
#> 2                 map_                     as_mapper
#> 3                 map_                   as_progress
#> 4                 map_             call_with_cleanup
#> 5                 map_                         mmap_
#> 6                 map_           running_in_parallel
#> 7                 map_              vctrs_vec_compat
#> 8                 map_           with_indexed_errors
#> 9          as_progress               stop_input_type
#> 10               mmap_                 simplify_impl
#> 11               mmap_  with_parallel_indexed_errors
#> 12 running_in_parallel       parallel_pkgs_installed
#> 13     stop_input_type             obj_type_friendly
#> 14     stop_input_type                  oxford_comma
#> 15   obj_type_friendly       .rlang_as_friendly_type
#> 16   obj_type_friendly .rlang_stop_unexpected_typeof
#> 17   obj_type_friendly             vec_type_friendly
```
