# Summarize information about a github R package

Summarize information about a github R package

## Usage

``` r
summarize_repository(repo_address, max_char = 70)
```

## Arguments

- repo_address:

  Github repository address for an R package, of the form
  "user/repository", as in `"FRAMverse/framrsquared"`

- max_char:

  Maximum number of characters to return in the "body" column.

## Value

List summarizing github repository information.

## See also

[`get_issues()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_issues.md),
[`get_pull_requests()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_pull_requests.md),
[`get_branch_activity()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_branch_activity.md)

## Examples

``` r
summarize_repository("FRAMverse/framrsquared")
#> $repo
#> [1] "framrsquared"
#> 
#> $repo_address
#> [1] "FRAMverse/framrsquared"
#> 
#> $repo_description
#> [1] "R Package interfacing with the FRAM databases"
#> 
#> $repo_long_summary
#> [1] "A convenient tool for interfacing with FRAM access databases"
#> 
#> $branch_activity
#>                            branch most_recent_update
#> 1                            main         2026-02-03
#> 2                             dev         2026-01-28
#> 3                 add/nr/checking         2025-11-24
#> 4            improve/modify/table         2025-10-31
#> 5                    nuke/fishery         2025-10-23
#> 6                   add/copy_runs         2025-10-13
#> 7                 add/sensitivity         2025-10-07
#> 8                     add/taaetrs         2025-09-05
#> 9            add/stock_comp_graph         2025-05-14
#> 10              add/fate_function         2025-04-23
#> 11                   fix/run_info         2025-04-23
#> 12       add/mortality/comparison         2025-04-21
#> 13              refactor/compares         2025-04-21
#> 14 update/filter/species/handling         2025-04-21
#> 15               fix/compare/runs         2025-04-04
#> 16          add/stock/proportions         2025-03-19
#> 17           refactor/post_season         2025-01-02
#> 18           update/documentation         2024-11-01
#> 19                    minortweaks         2024-10-10
#>                                                                             link
#> 1                            https://github.com/FRAMverse/framrsquared/tree/main
#> 2                             https://github.com/FRAMverse/framrsquared/tree/dev
#> 3                 https://github.com/FRAMverse/framrsquared/tree/add/nr/checking
#> 4            https://github.com/FRAMverse/framrsquared/tree/improve/modify/table
#> 5                    https://github.com/FRAMverse/framrsquared/tree/nuke/fishery
#> 6                   https://github.com/FRAMverse/framrsquared/tree/add/copy_runs
#> 7                 https://github.com/FRAMverse/framrsquared/tree/add/sensitivity
#> 8                     https://github.com/FRAMverse/framrsquared/tree/add/taaetrs
#> 9            https://github.com/FRAMverse/framrsquared/tree/add/stock_comp_graph
#> 10              https://github.com/FRAMverse/framrsquared/tree/add/fate_function
#> 11                   https://github.com/FRAMverse/framrsquared/tree/fix/run_info
#> 12       https://github.com/FRAMverse/framrsquared/tree/add/mortality/comparison
#> 13              https://github.com/FRAMverse/framrsquared/tree/refactor/compares
#> 14 https://github.com/FRAMverse/framrsquared/tree/update/filter/species/handling
#> 15               https://github.com/FRAMverse/framrsquared/tree/fix/compare/runs
#> 16          https://github.com/FRAMverse/framrsquared/tree/add/stock/proportions
#> 17           https://github.com/FRAMverse/framrsquared/tree/refactor/post_season
#> 18           https://github.com/FRAMverse/framrsquared/tree/update/documentation
#> 19                    https://github.com/FRAMverse/framrsquared/tree/minortweaks
#> 
#> $issues
#>                                                                                            title
#> 1                                                                      Write complete test suite
#> 2                                                           plot_stock_mortality_time_step() bug
#> 3                                              Add "Merge Coho Ocean Options" script as function
#> 4                   plot_impacts_per_catch_heatmap does not grid well when timesteps are missing
#> 5                                           add ability to specify mappings for compare_database
#> 6                                                     Update `plot_stock_comp` to handle Chinook
#> 7                                              Function which replicates merge ocean option code
#> 8                                                    filter_wa() isn't working right for Chinook
#> 9  `filter_flag()` is a safety function, but getting pulled into filter section of pkgdown site.
#> 10                                                     Add safety net to fishery scalers writing
#> 11                                               Add safety net to fishery scalers table reading
#> 12                                                 modify_table() needs help changing characters
#> 13                                               Update copy_fishery_scalers for more robustness
#> 14                                                Lock down stock tables to use only one species
#> 15                                                Add function to zero out one or more fisheries
#> 16                                                             Commercial net filter misbehaving
#> 17                                                  Do we want "populate VS SFRS" functionality?
#> 18            Function to summarize non-retention impacts in sport fisheries for specified stock
#> 19                                                            filter_union() and filter_invert()
#> 20                                                                      compare_fishery_inputs()
#> 21             update compare_runs to clarify fisheries whose inputs are not directly determined
#> 22                                                                   Add ER calculation function
#> 23                                          compare_* functions won't work on transfer databases
#> 24                                                                               Stock filtering
#> 25                                                             Add `describe_data` functionality
#> 26                                                  Replicate Derek's mortality aggregation tool
#>                                                                             body
#> 1      Use `testthat::skip_if_not()` to skip tests when the test databases ar...
#> 2       Yi was experiencing issues with a preseason chinook database when run...
#> 3      Request from @sthurner11. The following is a script used by coho model...
#> 4      Try custom filtering to commercial WA net -- end up with a 2x2 grid, b...
#> 5      currently compare_database() assumes run_ids match between the two dat...
#> 6         Right now the assignment of stock groups is using a LUT for coho only.
#> 7      During preseason we copy the ocean options into our NOF runs using 'me...
#> 8      Includes fisheries like central OR Troll and Sport, So Calif Troll and...
#> 9                                                                               
#> 10     For chinook, warn if making any changes to the fisheries that are over...
#> 11     The fishery scalers table can be misleading to look at -- we might hav...
#> 12     Currently `modify_table()` cannot replace character strings (and likel...
#> 13     Currently copy_fishery_scalers uses an "Update" call. This can give sc...
#> 14                                                              As appropriate. 
#> 15     - Would be very useful to be able to zero out individual fishery (or f...
#> 16               The fishery_ids used in `filter_commercial_wa_nt()` are wrong. 
#> 17     Working with @sthurner11 on making the VS Input Template from the fina...
#> 18     Tool to help us identify other-target fisheries that are impacting a s...
#> 19     Currently we can layer filters to look at the intersection of filters ...
#> 20     Failing to pick up changes in inputs where the flag has changed  e.g. ...
#> 21     Many of the treaty fisheries have harvests that are based on terminal ...
#> 22                                       Add function to calculate ERs directly.
#> 23     I was trying to use the compare functions on a transfer file with two ...
#> 24 @cbedwards-dfw \r\n\r\nIt'd be a good idea to have stock filtering as well...
#> 25     From conversation with @Ty-WDFW on 12/13/24. Add `describe_data()` fun...
#> 26     Derek has an excel-based tool that uses some complex logic and pivot t...
#>          date                                                 link
#> 1  2026-01-21 https://github.com/FRAMverse/framrsquared/issues/120
#> 2  2026-01-15 https://github.com/FRAMverse/framrsquared/issues/119
#> 3  2026-01-08 https://github.com/FRAMverse/framrsquared/issues/117
#> 4  2025-12-09 https://github.com/FRAMverse/framrsquared/issues/115
#> 5  2025-12-08 https://github.com/FRAMverse/framrsquared/issues/113
#> 6  2025-11-26 https://github.com/FRAMverse/framrsquared/issues/112
#> 7  2025-11-24 https://github.com/FRAMverse/framrsquared/issues/110
#> 8  2025-11-21 https://github.com/FRAMverse/framrsquared/issues/108
#> 9  2025-11-20 https://github.com/FRAMverse/framrsquared/issues/107
#> 10 2025-11-03 https://github.com/FRAMverse/framrsquared/issues/106
#> 11 2025-10-30 https://github.com/FRAMverse/framrsquared/issues/105
#> 12 2025-10-28 https://github.com/FRAMverse/framrsquared/issues/103
#> 13 2025-10-14 https://github.com/FRAMverse/framrsquared/issues/101
#> 14 2025-10-10 https://github.com/FRAMverse/framrsquared/issues/100
#> 15 2025-09-08  https://github.com/FRAMverse/framrsquared/issues/99
#> 16 2025-04-28  https://github.com/FRAMverse/framrsquared/issues/89
#> 17 2025-04-21  https://github.com/FRAMverse/framrsquared/issues/85
#> 18 2025-04-14  https://github.com/FRAMverse/framrsquared/issues/83
#> 19 2025-04-13  https://github.com/FRAMverse/framrsquared/issues/81
#> 20 2025-03-28  https://github.com/FRAMverse/framrsquared/issues/77
#> 21 2025-03-13  https://github.com/FRAMverse/framrsquared/issues/75
#> 22 2025-02-11  https://github.com/FRAMverse/framrsquared/issues/71
#> 23 2025-01-07  https://github.com/FRAMverse/framrsquared/issues/68
#> 24 2024-12-27  https://github.com/FRAMverse/framrsquared/issues/60
#> 25 2024-12-13  https://github.com/FRAMverse/framrsquared/issues/52
#> 26 2024-12-11  https://github.com/FRAMverse/framrsquared/issues/50
#> 
#> $pull_requests
#>                                                                    title
#> 1                                                        Add/nr/checking
#> 2                              Added proper string handling to modify_db
#> 3                                                 Added 'zero_fishery()'
#> 4 added two functions for comparing preseason and postseason mortalitie…
#> 5                                    refactored to support transfer runs
#> 6                                                        Add/sensitivity
#>                                                                            body
#> 1     Added the following functions to help identify problems with non-reten...
#> 2     Addressing #103. modify_table() writes a sql query based on the condit...
#> 3     Addressing #99. Adds `zero_fishery()` which 0s out the quota, scaler, ...
#> 4     `create_mort_comparison()` takes a focal year and focal stock and a pr...
#> 5 Addressing #68. \r\n\r\nChanged `compare_*` functions to use framrosetta t...
#> 6             Linear scaling of potential inputs for sensitivity analyses. #38 
#>         date                                               link
#> 1 2025-11-24 https://github.com/FRAMverse/framrsquared/pull/111
#> 2 2025-10-29 https://github.com/FRAMverse/framrsquared/pull/104
#> 3 2025-10-23 https://github.com/FRAMverse/framrsquared/pull/102
#> 4 2025-01-22  https://github.com/FRAMverse/framrsquared/pull/70
#> 5 2025-01-07  https://github.com/FRAMverse/framrsquared/pull/69
#> 6 2024-11-04  https://github.com/FRAMverse/framrsquared/pull/43
#> 
#> $github_dependencies
#> [1] "FRAMverse/framrosetta"
#> 
summarize_repository("cbedwards-dfw/xldiff")
#> $repo
#> [1] "xldiff"
#> 
#> $repo_address
#> [1] "cbedwards-dfw/xldiff"
#> 
#> $repo_description
#> [1] "Package to facilitate comparing excel files"
#> 
#> $repo_long_summary
#> [1] "`xldiff` provides tools to compare excel sheets, broadly inspired by \"diff\"-type functions. Provided functions can read sheets of two excel files and produce a third file that highlights cells that have changed. In the case of numeric changes, the direction of change is highlighted. These tools do not account for  structural changes in the sheets (e.g., the addition of a column), but are useful in tracking changed values in tables or parameter files. Utility functions developed to streamline formatting output files are also more broadly useful in programmatically formatting excel files using openxlsx."
#> 
#> $branch_activity
#>   branch most_recent_update                                              link
#> 1    dev         2026-02-03  https://github.com/cbedwards-dfw/xldiff/tree/dev
#> 2   main         2026-02-03 https://github.com/cbedwards-dfw/xldiff/tree/main
#> 
#> $issues
#>                                      title
#> 1 Consider better handling of text changes
#> 2                 Improve input validation
#> 3                      Add more unit tests
#>                                                                        body
#> 1 Currently xldiff does a poor job of handling sheets with many cells of...
#> 2         Use new `validate_*` for cell address / addresses, excel sheets. 
#> 3 At the very least, `blank_line_handling` functions should be easy to c...
#>         date                                              link
#> 1 2026-02-02 https://github.com/cbedwards-dfw/xldiff/issues/16
#> 2 2026-01-31 https://github.com/cbedwards-dfw/xldiff/issues/15
#> 3 2026-01-31 https://github.com/cbedwards-dfw/xldiff/issues/14
#> 
#> $pull_requests
#> NULL
#> 
#> $github_dependencies
#> [1] "JanMarvin/openxlsx2"
#> 
```
