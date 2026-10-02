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
#> 1                             dev         2026-09-22
#> 2                            main         2026-09-17
#> 3                   update_readme         2026-09-17
#> 4         feat/bk_fram_automation         2026-07-30
#> 5           cbedwards-dfw-patch-1         2026-04-08
#> 6             clean_up_formatting         2026-03-18
#> 7              remove_heatmap_cnr         2026-03-17
#> 8                     heatmap_fix         2026-03-13
#> 9          add_soncc_calculations         2026-02-21
#> 10                add/nr/checking         2025-11-24
#> 11           improve/modify/table         2025-10-31
#> 12                   nuke/fishery         2025-10-23
#> 13                  add/copy_runs         2025-10-13
#> 14                add/sensitivity         2025-10-07
#> 15                    add/taaetrs         2025-09-05
#> 16           add/stock_comp_graph         2025-05-14
#> 17              add/fate_function         2025-04-23
#> 18                   fix/run_info         2025-04-23
#> 19       add/mortality/comparison         2025-04-21
#> 20              refactor/compares         2025-04-21
#> 21 update/filter/species/handling         2025-04-21
#> 22               fix/compare/runs         2025-04-04
#> 23          add/stock/proportions         2025-03-19
#> 24           refactor/post_season         2025-01-02
#> 25           update/documentation         2024-11-01
#> 26                    minortweaks         2024-10-10
#>                                                                             link
#> 1                             https://github.com/FRAMverse/framrsquared/tree/dev
#> 2                            https://github.com/FRAMverse/framrsquared/tree/main
#> 3                   https://github.com/FRAMverse/framrsquared/tree/update_readme
#> 4         https://github.com/FRAMverse/framrsquared/tree/feat/bk_fram_automation
#> 5           https://github.com/FRAMverse/framrsquared/tree/cbedwards-dfw-patch-1
#> 6             https://github.com/FRAMverse/framrsquared/tree/clean_up_formatting
#> 7              https://github.com/FRAMverse/framrsquared/tree/remove_heatmap_cnr
#> 8                     https://github.com/FRAMverse/framrsquared/tree/heatmap_fix
#> 9          https://github.com/FRAMverse/framrsquared/tree/add_soncc_calculations
#> 10                https://github.com/FRAMverse/framrsquared/tree/add/nr/checking
#> 11           https://github.com/FRAMverse/framrsquared/tree/improve/modify/table
#> 12                   https://github.com/FRAMverse/framrsquared/tree/nuke/fishery
#> 13                  https://github.com/FRAMverse/framrsquared/tree/add/copy_runs
#> 14                https://github.com/FRAMverse/framrsquared/tree/add/sensitivity
#> 15                    https://github.com/FRAMverse/framrsquared/tree/add/taaetrs
#> 16           https://github.com/FRAMverse/framrsquared/tree/add/stock_comp_graph
#> 17              https://github.com/FRAMverse/framrsquared/tree/add/fate_function
#> 18                   https://github.com/FRAMverse/framrsquared/tree/fix/run_info
#> 19       https://github.com/FRAMverse/framrsquared/tree/add/mortality/comparison
#> 20              https://github.com/FRAMverse/framrsquared/tree/refactor/compares
#> 21 https://github.com/FRAMverse/framrsquared/tree/update/filter/species/handling
#> 22               https://github.com/FRAMverse/framrsquared/tree/fix/compare/runs
#> 23          https://github.com/FRAMverse/framrsquared/tree/add/stock/proportions
#> 24           https://github.com/FRAMverse/framrsquared/tree/refactor/post_season
#> 25           https://github.com/FRAMverse/framrsquared/tree/update/documentation
#> 26                    https://github.com/FRAMverse/framrsquared/tree/minortweaks
#> 
#> $issues
#>                                                                                title
#> 1                        Add window RMSD convergence calculator for TAMM convergence
#> 2                                                    add Coho bkFRAM automation tool
#> 3                               update validations to use validatr where appropriate
#> 4                                                        Update initialize_project()
#> 5                                          Conversations to have with the FRAM team.
#> 6                                           Make function so simulate runs using LHS
#> 7                              make_batch_runs should return the ids of the new runs
#> 8                      Add better error to make_batch_run if tamm file doesn't exist
#> 9                                      Set `label = FALSE` as default for fetch_data
#> 10                                                   Work on framrsquared cheatsheet
#> 11         Check that functions don't break when exposed to a mixed species database
#> 12                                                         Communicate 0.8.2 release
#> 13                                                      Add combined filter handling
#> 14                                                     consistent verbose/quiet args
#> 15                                         Update compare_runs with extra quota info
#> 16                              Tradeoff matrix / plot for sport fisheries/timesteps
#> 17                                                               Clean up formatting
#> 18                                                 Add tribal vs nontribal filtering
#> 19                   Update postseason function to be explicit it its `across` call.
#> 20                                   Add documentation for luts included in package?
#> 21                                                        bk_fram_checks_coho() SFRS
#> 22                   bk_fram_checks - remove coastal iteration check going backwards
#> 23                                 Add "Merge Coho Ocean Options" script as function
#> 24      plot_impacts_per_catch_heatmap does not grid well when timesteps are missing
#> 25                                        Update `plot_stock_comp` to handle Chinook
#> 26                                 Function which replicates merge ocean option code
#> 27                                       filter_wa() isn't working right for Chinook
#> 28                                         Add safety net to fishery scalers writing
#> 29                                   Update copy_fishery_scalers for more robustness
#> 30                                    Lock down stock tables to use only one species
#> 31                                    Add function to zero out one or more fisheries
#> 32                                                 Commercial net filter misbehaving
#> 33                                      Do we want "populate VS SFRS" functionality?
#> 34                                                filter_union() and filter_invert()
#> 35                                                          compare_fishery_inputs()
#> 36 update compare_runs to clarify fisheries whose inputs are not directly determined
#> 37                                                       Add ER calculation function
#> 38                              compare_* functions won't work on transfer databases
#> 39                                                                   Stock filtering
#> 40                                                 Add `describe_data` functionality
#> 41                                      Replicate Derek's mortality aggregation tool
#>                                                                             body
#> 1      <img width="662" height="314" alt="Image" src="https://github.com/user...
#> 2     the Coho bkFRAM process involves\n(a) saving current values for some fi...
#> 3                                                                               
#> 4      - The compiling of quarto docs buries them pretty deep. Have them save...
#> 5      I want to check in with the FRAM team on the following items to get co...
#> 6      Elaboration on our sensitivity analyses functions. Users identify the ...
#> 7                                                                               
#> 8             Currently run copying happens first, and error seems to be silent!
#> 9                                                                               
#> 10                                                                              
#> 11     I've created the following files, and want to confirm that functions e...
#> 12     Goal: barebones framverse website, make a blog post on the changes wit...
#> 13     - Filter_union() --> takes two filters, use the alternative return app...
#> 14                                                                              
#> 15     Currently when a flag changes, compare_runs reports the flag but not i...
#> 16     Show costs of changes to one fishery on another fishery. Should just b...
#> 17     I haven't been using lintR or the format cleaning plugin. I should app...
#> 18     From Collin: brainstorm a LUT with any relevant terms, and we can buil...
#> 19                                                                              
#> 20     Only used internally and not exported, but probably helpful to include...
#> 21     Add a check to make sure the stock fishery rate scalers match between ...
#> 22     https://github.com/FRAMverse/framrsquared/blob/c838dc922c195275ad9a847...
#> 23     Request from @sthurner11. The following is a script used by coho model...
#> 24     Try custom filtering to commercial WA net -- end up with a 2x2 grid, b...
#> 25        Right now the assignment of stock groups is using a LUT for coho only.
#> 26     During preseason we copy the ocean options into our NOF runs using 'me...
#> 27     Includes fisheries like central OR Troll and Sport, So Calif Troll and...
#> 28     For chinook, warn if making any changes to the fisheries that are over...
#> 29     Currently copy_fishery_scalers uses an "Update" call. This can give sc...
#> 30                                                              As appropriate. 
#> 31     - Would be very useful to be able to zero out individual fishery (or f...
#> 32               The fishery_ids used in `filter_commercial_wa_nt()` are wrong. 
#> 33     Working with @sthurner11 on making the VS Input Template from the fina...
#> 34     Currently we can layer filters to look at the intersection of filters ...
#> 35     Failing to pick up changes in inputs where the flag has changed  e.g. ...
#> 36     Many of the treaty fisheries have harvests that are based on terminal ...
#> 37                                       Add function to calculate ERs directly.
#> 38     I was trying to use the compare functions on a transfer file with two ...
#> 39 @cbedwards-dfw \r\n\r\nIt'd be a good idea to have stock filtering as well...
#> 40     From conversation with @Ty-WDFW on 12/13/24. Add `describe_data()` fun...
#> 41     Derek has an excel-based tool that uses some complex logic and pivot t...
#>          date                                                 link
#> 1  2026-09-16 https://github.com/FRAMverse/framrsquared/issues/201
#> 2  2026-07-29 https://github.com/FRAMverse/framrsquared/issues/190
#> 3  2026-06-04 https://github.com/FRAMverse/framrsquared/issues/189
#> 4  2026-05-07 https://github.com/FRAMverse/framrsquared/issues/188
#> 5  2026-05-05 https://github.com/FRAMverse/framrsquared/issues/187
#> 6  2026-05-05 https://github.com/FRAMverse/framrsquared/issues/186
#> 7  2026-05-01 https://github.com/FRAMverse/framrsquared/issues/185
#> 8  2026-04-30 https://github.com/FRAMverse/framrsquared/issues/184
#> 9  2026-04-28 https://github.com/FRAMverse/framrsquared/issues/183
#> 10 2026-04-28 https://github.com/FRAMverse/framrsquared/issues/182
#> 11 2026-04-23 https://github.com/FRAMverse/framrsquared/issues/180
#> 12 2026-04-23 https://github.com/FRAMverse/framrsquared/issues/178
#> 13 2026-04-11 https://github.com/FRAMverse/framrsquared/issues/173
#> 14 2026-03-31 https://github.com/FRAMverse/framrsquared/issues/159
#> 15 2026-03-27 https://github.com/FRAMverse/framrsquared/issues/155
#> 16 2026-03-23 https://github.com/FRAMverse/framrsquared/issues/151
#> 17 2026-03-18 https://github.com/FRAMverse/framrsquared/issues/147
#> 18 2026-03-06 https://github.com/FRAMverse/framrsquared/issues/135
#> 19 2026-02-24 https://github.com/FRAMverse/framrsquared/issues/129
#> 20 2026-02-20 https://github.com/FRAMverse/framrsquared/issues/127
#> 21 2026-02-11 https://github.com/FRAMverse/framrsquared/issues/123
#> 22 2026-02-11 https://github.com/FRAMverse/framrsquared/issues/122
#> 23 2026-01-08 https://github.com/FRAMverse/framrsquared/issues/117
#> 24 2025-12-09 https://github.com/FRAMverse/framrsquared/issues/115
#> 25 2025-11-26 https://github.com/FRAMverse/framrsquared/issues/112
#> 26 2025-11-24 https://github.com/FRAMverse/framrsquared/issues/110
#> 27 2025-11-21 https://github.com/FRAMverse/framrsquared/issues/108
#> 28 2025-11-03 https://github.com/FRAMverse/framrsquared/issues/106
#> 29 2025-10-14 https://github.com/FRAMverse/framrsquared/issues/101
#> 30 2025-10-10 https://github.com/FRAMverse/framrsquared/issues/100
#> 31 2025-09-08  https://github.com/FRAMverse/framrsquared/issues/99
#> 32 2025-04-28  https://github.com/FRAMverse/framrsquared/issues/89
#> 33 2025-04-21  https://github.com/FRAMverse/framrsquared/issues/85
#> 34 2025-04-13  https://github.com/FRAMverse/framrsquared/issues/81
#> 35 2025-03-28  https://github.com/FRAMverse/framrsquared/issues/77
#> 36 2025-03-13  https://github.com/FRAMverse/framrsquared/issues/75
#> 37 2025-02-11  https://github.com/FRAMverse/framrsquared/issues/71
#> 38 2025-01-07  https://github.com/FRAMverse/framrsquared/issues/68
#> 39 2024-12-27  https://github.com/FRAMverse/framrsquared/issues/60
#> 40 2024-12-13  https://github.com/FRAMverse/framrsquared/issues/52
#> 41 2024-12-11  https://github.com/FRAMverse/framrsquared/issues/50
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
