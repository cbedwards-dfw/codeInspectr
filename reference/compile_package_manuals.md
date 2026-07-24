# Save R package documentation as PDFs

Creates PDF manuals for all R packages of a given user or organization.
Manuals are created with devtools::build_manual. This requires a version
of LaTeX installed. If you don't have a version installed, you can
install it with
[`tinytex::install_tinytex()`](https://rdrr.io/pkg/tinytex/man/install_tinytex.html).
Optionally can also build vignettes for each package. Successfully
building vignettes may require additional packages be installed
(whatever packages the vignettes depend on).

## Usage

``` r
compile_package_manuals(
  output_path,
  name,
  entity_type = c("user", "org"),
  build_vignettes = FALSE,
  repo_type = c("all", "public", "private", "forks"),
  verbose = TRUE
)
```

## Arguments

- output_path:

  Filepath for a directory into which to save manuals. Character atomic.

- name:

  Name of user or organization (e.g., "FRAMverse" or "cbedwards-dfw").
  Character atomic.

- entity_type:

  Is this a Github User ("user") or organization ("org")? Character
  atomic, defaults to "user".

- build_vignettes:

  Attempt to build vignettes for any package that has them? Logical,
  defaults to `FALSE`.

- repo_type:

  List "all" repos, "public" repos, "private" repos, or only "fork"
  repos? Character atomic, defaults to "all". Private repos will only be
  provided if you have access to the private repos of that user or org.

- verbose:

  Print progress statements? Logical, defaults to `TRUE`.

## Value

Nothing

## Examples

``` r
if (FALSE) { # \dontrun{
# build manuals and vignettes for all R packages in the FRAMverse organization.
compile_package_manuals(output_path = "C:/Repos/manuals",
                        name = "FRAMverse",
                        entity_type = "org",
                        build_vignettes = TRUE)
} # }
```
