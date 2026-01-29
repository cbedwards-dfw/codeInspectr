# List functions that call the specified functions

To search for functions that are dependent on a non-package function
(e.g., tracking down potential issues if a function from another package
changes), set `include` to "all".

## Usage

``` r
find_reverse_dependencies(package_name, fun, include = "package only")
```

## Arguments

- package_name:

  package name as character string

- fun:

  function name as character string

- include:

  Should only package functions be returned ("package only"), or all
  functions except for base R operators ("no operators"), or all
  functions ("all")?

## Value

character vector

## Examples

``` r
find_reverse_dependencies("codeInspectr", "package_functions")
#> [1] "build_package_network"       "find_function_dependencies" 
#> [3] "find_recursive_dependencies" "find_reverse_dependencies"  
```
