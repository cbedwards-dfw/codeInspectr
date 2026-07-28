# Summarize information about a github R package

Primarily designed to pull information from R packages, but also works
for other repositories.

## Usage

``` r
summarize_repository(repo_address, max_char = 70)
```

## Arguments

- repo_address:

  Github repository address for an R package, of the form
  "user/repository", as in `"FRAMverse/framrsquared"`. Also accepts full
  URL, as in `"https://github.com/FRAMverse/framrsquared/"`

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
#> 1                    adding_tests         2026-06-09
#> 2                             dev         2026-04-27
#> 3                            main         2026-04-09
#> 4           cbedwards-dfw-patch-1         2026-04-08
#> 5             clean_up_formatting         2026-03-18
#> 6              remove_heatmap_cnr         2026-03-17
#> 7                     heatmap_fix         2026-03-13
#> 8          add_soncc_calculations         2026-02-21
#> 9                 add/nr/checking         2025-11-24
#> 10           improve/modify/table         2025-10-31
#> 11                   nuke/fishery         2025-10-23
#> 12                  add/copy_runs         2025-10-13
#> 13                add/sensitivity         2025-10-07
#> 14                    add/taaetrs         2025-09-05
#> 15           add/stock_comp_graph         2025-05-14
#> 16              add/fate_function         2025-04-23
#> 17                   fix/run_info         2025-04-23
#> 18       add/mortality/comparison         2025-04-21
#> 19              refactor/compares         2025-04-21
#> 20 update/filter/species/handling         2025-04-21
#> 21               fix/compare/runs         2025-04-04
#> 22          add/stock/proportions         2025-03-19
#> 23           refactor/post_season         2025-01-02
#> 24           update/documentation         2024-11-01
#> 25                    minortweaks         2024-10-10
#>                                                                             link
#> 1                    https://github.com/FRAMverse/framrsquared/tree/adding_tests
#> 2                             https://github.com/FRAMverse/framrsquared/tree/dev
#> 3                            https://github.com/FRAMverse/framrsquared/tree/main
#> 4           https://github.com/FRAMverse/framrsquared/tree/cbedwards-dfw-patch-1
#> 5             https://github.com/FRAMverse/framrsquared/tree/clean_up_formatting
#> 6              https://github.com/FRAMverse/framrsquared/tree/remove_heatmap_cnr
#> 7                     https://github.com/FRAMverse/framrsquared/tree/heatmap_fix
#> 8          https://github.com/FRAMverse/framrsquared/tree/add_soncc_calculations
#> 9                 https://github.com/FRAMverse/framrsquared/tree/add/nr/checking
#> 10           https://github.com/FRAMverse/framrsquared/tree/improve/modify/table
#> 11                   https://github.com/FRAMverse/framrsquared/tree/nuke/fishery
#> 12                  https://github.com/FRAMverse/framrsquared/tree/add/copy_runs
#> 13                https://github.com/FRAMverse/framrsquared/tree/add/sensitivity
#> 14                    https://github.com/FRAMverse/framrsquared/tree/add/taaetrs
#> 15           https://github.com/FRAMverse/framrsquared/tree/add/stock_comp_graph
#> 16              https://github.com/FRAMverse/framrsquared/tree/add/fate_function
#> 17                   https://github.com/FRAMverse/framrsquared/tree/fix/run_info
#> 18       https://github.com/FRAMverse/framrsquared/tree/add/mortality/comparison
#> 19              https://github.com/FRAMverse/framrsquared/tree/refactor/compares
#> 20 https://github.com/FRAMverse/framrsquared/tree/update/filter/species/handling
#> 21               https://github.com/FRAMverse/framrsquared/tree/fix/compare/runs
#> 22          https://github.com/FRAMverse/framrsquared/tree/add/stock/proportions
#> 23           https://github.com/FRAMverse/framrsquared/tree/refactor/post_season
#> 24           https://github.com/FRAMverse/framrsquared/tree/update/documentation
#> 25                    https://github.com/FRAMverse/framrsquared/tree/minortweaks
#> 
#> $issues
#>                                                                                title
#> 1                               update validations to use validatr where appropriate
#> 2                                                        Update initialize_project()
#> 3                                          Conversations to have with the FRAM team.
#> 4                                           Make function so simulate runs using LHS
#> 5                              make_batch_runs should return the ids of the new runs
#> 6                      Add better error to make_batch_run if tamm file doesn't exist
#> 7                                      Set `label = FALSE` as default for fetch_data
#> 8                                                    Work on framrsquared cheatsheet
#> 9                                               move compare_databases to `framqaqc`
#> 10         Check that functions don't break when exposed to a mixed species database
#> 11                                                         Communicate 0.8.2 release
#> 12                                                      Add combined filter handling
#> 13                                                     consistent verbose/quiet args
#> 14                                         Update compare_runs with extra quota info
#> 15                              Tradeoff matrix / plot for sport fisheries/timesteps
#> 16                                                               Clean up formatting
#> 17                                                 Add tribal vs nontribal filtering
#> 18                   Update postseason function to be explicit it its `across` call.
#> 19                                   Add documentation for luts included in package?
#> 20                                          Backwards FRAM convergence visualization
#> 21                                                        bk_fram_checks_coho() SFRS
#> 22                   bk_fram_checks - remove coastal iteration check going backwards
#> 23                                                         Write complete test suite
#> 24                                 Add "Merge Coho Ocean Options" script as function
#> 25      plot_impacts_per_catch_heatmap does not grid well when timesteps are missing
#> 26                              add ability to specify mappings for compare_database
#> 27                                        Update `plot_stock_comp` to handle Chinook
#> 28                                 Function which replicates merge ocean option code
#> 29                                       filter_wa() isn't working right for Chinook
#> 30                                         Add safety net to fishery scalers writing
#> 31                                   Update copy_fishery_scalers for more robustness
#> 32                                    Lock down stock tables to use only one species
#> 33                                    Add function to zero out one or more fisheries
#> 34                                                 Commercial net filter misbehaving
#> 35                                      Do we want "populate VS SFRS" functionality?
#> 36                                                filter_union() and filter_invert()
#> 37                                                          compare_fishery_inputs()
#> 38 update compare_runs to clarify fisheries whose inputs are not directly determined
#> 39                                                       Add ER calculation function
#> 40                              compare_* functions won't work on transfer databases
#> 41                                                                   Stock filtering
#> 42                                                 Add `describe_data` functionality
#> 43                                      Replicate Derek's mortality aggregation tool
#>                                                                             body
#> 1                                                                               
#> 2      - The compiling of quarto docs buries them pretty deep. Have them save...
#> 3      I want to check in with the FRAM team on the following items to get co...
#> 4      Elaboration on our sensitivity analyses functions. Users identify the ...
#> 5                                                                               
#> 6             Currently run copying happens first, and error seems to be silent!
#> 7                                                                               
#> 8                                                                               
#> 9      This function is only intended for QAQC of fram changes, so shouldn't ...
#> 10     I've created the following files, and want to confirm that functions e...
#> 11     Goal: barebones framverse website, make a blog post on the changes wit...
#> 12     - Filter_union() --> takes two filters, use the alternative return app...
#> 13                                                                              
#> 14     Currently when a flag changes, compare_runs reports the flag but not i...
#> 15     Show costs of changes to one fishery on another fishery. Should just b...
#> 16     I haven't been using lintR or the format cleaning plugin. I should app...
#> 17     From Collin: brainstorm a LUT with any relevant terms, and we can buil...
#> 18                                                                              
#> 19     Only used internally and not exported, but probably helpful to include...
#> 20     @Angelikahagen wrote some code to visualize convergence to target esca...
#> 21     Add a check to make sure the stock fishery rate scalers match between ...
#> 22     https://github.com/FRAMverse/framrsquared/blob/c838dc922c195275ad9a847...
#> 23     Use `testthat::skip_if_not()` to skip tests when the test databases ar...
#> 24     Request from @sthurner11. The following is a script used by coho model...
#> 25     Try custom filtering to commercial WA net -- end up with a 2x2 grid, b...
#> 26     currently compare_database() assumes run_ids match between the two dat...
#> 27        Right now the assignment of stock groups is using a LUT for coho only.
#> 28     During preseason we copy the ocean options into our NOF runs using 'me...
#> 29     Includes fisheries like central OR Troll and Sport, So Calif Troll and...
#> 30     For chinook, warn if making any changes to the fisheries that are over...
#> 31     Currently copy_fishery_scalers uses an "Update" call. This can give sc...
#> 32                                                              As appropriate. 
#> 33     - Would be very useful to be able to zero out individual fishery (or f...
#> 34               The fishery_ids used in `filter_commercial_wa_nt()` are wrong. 
#> 35     Working with @sthurner11 on making the VS Input Template from the fina...
#> 36     Currently we can layer filters to look at the intersection of filters ...
#> 37     Failing to pick up changes in inputs where the flag has changed  e.g. ...
#> 38     Many of the treaty fisheries have harvests that are based on terminal ...
#> 39                                       Add function to calculate ERs directly.
#> 40     I was trying to use the compare functions on a transfer file with two ...
#> 41 @cbedwards-dfw \r\n\r\nIt'd be a good idea to have stock filtering as well...
#> 42     From conversation with @Ty-WDFW on 12/13/24. Add `describe_data()` fun...
#> 43     Derek has an excel-based tool that uses some complex logic and pivot t...
#>          date                                                 link
#> 1  2026-06-04 https://github.com/FRAMverse/framrsquared/issues/189
#> 2  2026-05-07 https://github.com/FRAMverse/framrsquared/issues/188
#> 3  2026-05-05 https://github.com/FRAMverse/framrsquared/issues/187
#> 4  2026-05-05 https://github.com/FRAMverse/framrsquared/issues/186
#> 5  2026-05-01 https://github.com/FRAMverse/framrsquared/issues/185
#> 6  2026-04-30 https://github.com/FRAMverse/framrsquared/issues/184
#> 7  2026-04-28 https://github.com/FRAMverse/framrsquared/issues/183
#> 8  2026-04-28 https://github.com/FRAMverse/framrsquared/issues/182
#> 9  2026-04-27 https://github.com/FRAMverse/framrsquared/issues/181
#> 10 2026-04-23 https://github.com/FRAMverse/framrsquared/issues/180
#> 11 2026-04-23 https://github.com/FRAMverse/framrsquared/issues/178
#> 12 2026-04-11 https://github.com/FRAMverse/framrsquared/issues/173
#> 13 2026-03-31 https://github.com/FRAMverse/framrsquared/issues/159
#> 14 2026-03-27 https://github.com/FRAMverse/framrsquared/issues/155
#> 15 2026-03-23 https://github.com/FRAMverse/framrsquared/issues/151
#> 16 2026-03-18 https://github.com/FRAMverse/framrsquared/issues/147
#> 17 2026-03-06 https://github.com/FRAMverse/framrsquared/issues/135
#> 18 2026-02-24 https://github.com/FRAMverse/framrsquared/issues/129
#> 19 2026-02-20 https://github.com/FRAMverse/framrsquared/issues/127
#> 20 2026-02-11 https://github.com/FRAMverse/framrsquared/issues/124
#> 21 2026-02-11 https://github.com/FRAMverse/framrsquared/issues/123
#> 22 2026-02-11 https://github.com/FRAMverse/framrsquared/issues/122
#> 23 2026-01-21 https://github.com/FRAMverse/framrsquared/issues/120
#> 24 2026-01-08 https://github.com/FRAMverse/framrsquared/issues/117
#> 25 2025-12-09 https://github.com/FRAMverse/framrsquared/issues/115
#> 26 2025-12-08 https://github.com/FRAMverse/framrsquared/issues/113
#> 27 2025-11-26 https://github.com/FRAMverse/framrsquared/issues/112
#> 28 2025-11-24 https://github.com/FRAMverse/framrsquared/issues/110
#> 29 2025-11-21 https://github.com/FRAMverse/framrsquared/issues/108
#> 30 2025-11-03 https://github.com/FRAMverse/framrsquared/issues/106
#> 31 2025-10-14 https://github.com/FRAMverse/framrsquared/issues/101
#> 32 2025-10-10 https://github.com/FRAMverse/framrsquared/issues/100
#> 33 2025-09-08  https://github.com/FRAMverse/framrsquared/issues/99
#> 34 2025-04-28  https://github.com/FRAMverse/framrsquared/issues/89
#> 35 2025-04-21  https://github.com/FRAMverse/framrsquared/issues/85
#> 36 2025-04-13  https://github.com/FRAMverse/framrsquared/issues/81
#> 37 2025-03-28  https://github.com/FRAMverse/framrsquared/issues/77
#> 38 2025-03-13  https://github.com/FRAMverse/framrsquared/issues/75
#> 39 2025-02-11  https://github.com/FRAMverse/framrsquared/issues/71
#> 40 2025-01-07  https://github.com/FRAMverse/framrsquared/issues/68
#> 41 2024-12-27  https://github.com/FRAMverse/framrsquared/issues/60
#> 42 2024-12-13  https://github.com/FRAMverse/framrsquared/issues/52
#> 43 2024-12-11  https://github.com/FRAMverse/framrsquared/issues/50
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
#> $r_package
#> [1] TRUE
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
#>                                                              title
#> 1 Identify when formulas are present in a sheet or region of sheet
#> 2                                       Add an "all sheets" option
#> 3                         Consider better handling of text changes
#> 4                                         Improve input validation
#> 5                                              Add more unit tests
#>                                                                        body
#> 1 Useful if we think there shouldn't be formulas in a datasheet, or a re...
#> 2 Based on experiences doing QAQC for the STT, it would be helpful to ha...
#> 3 Currently xldiff does a poor job of handling sheets with many cells of...
#> 4         Use new `validate_*` for cell address / addresses, excel sheets. 
#> 5 At the very least, `blank_line_handling` functions should be easy to c...
#>         date                                              link
#> 1 2026-02-17 https://github.com/cbedwards-dfw/xldiff/issues/20
#> 2 2026-02-13 https://github.com/cbedwards-dfw/xldiff/issues/19
#> 3 2026-02-02 https://github.com/cbedwards-dfw/xldiff/issues/16
#> 4 2026-01-31 https://github.com/cbedwards-dfw/xldiff/issues/15
#> 5 2026-01-31 https://github.com/cbedwards-dfw/xldiff/issues/14
#> 
#> $pull_requests
#> NULL
#> 
#> $github_dependencies
#> [1] "JanMarvin/openxlsx2"
#> 
#> $r_package
#> [1] TRUE
#> 
```
