# List all repositories of a Github user or organization

Creates a dataframe of repositories and associated info for the user or
organization specified

## Usage

``` r
list_repos(
  name,
  entity_type = c("user", "org"),
  repo_type = c("all", "public", "private", "forks")
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

## Value

Data frame of repositories with columns

- `$name`: repository name, e.g., "codeInspectr"

- `$full_name`: {user/org}/{repository name}, e.g.,
  "FRAMverse/codeInspectr"

- `$html_url`: web address of repository

- `$description`: description listed for the repository.

- `$stars`: number of followers of the repository

- `$language`: programming language(s) of the repository.

## Examples

``` r
list_repos("FRAMverse", entity_type = "org", repo_type = "public")
#> ⠙ 20 items, page 1 | 2ms
#> # A tibble: 20 × 6
#>    name                     full_name        html_url description stars language
#>    <chr>                    <chr>            <chr>    <chr>       <int> <chr>   
#>  1 FRAM                     FRAMverse/FRAM   https:/… FRAM and F…     5 Visual …
#>  2 CalibrationProgram       FRAMverse/Calib… https:/… NA              0 NA      
#>  3 fram_doc                 FRAMverse/fram_… https:/… Documentat…     4 R       
#>  4 framr                    FRAMverse/framr  https:/… R package …     7 R       
#>  5 sport_harvest_estimator  FRAMverse/sport… https:/… Decision s…     3 R       
#>  6 rrCoho                   FRAMverse/rrCoho https:/… Run recons…     3 NA      
#>  7 rmis                     FRAMverse/rmis   https:/… These scri…     0 R       
#>  8 regs_database            FRAMverse/regs_… https:/… Database w…     0 HTML    
#>  9 regulations_database     FRAMverse/regul… https:/… PosgreSQL …     0 NA      
#> 10 framrsquared             FRAMverse/framr… https:/… R Package …     9 R       
#> 11 snippets                 FRAMverse/snipp… https:/… Code Snipp…     1 HTML    
#> 12 framrosetta              FRAMverse/framr… https:/… Data libra…     1 R       
#> 13 pssp                     FRAMverse/pssp   https:/… Rewrite of…     0 R       
#> 14 FRAMBuilder              FRAMverse/FRAMB… https:/… NA              0 Visual …
#> 15 coding-practices         FRAMverse/codin… https:/… Our evolvi…     1 NA      
#> 16 FRAMverse.r-universe.dev FRAMverse/FRAMv… https:/… NA              0 NA      
#> 17 FRAM_automation          FRAMverse/FRAM_… https:/… Collin's d…     0 Visual …
#> 18 framqaqc                 FRAMverse/framq… https:/… QAQC tools…     0 R       
#> 19 .github                  FRAMverse/.gith… https:/… profile re…     0 NA      
#> 20 validatr                 FRAMverse/valid… https:/… One Stop S…     0 R       
```
