#' Build edges of all function dependencies in package
#'
#' @inheritParams find_function_dependencies
#'
#' @return dataframe of dependency edges, with `$from` and `$to`
#' @export
#'
#' @examples
#' build_package_network("codeInspectr")
build_package_network <- function(package_name, include = "package only"){

  include = rlang::arg_match(include, values = c("package only", "no operators", "all"))

  funs <- package_functions(package_name)

  edges_ls <- purrr::map(funs,
                         \(cur_fun){

                           new_deps <- find_function_dependencies(package_name, cur_fun, include = include)
                           if(length(new_deps)>0){
                             return(data.frame(cbind(from = cur_fun, to = new_deps)))
                           } else {
                             return(NULL)
                           }

                         }
  )
  edges <- do.call(rbind, edges_ls)
  return(edges)
}

#' List functions that call the specified functions
#'
#' To search for functions that are dependent on a non-package function (e.g.,
#' tracking down potential issues if a function from another package changes),
#' set `include` to "all".
#'
#' @inheritParams find_function_dependencies
#'
#' @return character vector
#' @export
#'
#' @examples
#' find_reverse_dependencies("codeInspectr", "package_functions")
find_reverse_dependencies <- function(package_name, fun, include = "package only"){

  include = rlang::arg_match(include, values = c("package only", "no operators", "all"))

  edges = build_package_network(package_name, include = include)

  all_funs <- unique(
    c(package_functions(package_name),
      edges$to,
      edges$from
    )
  )

  if(! fun %in% all_funs){
   cli::cli_abort("{.arg {fun}} was not found! Check spelling; if {.arg {fun}} is not in {.pkg {package_name} }, make sure that optional argument {.arg include}.")
  }

  edges |>
    dplyr::filter(.data$to == .env$fun) |>
    dplyr::pull(.data$from)
}
