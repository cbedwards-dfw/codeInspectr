#' List the functions of a package
#'
#' @param package_name Name of package as character string
#'
#' @return character vector of function names
#' @export
#'
#' @examples
#' package_functions("codeInspectr")
package_functions <- function(package_name) {
  ns <- asNamespace(package_name)
  objs <- ls(ns, all.names = TRUE)
  objs[sapply(objs, function(x) is.function(ns[[x]]))]
}

##
#' List the functions in a package that depend on a function
#'
#' Returns a character vector of all functions in package `package_name` that depend on function `fun`.
#'
#' @param package_name package name as character string
#' @param fun function name as character string
#' @param include Should only package functions be returned ("package only"),
#' or all functions except for base R operators ("no operators"),
#' or all functions ("all")?
#'
#' @return character vector of function names
#' @export
#'
#' @examples
#' find_function_dependencies("codeInspectr", "find_recursive_dependencies")
#' body(codeInspectr::find_recursive_dependencies)
find_function_dependencies <- function(package_name, fun,
                                       include = "package only") {
  ns <- asNamespace(package_name)
  package_funs <- package_functions(package_name)

  include <- rlang::arg_match(include, values = c("package only", "no operators", "all"))

  if (!fun %in% package_funs) {
    stop(sprintf("Function '%s' is not a function in namespace '%s'", fun, package_name))
  }

  funs <- codetools::findGlobals(ns[[fun]], merge = FALSE)$functions

  # keep only functions that are actually in the package namespace
  if (include == "package only") {
    funs <- intersect(funs, package_funs)
  } else if (include == "no operators") {
    ops <- ls("package:base", pattern = "^%|^[[:punct:]]")
    funs <- setdiff(funs, ops)
  }
  return(funs)
}
# body(framrsquared:::fetch_table_)

#' Identify all functions that are called by the specified function, and all functions called by *them*, etc
#'
#' Recursively walk downwards through function calls. Two options to reduce traversal of functions that may not be of interest (e.g., "validate_.*" functions): `pattern_ignore` will completely ignore functions matching a
#'
#' @param package_name Name of pattern. Character vector, length 1
#' @param fun Name of function. Character vector, length 1
#' @param pattern_ignore NULL or character vector of regex patterns. If present, recursive_deps will ignore any functions that match the pattern(s) character vector. Can take multiple patterns.
#' @param pattern_dont_recurse NULL or character vector of regex patterns. If present, recursive_deps will list functions that match the pattern(s), but will not recurse into those functions.. Can take multiple patterns.
#'
#' @return character vector
#' @export
#'
#' @examples
#' find_recursive_dependencies("purrr", "map")
find_recursive_dependencies <- function(package_name, fun, pattern_ignore = NULL, pattern_dont_recurse = NULL) {
  # ns <- asNamespace(package_name)
  funs <- package_functions(package_name)


  if (!fun %in% funs) {
    cli::cli_abort("Function {.fn {fun}} is not a function in package {.pkg {package_name}}")
  }

  seen <- character(0)
  dep_vec <- character(0)
  stack <- fun

  while (length(stack) > 0) {
    cur_fun <- stack[1]
    stack <- stack[-1]
    seen <- c(seen, cur_fun)

    new_deps <- find_function_dependencies(package_name, cur_fun)


    if (!is.null(pattern_ignore)) {
      multi_grep <- function(x) {
        grep(x, new_deps, value = TRUE)
      } ## lazy eval, so could define once?

      ignore_ls <- purrr::map(
        pattern_ignore,
        multi_grep
      )
      ignore_vec <- unique(do.call(c, ignore_ls))
      new_deps <- setdiff(new_deps, ignore_vec)
    }

    dep_vec <- unique(c(dep_vec, new_deps))

    if (!is.null(pattern_dont_recurse)) {
      multi_grep <- function(x) {
        grep(x, new_deps, value = TRUE)
      } ## lazy eval, so could define once?

      dont_recurse_ls <- purrr::map(
        pattern_dont_recurse,
        multi_grep
      )
      dont_recurse_vec <- unique(do.call(c, dont_recurse_ls))
      new_deps <- setdiff(new_deps, dont_recurse_vec)
    }

    stack <- unique(c(stack, new_deps))
    stack <- setdiff(stack, seen)
  }


  return(setdiff(dep_vec, fun))
}

#' Build dataframe of edges of recursive dependencies
#'
#' @inheritParams find_recursive_dependencies
#' @return dataframe, with `$from` and `$to` representing the "from" and "to" nodes of every edge
#' @export
#'
#' @examples
#' build_recursive_edges("purrr", "map")
build_recursive_edges <- function(package_name, fun, pattern_ignore = NULL, pattern_dont_recurse = NULL) {
  # ns <- asNamespace(package_name)
  funs <- c(fun, find_recursive_dependencies(package_name, fun, pattern_ignore, pattern_dont_recurse))

  if (!is.null(pattern_dont_recurse)) {
    multi_grep <- function(x) {
      grep(x, funs, value = TRUE)
    }
    ignore_ls <- purrr::map(
      pattern_dont_recurse,
      multi_grep
    )
    ignore_vec <- unique(do.call(c, ignore_ls))
    funs <- setdiff(funs, ignore_vec)
  }


  edges_ls <- purrr::map(
    funs,
    \(cur_fun){
      new_deps <- find_function_dependencies(package_name, cur_fun)

      multi_grep <- function(x) {
        grep(x, new_deps, value = TRUE)
      }

      if (!is.null(pattern_ignore)) {
        ignore_ls <- purrr::map(
          pattern_ignore,
          multi_grep
        )
        ignore_vec <- unique(do.call(c, ignore_ls))
        new_deps <- setdiff(new_deps, ignore_vec)
      }

      if (length(new_deps) > 0) {
        return(data.frame(cbind(from = cur_fun, to = new_deps)))
      } else {
        return(NULL)
      }
    }
  )
  edges <- do.call(rbind, edges_ls)


  as.data.frame(edges, stringsAsFactors = FALSE)
}



#' Plot dependency map of a function
#'
#' @inheritParams find_recursive_dependencies
#'
#' @return visNetwork plot
#' @export
#'
#' @examples
#' plot_function_dependencies("purrr", "map")
#' plot_function_dependencies("purrr", "map_df")
plot_function_dependencies <- function(package_name,
                                       fun,
                                       pattern_ignore = NULL,
                                       pattern_dont_recurse = NULL) {
  ## find the edges
  edges <- build_recursive_edges(package_name, fun, pattern_ignore, pattern_dont_recurse)
  ## if skipping validation functions, skip validation functions
  ## ## a little jank, but because valdiation functions don't have deep recursive stuff going on, it works okay. Should really apply to build_recursive_edges.

  if (nrow(edges) == 0) {
    cli::cli_alert_info("Function has no (non-ignored) dependencies!")
  }

  nodes <- data.frame(
    id = unique(c(edges$from, edges$to)),
    label = unique(c(edges$from, edges$to)),
    stringsAsFactors = FALSE
  )

  # highlight the root function
  nodes$color <- ifelse(nodes$id == fun, "lightblue", "lightgray")

  visNetwork::visNetwork(nodes, edges) |>
    visNetwork::visNodes(shape = "box") |>
    visNetwork::visEdges(arrows = "from") |>
    visNetwork::visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE)
}

