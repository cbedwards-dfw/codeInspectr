# Plot dependency map of a function

Plot dependency map of a function

## Usage

``` r
plot_function_dependencies(
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

visNetwork plot

## Examples

``` r
plot_function_dependencies("purrr", "map")

{"x":{"nodes":{"id":["map","map_","as_progress","mmap_","running_in_parallel","stop_input_type","obj_type_friendly","as_mapper","call_with_cleanup","vctrs_vec_compat","with_indexed_errors","simplify_impl","with_parallel_indexed_errors","parallel_pkgs_installed","oxford_comma",".rlang_as_friendly_type",".rlang_stop_unexpected_typeof","vec_type_friendly"],"label":["map","map_","as_progress","mmap_","running_in_parallel","stop_input_type","obj_type_friendly","as_mapper","call_with_cleanup","vctrs_vec_compat","with_indexed_errors","simplify_impl","with_parallel_indexed_errors","parallel_pkgs_installed","oxford_comma",".rlang_as_friendly_type",".rlang_stop_unexpected_typeof","vec_type_friendly"],"color":["lightblue","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray"]},"edges":{"from":["map","map_","map_","map_","map_","map_","map_","map_","as_progress","mmap_","mmap_","running_in_parallel","stop_input_type","stop_input_type","obj_type_friendly","obj_type_friendly","obj_type_friendly"],"to":["map_","as_mapper","as_progress","call_with_cleanup","mmap_","running_in_parallel","vctrs_vec_compat","with_indexed_errors","stop_input_type","simplify_impl","with_parallel_indexed_errors","parallel_pkgs_installed","obj_type_friendly","oxford_comma",".rlang_as_friendly_type",".rlang_stop_unexpected_typeof","vec_type_friendly"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"box"},"manipulation":{"enabled":false},"edges":{"arrows":"from"}},"groups":null,"width":null,"height":null,"idselection":{"enabled":true,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)","highlight":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","highlight":{"enabled":true,"hoverNearest":false,"degree":1,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null,"keepCoord":true,"labelSuffix":"(cluster)"}},"evals":[],"jsHooks":[]}plot_function_dependencies("purrr", "map_df")

{"x":{"nodes":{"id":["map_df","map","map_","as_progress","mmap_","running_in_parallel","stop_input_type","obj_type_friendly","as_mapper","call_with_cleanup","vctrs_vec_compat","with_indexed_errors","simplify_impl","with_parallel_indexed_errors","parallel_pkgs_installed","oxford_comma",".rlang_as_friendly_type",".rlang_stop_unexpected_typeof","vec_type_friendly"],"label":["map_df","map","map_","as_progress","mmap_","running_in_parallel","stop_input_type","obj_type_friendly","as_mapper","call_with_cleanup","vctrs_vec_compat","with_indexed_errors","simplify_impl","with_parallel_indexed_errors","parallel_pkgs_installed","oxford_comma",".rlang_as_friendly_type",".rlang_stop_unexpected_typeof","vec_type_friendly"],"color":["lightblue","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray","lightgray"]},"edges":{"from":["map_df","map_df","map","map_","map_","map_","map_","map_","map_","map_","as_progress","mmap_","mmap_","running_in_parallel","stop_input_type","stop_input_type","obj_type_friendly","obj_type_friendly","obj_type_friendly"],"to":["as_mapper","map","map_","as_mapper","as_progress","call_with_cleanup","mmap_","running_in_parallel","vctrs_vec_compat","with_indexed_errors","stop_input_type","simplify_impl","with_parallel_indexed_errors","parallel_pkgs_installed","obj_type_friendly","oxford_comma",".rlang_as_friendly_type",".rlang_stop_unexpected_typeof","vec_type_friendly"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"box"},"manipulation":{"enabled":false},"edges":{"arrows":"from"}},"groups":null,"width":null,"height":null,"idselection":{"enabled":true,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)","highlight":false},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","highlight":{"enabled":true,"hoverNearest":false,"degree":1,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null,"keepCoord":true,"labelSuffix":"(cluster)"}},"evals":[],"jsHooks":[]}
```
