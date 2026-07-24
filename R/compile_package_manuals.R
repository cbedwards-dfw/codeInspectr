#' Save R package documentation as PDFs
#'
#' Creates PDF manuals for all R packages of a given user or organization. Manuals are created with
#' devtools::build_manual. This requires a version of LaTeX installed. If you don't have a version
#' installed, you can install it with `tinytex::install_tinytex()`. Optionally can also build
#' vignettes for each package. Successfully building vignettes may require additional packages be
#' installed (whatever packages the vignettes depend on).
#'
#'
#' @inheritParams list_repos
#' @param output_path Filepath for a directory into which to save manuals. Character atomic.
#' @param verbose Print progress statements? Logical, defaults to `TRUE`.
#' @param build_vignettes Attempt to build vignettes for any package that has them? Logical,
#'   defaults to `FALSE`.
#'
#' @returns Nothing
#' @export
#'
#' @examples
#' \dontrun{
#' # build manuals and vignettes for all R packages in the FRAMverse organization.
#' compile_package_manuals(output_path = "C:/Repos/manuals",
#'                         name = "FRAMverse",
#'                         entity_type = "org",
#'                         build_vignettes = TRUE)
#' }
compile_package_manuals <- function(output_path,
                                    name,
                                    entity_type = c("user", "org"),
                                    build_vignettes = FALSE,
                                    repo_type = c("all", "public", "private", "forks"),
                                    verbose = TRUE){

  validate_filepath(output_path, n = 1)
  validate_character(name, n = 1)
  validate_flag(verbose)

  ## set up quite github creation
  old <- options(usethis.quiet = TRUE)
  on.exit(options(old), add = TRUE)


  if (Sys.which("pdflatex") == "") {
    cli::cli_abort("No LaTeX installation found. Consider running {.code tinytex::install_tinytex().}")
  }

  if(verbose){
    cli::cli_alert("Finding all R packages stored under {name}.")
  }

  all_repos <- list_repos(name = name, entity_type = entity_type, repo_type = repo_type,
                          r_package_status = TRUE)

  r_repos <- all_repos$full_name[all_repos$r_package]
  r_repos = stats::na.omit(r_repos)

  if(verbose){
    cli::cli_alert_info("{length(r_repos)} R packages identified...")
  }



  for(i in seq_along(r_repos)){
    cur_repo = r_repos[i]
    short_name = gsub(".*[/]", "", cur_repo)

    if(verbose){
      cli::cli_h1("Building manual for {short_name} (Repo {i}/{length(r_repos)})")
    }

    build_package_manual(full_name = cur_repo, output_path = output_path, verbose = verbose)

  }


}



#' Build manual (and optionally vignettes) for individual repository
#'
#' For an R package stored on Github, compile a pdf reference manual and optionally
#' build any vignettes. Requires LaTeX to run. Under the hood, downloads temporary copy of github repo,
#' compiles document(s), then deletes repository.
#'
#' @inheritParams compile_package_manuals
#' @param full_name Github repository "full name" of form `{user}/{repository}`, as in `"FRAMverse/framrsquared"`. Character atomic.
#'
#' @returns Nothing
#' @export
#'
#' @examples
#' \dontrun{
#' build_package_manual(repo = "FRAMverse/framrsquared",
#'   output_path = "C:/Repos/test_manuals",
#'   build_vignettes = TRUE)
#' }
build_package_manual <- function(full_name,
                                 output_path,
                                 build_vignettes = FALSE,
                                 verbose = TRUE) {

  ## Check if suggested packages are installed
  rlang::check_installed("usethis")
  rlang::check_installed("devtools")
  rlang::check_installed("fs")

  ## Check if Latex is installed
  if (Sys.which("pdflatex") == "") {
    cli::cli_abort("No LaTeX installation found. Consider running {.code tinytex::install_tinytex()} to install minimal version.")
  }

  dest_dir <- fs::file_temp("manual_build_")
  fs::dir_create(dest_dir)

  short_name <- sub(".*/", "", full_name)
  repo_dir <- file.path(dest_dir, short_name)

  # Always attempt cleanup when this directory exists
  on.exit(
    safe_dir_delete(dest_dir),
    add = TRUE
  )


  if (verbose) {
    cli::cli_alert_info("Downloading temporary copy of repository...")
  }

  usethis::create_from_github(
    full_name,
    destdir = dest_dir,
    rstudio = FALSE,
    open = FALSE
  )

  # The repository history is unnecessary for building documentation
  git_dir <- file.path(repo_dir, ".git")

  if (verbose) {
    cli::cli_alert_info("Building manual in {output_path}...")
  }

  invisible(
    utils::capture.output(
      suppressMessages(
        devtools::build_manual(
          pkg = repo_dir,
          path = output_path
        )
      )
    )
  )

  if(build_vignettes){
    build_vignettes(full_name = full_name,
                    repo_dir = repo_dir,
                    output_path = output_path,
                    verbose = verbose)
  }
}


