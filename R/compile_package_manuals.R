#' Save R package documentation as PDFs
#'
#' Creates PDF manuals for all packages of a given user or organization. Manuals are created with pkgbuild::build_manual
#' (distributed in the devtools package). This requires a version of LaTeX installed. If you don't have a version installed,
#' you can install it with `tinytex::install_tinytex()`
#'
#' @param path
#' @param name
#' @param entity_type
#' @param repo_type
#'
#' @returns
#' @export
#'
#' @examples
compile_package_manuals <- function(output_path,
                                    name,
                                    entity_type = c("user", "org"),
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
  r_repos = na.omit(r_repos)

  if(verbose){
    cli::cli_alert_info("{length(r_repos)} R packages identified...")
  }



  for(i in seq_along(r_repos)){
    cur_repo = r_repos[i]
    short_name = gsub(".*[/]", "", cur_repo)

    if(verbose){
      cli::cli_h1("Building manual for {short_name} (Repo {i}/{length(r_repos)})")
    }

    build_one_manual(repo = cur_repo, output_path = output_path, verbose = verbose)

  }


}



build_one_manual <- function(repo,
                             output_path,
                             build_vignettes = FALSE,
                             verbose = TRUE) {
  dest_dir <- fs::file_temp("manual_build_")
  fs::dir_create(dest_dir)

  short_name <- sub(".*/", "", repo)
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
    repo,
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
    capture.output(
      suppressMessages(
        devtools::build_manual(
          pkg = repo_dir,
          path = output_path
        )
      )
    )
  )

  if(build_vignettes){
    build_vignettes(repo = repo,
                    repo_dir = repo_dir,
                    output_path = output_path,
                    verbose = verbose)
  }
}


#' Delete a directory, retrying on transient Windows file locks
#'
#' @param path Directory to delete.
#' @param attempts Number of attempts before giving up.
#' @param wait_seconds Delay between attempts (grows each retry).
#' @return TRUE if deletion succeeded, FALSE otherwise (invisibly attempted).
safe_dir_delete <- function(path, attempts = 5, wait_seconds = 0.3) {
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
#' @param repo
#' @param repo_dir
#' @param output_path
#' @param verbose
#'
#' @returns
#' @export
#'
#' @examples
build_vignettes <- function(repo, repo_dir, output_path, verbose) {
  short_name <- sub(".*/", "", repo)
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

  if (short_name %in% loadedNamespaces()) {
    try(unloadNamespace(short_name), silent = TRUE)
  }

  withr::with_temp_libpaths(
    action = "prefix",
    code = {
      quiet_console({
      install.packages(
        repo_dir,
        repos = NULL,
        type = "source",
        quiet = TRUE,
        INSTALL_opts = "--no-docs"
      )

        tools::buildVignettes(dir = repo_dir, quiet = TRUE, clean = TRUE, tangle = FALSE)
      })
    }
  )

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

  invisible(new_paths)
}
