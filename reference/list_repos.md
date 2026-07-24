# List all repositories of a Github user or organization

Creates a dataframe of repositories and associated info for the user or
organization specified

## Usage

``` r
list_repos(
  name,
  entity_type = c("user", "org"),
  repo_type = c("all", "public", "private", "forks"),
  r_package_status = FALSE
)
```

## Arguments

- name:

  Name of user or organization (e.g., "FRAMverse" or "cbedwards-dfw").
  Character atomic.

- entity_type:

  Is this a Github User ("user") or organization ("org")? Character
  atomic, defaults to "user".

- repo_type:

  List "all" repos, "public" repos, "private" repos, or only "fork"
  repos? Character atomic, defaults to "all". Private repos will only be
  provided if you have access to the private repos of that user or org.

- r_package_status:

  Check if each repository is an R package. Increases runtime
  considerably (e.g., ~1 sec per repo). Logical, defaults to FALSE

## Value

Data frame of repositories with columns

- `$name`: repository name, e.g., "codeInspectr"

- `$full_name`: {user/org}/{repository name}, e.g.,
  "FRAMverse/codeInspectr"

- `$html_url`: web address of repository

- `$description`: description listed for the repository.

- `$stars`: number of followers of the repository

- `$language`: programming language(s) of the repository.

- `$default_branch`: the name of the default branch (e.g., "main").

- `$r_package`: is the repository an R package? Logical, only present
  for optional argument `r_package_status = TRUE`.

## Examples

``` r
list_repos("FRAMverse", entity_type = "org", repo_type = "public")
#> ⠙ 20 items, page 1 | 2ms
#> # A tibble: 20 × 7
#>    name             full_name html_url description stars language default_branch
#>    <chr>            <chr>     <chr>    <chr>       <int> <chr>    <chr>         
#>  1 FRAM             FRAMvers… https:/… FRAM and F…     6 Visual … master        
#>  2 CalibrationProg… FRAMvers… https:/… NA              0 NA       master        
#>  3 fram_doc         FRAMvers… https:/… Documentat…     4 R        master        
#>  4 framr            FRAMvers… https:/… R package …     7 R        master        
#>  5 sport_harvest_e… FRAMvers… https:/… Decision s…     3 R        main          
#>  6 rrCoho           FRAMvers… https:/… Run recons…     3 NA       main          
#>  7 rmis             FRAMvers… https:/… These scri…     0 R        main          
#>  8 regs_database    FRAMvers… https:/… Database w…     0 HTML     main          
#>  9 regulations_dat… FRAMvers… https:/… PosgreSQL …     0 NA       main          
#> 10 framrsquared     FRAMvers… https:/… R Package …     9 R        main          
#> 11 snippets         FRAMvers… https:/… Code Snipp…     1 HTML     main          
#> 12 framrosetta      FRAMvers… https:/… Data libra…     1 R        main          
#> 13 pssp             FRAMvers… https:/… Rewrite of…     0 R        main          
#> 14 FRAMBuilder      FRAMvers… https:/… NA              0 Visual … master        
#> 15 coding-practices FRAMvers… https:/… Our evolvi…     1 NA       main          
#> 16 FRAMverse.r-uni… FRAMvers… https:/… NA              0 NA       main          
#> 17 FRAM_automation  FRAMvers… https:/… Collin's d…     0 Visual … master        
#> 18 framqaqc         FRAMvers… https:/… QAQC tools…     0 R        main          
#> 19 .github          FRAMvers… https:/… profile re…     0 NA       main          
#> 20 validatr         FRAMvers… https:/… One Stop S…     0 R        main          
```