#' Delete a directory, retrying on transient Windows file locks
#'
#' Useful for deleting temporary Github clones.
#'
#' @param path Directory to delete.
#' @param attempts Number of attempts before giving up.
#' @param wait_seconds Delay between attempts (grows each retry).
#' @return TRUE if deletion succeeded, FALSE otherwise (invisibly attempted).
safe_dir_delete <- function(path, attempts = 5, wait_seconds = 0.3) {
  rlang::check_installed("fs")


  if (!fs::dir_exists(path)) {
    return(TRUE)
  }

  for (i in seq_len(attempts)) {
    # Release any lingering handles from libgit2/gert before each attempt
    gc(full = TRUE)

    result <- tryCatch(
      {
        # Clear read-only bits git sets on object files, then delete
        files <- fs::dir_ls(path, recurse = TRUE, all = TRUE, fail = FALSE)
        if (length(files) > 0) {
          fs::file_chmod(files, "u+w")
        }
        fs::dir_delete(path)
        TRUE
      },
      error = function(e) FALSE
    )

    if (result || !fs::dir_exists(path)) {
      return(TRUE)
    }

    Sys.sleep(wait_seconds * i)  # linear backoff
  }

  fs::dir_exists(path) == FALSE
}


#' Create vignettes for R package
#'
#' If the git repository for an R package contains vignettes, builds them and saves them in `output_path`,
#' with prefix matching the package name.
#'
#' @inheritParams build_package_manual
#' @param repo_dir Temporary filepath for cloned github repository
#'
#' @returns Character vector of vignette filepaths (if successful and vignettes exist) or empty character string
#'
build_vignettes <- function(full_name, repo_dir, output_path, verbose) {

  rlang::check_installed("fs")
  rlang::check_installed("callr")

  short_name <- sub(".*/", "", full_name)
  vignette_dir <- file.path(repo_dir, "vignettes")

  if (!fs::dir_exists(vignette_dir)) {
    if (verbose) {
      cli::cli_alert_info("No vignettes/ directory found for {short_name}; skipping.")
    }
    return(invisible(character(0)))
  }

  if (verbose) {
    cli::cli_alert_info("Building vignettes for {short_name}...")
  }

  before_files <- fs::dir_ls(vignette_dir, recurse = TRUE, type = "file")

  temp_lib <- fs::file_temp("vignette_lib_")
  fs::dir_create(temp_lib)

  err_log <- tempfile(fileext = ".txt")

  result <- tryCatch(
    callr::r(
      func = function(repo_dir, temp_lib){
        utils::install.packages(
          repo_dir,
          repos = NULL,
          type = "source",
          quiet = TRUE,
          INSTALL_opts = "--no-docs"
        )
        tools::buildVignettes(dir = repo_dir, quiet = TRUE, clean = TRUE, tangle = FALSE, )
      },
      args = list(repo_dir = repo_dir, temp_lib = temp_lib),
      libpath = c(temp_lib, .libPaths()),
      stdout = err_log,
      stderr = err_log,
      show = FALSE
    ),
    error = function(e) e
  )

  if (inherits(result, "error")) {
    cli::cli_warn(c(
      "Vignette build failed for {.pkg {short_name}}.",
      "i" = "See {.path {err_log}} for details."
    ))
    return(invisible(character(0)))
  }


  after_files <- fs::dir_ls(vignette_dir, recurse = TRUE, type = "file")
  built_files <- setdiff(after_files, before_files)
  built_files <- built_files[grepl("\\.(html|pdf)$", built_files)]

  if (length(built_files) == 0) {
    cli::cli_warn("No rendered vignette output found for {.pkg {short_name}}.")
    return(invisible(character(0)))
  }

  fs::dir_create(output_path)

  new_paths <- vapply(built_files, function(f) {
    vignette_name <- fs::path_ext_remove(fs::path_file(f))
    ext <- fs::path_ext(f)
    fs::path(output_path, paste0(short_name, "_", vignette_name, ".", ext))
  }, character(1))

  fs::file_move(built_files, new_paths)

  if (verbose) {
    cli::cli_alert_success("Moved {length(new_paths)} vignette{?s} to {.path {output_path}}.")
  }

  return(invisible(new_paths))
}
