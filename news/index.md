# Changelog

## codeInspectr 0.0.0.9000 (development version)

- updated all functions that previously required a “repo address” (e.g.,
  “FRAMverse/framrsquared”) to also work with the full github repository
  URL (e.g., “<https://github.com/FRAMverse/framrsquared/>”). Should
  help avoid confusion, simplify user experience.
- Added suite of tools for creating PDF versions of package
  documentation and vignettes. Primary function for users is
  [`compile_package_manuals()`](https://cbedwards-dfw.github.io/codeInspectr/reference/compile_package_manuals.md)
  (to compile documentation / vignettes for all Github-based R packages
  stored under a specific user or organization) or
  [`build_package_manual()`](https://cbedwards-dfw.github.io/codeInspectr/reference/build_package_manual.md)
  (to build documentation for a single R package accessible as a Github
  repository). Additional package dependencies for this process have
  been added as “Suggests” to avoid bloating required packages for a
  single task.
- Added
  [`backup_github_info()`](https://cbedwards-dfw.github.io/codeInspectr/reference/backup_github_info.md)
  to download Issues and Pull Requests to local jsons.
- added better input validation
- addition of basic functions. Key ones:
  [`plot_function_dependencies()`](https://cbedwards-dfw.github.io/codeInspectr/reference/plot_function_dependencies.md)
  and
  [`find_reverse_dependencies()`](https://cbedwards-dfw.github.io/codeInspectr/reference/find_reverse_dependencies.md)
- Suite of functions to summarize information about github repositories
- added vignette “getting_started”
