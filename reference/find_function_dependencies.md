# List the functions in a package that depend on a function

Returns a character vector of all functions in package `package_name`
that depend on function `fun`.

## Usage

``` r
find_function_dependencies(package_name, fun, include = "package only")
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

character vector of function names

## Examples

``` r
find_function_dependencies("codeInspectr", "find_recursive_dependencies")
#> [1] "find_function_dependencies" "package_functions"         
body(codeInspectr::find_recursive_dependencies)
#> {
#>     funs <- package_functions(package_name)
#>     if (!fun %in% funs) {
#>         cli::cli_abort("Function {.fn {fun}} is not a function in package {.pkg {package_name}}")
#>     }
#>     seen <- character(0)
#>     dep_vec <- character(0)
#>     stack <- fun
#>     while (length(stack) > 0) {
#>         cur_fun <- stack[1]
#>         stack <- stack[-1]
#>         seen <- c(seen, cur_fun)
#>         new_deps <- find_function_dependencies(package_name, 
#>             cur_fun)
#>         if (!is.null(pattern_ignore)) {
#>             multi_grep <- function(x) {
#>                 grep(x, new_deps, value = TRUE)
#>             }
#>             ignore_ls <- purrr::map(pattern_ignore, multi_grep)
#>             ignore_vec <- unique(do.call(c, ignore_ls))
#>             new_deps <- setdiff(new_deps, ignore_vec)
#>         }
#>         dep_vec <- unique(c(dep_vec, new_deps))
#>         if (!is.null(pattern_dont_recurse)) {
#>             multi_grep <- function(x) {
#>                 grep(x, new_deps, value = TRUE)
#>             }
#>             dont_recurse_ls <- purrr::map(pattern_dont_recurse, 
#>                 multi_grep)
#>             dont_recurse_vec <- unique(do.call(c, dont_recurse_ls))
#>             new_deps <- setdiff(new_deps, dont_recurse_vec)
#>         }
#>         stack <- unique(c(stack, new_deps))
#>         stack <- setdiff(stack, seen)
#>     }
#>     return(setdiff(dep_vec, fun))
#> }
```
