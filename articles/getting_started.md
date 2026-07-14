# getting_started

``` r

library(codeInspectr)
library(framrsquared)
```

    ## 
    ##              .
    ##             ":"
    ##           ___:____     |"\/"|
    ##         ,'        `.    \  /
    ##         |  O        \___/ |
    ##       ~^~^~^~^~^~^~^~^~^~^~^~^~
    ##           framrsquared 0.8.1
    ## 

## Summarizing the status of a package

These functions provide information about github repositories. They are
intended for use in looking at R packages, but all of them except
[`summarize_repository()`](https://cbedwards-dfw.github.io/codeInspectr/reference/summarize_repository.md)
work on non-package repositories as well.

[`summarize_repository()`](https://cbedwards-dfw.github.io/codeInspectr/reference/summarize_repository.md)
is the primary tool here. It provides information on

- the active branches (aside from the `gh-pages` branch, which is used
  for pkgdown documentation sites) and when they were last updated, with
  links
- the open Issues, when they were posted, the start of the initial issue
  description, with links
- the open Pull Requests, with equivalent information
- any dependencies on non-cran packages

These packages do not need to be installed. Instead, provide the
identifier parts of the github repository url: the owner and the
repository name.

``` r

summarize_repository("FRAMverse/framrsquared")
```

    ## $repo
    ## [1] "framrsquared"
    ## 
    ## $repo_address
    ## [1] "FRAMverse/framrsquared"
    ## 
    ## $repo_description
    ## [1] "R Package interfacing with the FRAM databases"
    ## 
    ## $repo_long_summary
    ## [1] "A convenient tool for interfacing with FRAM access databases"
    ## 
    ## $branch_activity
    ##                            branch most_recent_update
    ## 1                    adding_tests         2026-06-09
    ## 2                             dev         2026-04-27
    ## 3                            main         2026-04-09
    ## 4           cbedwards-dfw-patch-1         2026-04-08
    ## 5             clean_up_formatting         2026-03-18
    ## 6              remove_heatmap_cnr         2026-03-17
    ## 7                     heatmap_fix         2026-03-13
    ## 8          add_soncc_calculations         2026-02-21
    ## 9                 add/nr/checking         2025-11-24
    ## 10           improve/modify/table         2025-10-31
    ## 11                   nuke/fishery         2025-10-23
    ## 12                  add/copy_runs         2025-10-13
    ## 13                add/sensitivity         2025-10-07
    ## 14                    add/taaetrs         2025-09-05
    ## 15           add/stock_comp_graph         2025-05-14
    ## 16              add/fate_function         2025-04-23
    ## 17                   fix/run_info         2025-04-23
    ## 18       add/mortality/comparison         2025-04-21
    ## 19              refactor/compares         2025-04-21
    ## 20 update/filter/species/handling         2025-04-21
    ## 21               fix/compare/runs         2025-04-04
    ## 22          add/stock/proportions         2025-03-19
    ## 23           refactor/post_season         2025-01-02
    ## 24           update/documentation         2024-11-01
    ## 25                    minortweaks         2024-10-10
    ##                                                                             link
    ## 1                    https://github.com/FRAMverse/framrsquared/tree/adding_tests
    ## 2                             https://github.com/FRAMverse/framrsquared/tree/dev
    ## 3                            https://github.com/FRAMverse/framrsquared/tree/main
    ## 4           https://github.com/FRAMverse/framrsquared/tree/cbedwards-dfw-patch-1
    ## 5             https://github.com/FRAMverse/framrsquared/tree/clean_up_formatting
    ## 6              https://github.com/FRAMverse/framrsquared/tree/remove_heatmap_cnr
    ## 7                     https://github.com/FRAMverse/framrsquared/tree/heatmap_fix
    ## 8          https://github.com/FRAMverse/framrsquared/tree/add_soncc_calculations
    ## 9                 https://github.com/FRAMverse/framrsquared/tree/add/nr/checking
    ## 10           https://github.com/FRAMverse/framrsquared/tree/improve/modify/table
    ## 11                   https://github.com/FRAMverse/framrsquared/tree/nuke/fishery
    ## 12                  https://github.com/FRAMverse/framrsquared/tree/add/copy_runs
    ## 13                https://github.com/FRAMverse/framrsquared/tree/add/sensitivity
    ## 14                    https://github.com/FRAMverse/framrsquared/tree/add/taaetrs
    ## 15           https://github.com/FRAMverse/framrsquared/tree/add/stock_comp_graph
    ## 16              https://github.com/FRAMverse/framrsquared/tree/add/fate_function
    ## 17                   https://github.com/FRAMverse/framrsquared/tree/fix/run_info
    ## 18       https://github.com/FRAMverse/framrsquared/tree/add/mortality/comparison
    ## 19              https://github.com/FRAMverse/framrsquared/tree/refactor/compares
    ## 20 https://github.com/FRAMverse/framrsquared/tree/update/filter/species/handling
    ## 21               https://github.com/FRAMverse/framrsquared/tree/fix/compare/runs
    ## 22          https://github.com/FRAMverse/framrsquared/tree/add/stock/proportions
    ## 23           https://github.com/FRAMverse/framrsquared/tree/refactor/post_season
    ## 24           https://github.com/FRAMverse/framrsquared/tree/update/documentation
    ## 25                    https://github.com/FRAMverse/framrsquared/tree/minortweaks
    ## 
    ## $issues
    ##                                                                                title
    ## 1                               update validations to use validatr where appropriate
    ## 2                                                        Update initialize_project()
    ## 3                                          Conversations to have with the FRAM team.
    ## 4                                           Make function so simulate runs using LHS
    ## 5                              make_batch_runs should return the ids of the new runs
    ## 6                      Add better error to make_batch_run if tamm file doesn't exist
    ## 7                                      Set `label = FALSE` as default for fetch_data
    ## 8                                                    Work on framrsquared cheatsheet
    ## 9                                               move compare_databases to `framqaqc`
    ## 10         Check that functions don't break when exposed to a mixed species database
    ## 11                                                         Communicate 0.8.2 release
    ## 12                                                      Add combined filter handling
    ## 13                                                     consistent verbose/quiet args
    ## 14                                         Update compare_runs with extra quota info
    ## 15                              Tradeoff matrix / plot for sport fisheries/timesteps
    ## 16                                                               Clean up formatting
    ## 17                                                 Add tribal vs nontribal filtering
    ## 18                   Update postseason function to be explicit it its `across` call.
    ## 19                                   Add documentation for luts included in package?
    ## 20                                          Backwards FRAM convergence visualization
    ## 21                                                        bk_fram_checks_coho() SFRS
    ## 22                   bk_fram_checks - remove coastal iteration check going backwards
    ## 23                                                         Write complete test suite
    ## 24                                 Add "Merge Coho Ocean Options" script as function
    ## 25      plot_impacts_per_catch_heatmap does not grid well when timesteps are missing
    ## 26                              add ability to specify mappings for compare_database
    ## 27                                        Update `plot_stock_comp` to handle Chinook
    ## 28                                 Function which replicates merge ocean option code
    ## 29                                       filter_wa() isn't working right for Chinook
    ## 30                                         Add safety net to fishery scalers writing
    ## 31                                   Update copy_fishery_scalers for more robustness
    ## 32                                    Lock down stock tables to use only one species
    ## 33                                    Add function to zero out one or more fisheries
    ## 34                                                 Commercial net filter misbehaving
    ## 35                                      Do we want "populate VS SFRS" functionality?
    ## 36                                                filter_union() and filter_invert()
    ## 37                                                          compare_fishery_inputs()
    ## 38 update compare_runs to clarify fisheries whose inputs are not directly determined
    ## 39                                                       Add ER calculation function
    ## 40                              compare_* functions won't work on transfer databases
    ## 41                                                                   Stock filtering
    ## 42                                                 Add `describe_data` functionality
    ## 43                                      Replicate Derek's mortality aggregation tool
    ##                                                                             body
    ## 1                                                                               
    ## 2      - The compiling of quarto docs buries them pretty deep. Have them save...
    ## 3      I want to check in with the FRAM team on the following items to get co...
    ## 4      Elaboration on our sensitivity analyses functions. Users identify the ...
    ## 5                                                                               
    ## 6             Currently run copying happens first, and error seems to be silent!
    ## 7                                                                               
    ## 8                                                                               
    ## 9      This function is only intended for QAQC of fram changes, so shouldn't ...
    ## 10     I've created the following files, and want to confirm that functions e...
    ## 11     Goal: barebones framverse website, make a blog post on the changes wit...
    ## 12     - Filter_union() --> takes two filters, use the alternative return app...
    ## 13                                                                              
    ## 14     Currently when a flag changes, compare_runs reports the flag but not i...
    ## 15     Show costs of changes to one fishery on another fishery. Should just b...
    ## 16     I haven't been using lintR or the format cleaning plugin. I should app...
    ## 17     From Collin: brainstorm a LUT with any relevant terms, and we can buil...
    ## 18                                                                              
    ## 19     Only used internally and not exported, but probably helpful to include...
    ## 20     @Angelikahagen wrote some code to visualize convergence to target esca...
    ## 21     Add a check to make sure the stock fishery rate scalers match between ...
    ## 22     https://github.com/FRAMverse/framrsquared/blob/c838dc922c195275ad9a847...
    ## 23     Use `testthat::skip_if_not()` to skip tests when the test databases ar...
    ## 24     Request from @sthurner11. The following is a script used by coho model...
    ## 25     Try custom filtering to commercial WA net -- end up with a 2x2 grid, b...
    ## 26     currently compare_database() assumes run_ids match between the two dat...
    ## 27        Right now the assignment of stock groups is using a LUT for coho only.
    ## 28     During preseason we copy the ocean options into our NOF runs using 'me...
    ## 29     Includes fisheries like central OR Troll and Sport, So Calif Troll and...
    ## 30     For chinook, warn if making any changes to the fisheries that are over...
    ## 31     Currently copy_fishery_scalers uses an "Update" call. This can give sc...
    ## 32                                                              As appropriate. 
    ## 33     - Would be very useful to be able to zero out individual fishery (or f...
    ## 34               The fishery_ids used in `filter_commercial_wa_nt()` are wrong. 
    ## 35     Working with @sthurner11 on making the VS Input Template from the fina...
    ## 36     Currently we can layer filters to look at the intersection of filters ...
    ## 37     Failing to pick up changes in inputs where the flag has changed  e.g. ...
    ## 38     Many of the treaty fisheries have harvests that are based on terminal ...
    ## 39                                       Add function to calculate ERs directly.
    ## 40     I was trying to use the compare functions on a transfer file with two ...
    ## 41 @cbedwards-dfw \r\n\r\nIt'd be a good idea to have stock filtering as well...
    ## 42     From conversation with @Ty-WDFW on 12/13/24. Add `describe_data()` fun...
    ## 43     Derek has an excel-based tool that uses some complex logic and pivot t...
    ##          date                                                 link
    ## 1  2026-06-04 https://github.com/FRAMverse/framrsquared/issues/189
    ## 2  2026-05-07 https://github.com/FRAMverse/framrsquared/issues/188
    ## 3  2026-05-05 https://github.com/FRAMverse/framrsquared/issues/187
    ## 4  2026-05-05 https://github.com/FRAMverse/framrsquared/issues/186
    ## 5  2026-05-01 https://github.com/FRAMverse/framrsquared/issues/185
    ## 6  2026-04-30 https://github.com/FRAMverse/framrsquared/issues/184
    ## 7  2026-04-28 https://github.com/FRAMverse/framrsquared/issues/183
    ## 8  2026-04-28 https://github.com/FRAMverse/framrsquared/issues/182
    ## 9  2026-04-27 https://github.com/FRAMverse/framrsquared/issues/181
    ## 10 2026-04-23 https://github.com/FRAMverse/framrsquared/issues/180
    ## 11 2026-04-23 https://github.com/FRAMverse/framrsquared/issues/178
    ## 12 2026-04-11 https://github.com/FRAMverse/framrsquared/issues/173
    ## 13 2026-03-31 https://github.com/FRAMverse/framrsquared/issues/159
    ## 14 2026-03-27 https://github.com/FRAMverse/framrsquared/issues/155
    ## 15 2026-03-23 https://github.com/FRAMverse/framrsquared/issues/151
    ## 16 2026-03-18 https://github.com/FRAMverse/framrsquared/issues/147
    ## 17 2026-03-06 https://github.com/FRAMverse/framrsquared/issues/135
    ## 18 2026-02-24 https://github.com/FRAMverse/framrsquared/issues/129
    ## 19 2026-02-20 https://github.com/FRAMverse/framrsquared/issues/127
    ## 20 2026-02-11 https://github.com/FRAMverse/framrsquared/issues/124
    ## 21 2026-02-11 https://github.com/FRAMverse/framrsquared/issues/123
    ## 22 2026-02-11 https://github.com/FRAMverse/framrsquared/issues/122
    ## 23 2026-01-21 https://github.com/FRAMverse/framrsquared/issues/120
    ## 24 2026-01-08 https://github.com/FRAMverse/framrsquared/issues/117
    ## 25 2025-12-09 https://github.com/FRAMverse/framrsquared/issues/115
    ## 26 2025-12-08 https://github.com/FRAMverse/framrsquared/issues/113
    ## 27 2025-11-26 https://github.com/FRAMverse/framrsquared/issues/112
    ## 28 2025-11-24 https://github.com/FRAMverse/framrsquared/issues/110
    ## 29 2025-11-21 https://github.com/FRAMverse/framrsquared/issues/108
    ## 30 2025-11-03 https://github.com/FRAMverse/framrsquared/issues/106
    ## 31 2025-10-14 https://github.com/FRAMverse/framrsquared/issues/101
    ## 32 2025-10-10 https://github.com/FRAMverse/framrsquared/issues/100
    ## 33 2025-09-08  https://github.com/FRAMverse/framrsquared/issues/99
    ## 34 2025-04-28  https://github.com/FRAMverse/framrsquared/issues/89
    ## 35 2025-04-21  https://github.com/FRAMverse/framrsquared/issues/85
    ## 36 2025-04-13  https://github.com/FRAMverse/framrsquared/issues/81
    ## 37 2025-03-28  https://github.com/FRAMverse/framrsquared/issues/77
    ## 38 2025-03-13  https://github.com/FRAMverse/framrsquared/issues/75
    ## 39 2025-02-11  https://github.com/FRAMverse/framrsquared/issues/71
    ## 40 2025-01-07  https://github.com/FRAMverse/framrsquared/issues/68
    ## 41 2024-12-27  https://github.com/FRAMverse/framrsquared/issues/60
    ## 42 2024-12-13  https://github.com/FRAMverse/framrsquared/issues/52
    ## 43 2024-12-11  https://github.com/FRAMverse/framrsquared/issues/50
    ## 
    ## $pull_requests
    ##                                                                    title
    ## 1                                                        Add/nr/checking
    ## 2                              Added proper string handling to modify_db
    ## 3                                                 Added 'zero_fishery()'
    ## 4 added two functions for comparing preseason and postseason mortalitie…
    ## 5                                    refactored to support transfer runs
    ## 6                                                        Add/sensitivity
    ##                                                                            body
    ## 1     Added the following functions to help identify problems with non-reten...
    ## 2     Addressing #103. modify_table() writes a sql query based on the condit...
    ## 3     Addressing #99. Adds `zero_fishery()` which 0s out the quota, scaler, ...
    ## 4     `create_mort_comparison()` takes a focal year and focal stock and a pr...
    ## 5 Addressing #68. \r\n\r\nChanged `compare_*` functions to use framrosetta t...
    ## 6             Linear scaling of potential inputs for sensitivity analyses. #38 
    ##         date                                               link
    ## 1 2025-11-24 https://github.com/FRAMverse/framrsquared/pull/111
    ## 2 2025-10-29 https://github.com/FRAMverse/framrsquared/pull/104
    ## 3 2025-10-23 https://github.com/FRAMverse/framrsquared/pull/102
    ## 4 2025-01-22  https://github.com/FRAMverse/framrsquared/pull/70
    ## 5 2025-01-07  https://github.com/FRAMverse/framrsquared/pull/69
    ## 6 2024-11-04  https://github.com/FRAMverse/framrsquared/pull/43
    ## 
    ## $github_dependencies
    ## [1] "FRAMverse/framrosetta"

``` r

summarize_repository("tidyverse/dplyr")
```

    ## $repo
    ## [1] "dplyr"
    ## 
    ## $repo_address
    ## [1] "tidyverse/dplyr"
    ## 
    ## $repo_description
    ## [1] "dplyr: A grammar of data manipulation"
    ## 
    ## $repo_long_summary
    ## [1] "A fast, consistent tool for working with data frame like"
    ## 
    ## $branch_activity
    ##                              branch most_recent_update
    ## 1                              main         2026-06-02
    ## 2                      feature/with         2026-05-15
    ## 3                      dev-roxygen2         2026-04-07
    ## 4     copilot/add-ellipsis-to-tally         2026-02-22
    ## 5                      feature/webr         2026-02-10
    ## 6               copilot/sub-pr-7046         2025-11-17
    ## 7              feature/advance-lazy         2025-11-12
    ## 8                feature/filter-out         2025-11-06
    ## 9               feature/case-family         2025-09-09
    ## 10                         f-revdep         2025-04-16
    ## 11                    f-lazy-always         2024-05-09
    ## 12             f-reconstruct-altrep         2023-09-10
    ## 13            f-collect-materialize         2023-08-12
    ## 14                     f-fast-count         2023-05-29
    ## 15                f-marker-comments         2023-01-05
    ## 16        f-avoid-purge-reconstruct         2022-12-11
    ## 17                     f-relational         2022-12-10
    ## 18                          v1.0.10         2022-08-31
    ## 19                      f-poc-focus         2022-08-28
    ## 20           f-6382-summarize-multi         2022-08-19
    ## 21                   f-generic-dots         2022-08-19
    ## 22            simpler-slice-helpers         2022-08-16
    ## 23                       db-defunct         2022-08-03
    ## 24                 lazyeval-defunct         2022-08-01
    ## 25                   rowwise-across         2022-07-30
    ## 26           f-6254-across-original         2022-05-01
    ## 27          f-vec-if-else-case-when         2022-02-03
    ## 28                  arrange_0col_df         2021-12-01
    ## 29   mutate_grouped_attributes_6100         2021-11-30
    ## 30               f-tbl-sum-ellipsis         2021-10-25
    ## 31             f-5903-row-number-na         2021-10-20
    ## 32           6015_early_materialize         2021-09-16
    ## 33                b-rsqlite-example         2021-07-29
    ## 34                   f-check-bionic         2021-07-29
    ## 35         5918_rowwise_df_subclass         2021-06-29
    ## 36               defunct_underscore         2021-04-20
    ## 37                 remove_lazy_eval         2021-04-20
    ## 38 add_count_dplyr_reconstruct_5837         2021-04-09
    ## 39             vctrs_vec_order_locs         2021-03-10
    ## 40                   v1_0_4_pkgdown         2021-02-12
    ## 41                   1.0.4.constant         2021-02-01
    ## 42                           bundle         2020-12-04
    ## 43               shiny_error_bypass         2020-11-20
    ## 44            rows_update_duplicate         2020-11-05
    ## 45            slice_num_as_location         2020-07-15
    ##                                                                        link
    ## 1                              https://github.com/tidyverse/dplyr/tree/main
    ## 2                      https://github.com/tidyverse/dplyr/tree/feature/with
    ## 3                      https://github.com/tidyverse/dplyr/tree/dev-roxygen2
    ## 4     https://github.com/tidyverse/dplyr/tree/copilot/add-ellipsis-to-tally
    ## 5                      https://github.com/tidyverse/dplyr/tree/feature/webr
    ## 6               https://github.com/tidyverse/dplyr/tree/copilot/sub-pr-7046
    ## 7              https://github.com/tidyverse/dplyr/tree/feature/advance-lazy
    ## 8                https://github.com/tidyverse/dplyr/tree/feature/filter-out
    ## 9               https://github.com/tidyverse/dplyr/tree/feature/case-family
    ## 10                         https://github.com/tidyverse/dplyr/tree/f-revdep
    ## 11                    https://github.com/tidyverse/dplyr/tree/f-lazy-always
    ## 12             https://github.com/tidyverse/dplyr/tree/f-reconstruct-altrep
    ## 13            https://github.com/tidyverse/dplyr/tree/f-collect-materialize
    ## 14                     https://github.com/tidyverse/dplyr/tree/f-fast-count
    ## 15                https://github.com/tidyverse/dplyr/tree/f-marker-comments
    ## 16        https://github.com/tidyverse/dplyr/tree/f-avoid-purge-reconstruct
    ## 17                     https://github.com/tidyverse/dplyr/tree/f-relational
    ## 18                          https://github.com/tidyverse/dplyr/tree/v1.0.10
    ## 19                      https://github.com/tidyverse/dplyr/tree/f-poc-focus
    ## 20           https://github.com/tidyverse/dplyr/tree/f-6382-summarize-multi
    ## 21                   https://github.com/tidyverse/dplyr/tree/f-generic-dots
    ## 22            https://github.com/tidyverse/dplyr/tree/simpler-slice-helpers
    ## 23                       https://github.com/tidyverse/dplyr/tree/db-defunct
    ## 24                 https://github.com/tidyverse/dplyr/tree/lazyeval-defunct
    ## 25                   https://github.com/tidyverse/dplyr/tree/rowwise-across
    ## 26           https://github.com/tidyverse/dplyr/tree/f-6254-across-original
    ## 27          https://github.com/tidyverse/dplyr/tree/f-vec-if-else-case-when
    ## 28                  https://github.com/tidyverse/dplyr/tree/arrange_0col_df
    ## 29   https://github.com/tidyverse/dplyr/tree/mutate_grouped_attributes_6100
    ## 30               https://github.com/tidyverse/dplyr/tree/f-tbl-sum-ellipsis
    ## 31             https://github.com/tidyverse/dplyr/tree/f-5903-row-number-na
    ## 32           https://github.com/tidyverse/dplyr/tree/6015_early_materialize
    ## 33                https://github.com/tidyverse/dplyr/tree/b-rsqlite-example
    ## 34                   https://github.com/tidyverse/dplyr/tree/f-check-bionic
    ## 35         https://github.com/tidyverse/dplyr/tree/5918_rowwise_df_subclass
    ## 36               https://github.com/tidyverse/dplyr/tree/defunct_underscore
    ## 37                 https://github.com/tidyverse/dplyr/tree/remove_lazy_eval
    ## 38 https://github.com/tidyverse/dplyr/tree/add_count_dplyr_reconstruct_5837
    ## 39             https://github.com/tidyverse/dplyr/tree/vctrs_vec_order_locs
    ## 40                   https://github.com/tidyverse/dplyr/tree/v1_0_4_pkgdown
    ## 41                   https://github.com/tidyverse/dplyr/tree/1.0.4.constant
    ## 42                           https://github.com/tidyverse/dplyr/tree/bundle
    ## 43               https://github.com/tidyverse/dplyr/tree/shiny_error_bypass
    ## 44            https://github.com/tidyverse/dplyr/tree/rows_update_duplicate
    ## 45            https://github.com/tidyverse/dplyr/tree/slice_num_as_location
    ## 
    ## $issues
    ##                                                                                                                               title
    ## 1                                      `pull()` interprets subtraction between column names as subtraction between column positions
    ## 2  When reusing argument names in `summarise()` to build a complex expression, the length of intermediate expressions is considered
    ## 3                                                                                              Should we have AI specific warnings?
    ## 4                                                                                                       FR: `if_any(.empty="keep")`
    ## 5                                                                     Should `cbind` and `rbind` be mentionned in dplyr <-> base R?
    ## 6                                       `filter()` documentation should refer to `if_any()` or `if_all()` for across-like filtering
    ## 7                                                                                       Add ellipsis to `tally()` and `add_tally()`
    ## 8                                             Argument inconsistency between `case_when()` and `recode_values()`/`replace_values()`
    ## 9                                                                             no error or warning on incorrect usage of `between()`
    ## 10                                                                                 dplyr verbs remove attributes of classed columns
    ## 11                                                                 Stop exporting `data_frame()` and `as_data_frame()` from tibble?
    ## 12                                                         Across gives unclear error when function returns incorrect length output
    ## 13                                                 slice_sample does not restrict sampling to n() within a group when replace=TRUE.
    ## 14                                                                                                     Deprecate `sql_*` and `db_*`
    ## 15                                                                          Using related columns in `cur_column()` with `across()`
    ## 16                                                       count function needs guard rails that name shouldn't be an existing column
    ## 17                                                                                               Add `bounds` to `dplyr::between()`
    ## 18                                                   `between()` doesn't work if `x` is `Date` and `left` and `right` are character
    ## 19                                                                                                   Make `add_tally()` S3 generic?
    ## 20                                                                                                  Internal error in `summarise()`
    ## 21                                                                   `across(.names =)` evaluates `"{col}"` as if it was `"{.col}"`
    ## 22                                                                                     `tbl_vars()` accesses `nrow()` unnecessarily
    ## 23                                                                           reframe with across returns an unhelpful error message
    ## 24                                                                               `Mutating joins` relationship documentation issues
    ## 25                                                                                                                  `count(.by = )`
    ## 26                                                                     Show methods implemented by loaded packages more prominently
    ## 27                                                              filter should warn or prevent users from using named logical inputs
    ## 28                                                                                           dplyr::cur_column don't support dtplyr
    ## 29                                                                                                         Join list of data frames
    ## 30                                                                                           across(), but over two sets of vector 
    ## 31                                                                                                              Split `join_cols()`
    ## 32                                                         `dplyr_reconstruct` can create data.table with corrupted secondary index
    ## 33                                                                Should `desc()` use `vec_rank()` internally on character vectors?
    ## 34                                                                                                      `rowwise()` and empty input
    ## 35                                FR: allow `pick()` to rename in `distinct()` + some thoughts about `arrange()` allowing renaming.
    ## 36                                                                                         In `select` `!` and `-` work differently
    ## 37                                                       Variable scoping issue with .data inside lambda Ffunction used in across()
    ## 38                                                                                  c_across() docs imply a dependency on rowwise()
    ## 39                                                     `summarise()` and `reframe()` turns warnings from inside functions as errors
    ## 40                                                                         Clarity of "duplicated" error message in `rename_with()`
    ## 41                                                        Internal: slightly inaccurate `as_join_by()` implementation for character
    ## 42                                                              Request non-equal join: closest() supports dual-sided inequality <>
    ## 43                                                                                        Add `tidypolars` to the list of backends?
    ## 44                                                                                  perfromance slowdown using across within mutate
    ## 45                                                                                 arrange not reporting syntax errors on .by_group
    ## 46                             A better data masking indirection example in the `programming.Rmd` vignette: `filter(df, {{ var }})`
    ## 47                                                                  Feature Request: In across, have function for `.names` argument
    ## 48                                                                          Feature request: allow additional predicates in join_by
    ## 49                                               Emphasize that filter(x, A, B) is not strictly the same as filter(filter(x, A), B)
    ## 50                                             `lifecycle::last_lifecycle_warnings()` seems incompatible with dplyr warning handler
    ## 51                                                                                   condition handling ignores locally set options
    ## 52                `Error in vapply(.x, .f, .mold, ..., USE.NAMES = FALSE)`: cli_warn together with dplyr grouping results in error.
    ## 53                                                    When `.unpack = TRUE`, `.names` should delay its column name uniqueness check
    ## 54                                                                                                            bug in `dplyr::near`?
    ## 55                                                                                                              FR: `rows_clean()`?
    ## 56                                                           dplyr::across inappropriately rewrites dollar indexes my function code
    ## 57                                                                          Unexpected interaction between rowwise and group_modify
    ## 58                                                                   `mutate` superseding `transmute` should allow ordering columns
    ## 59                                                                             Possible regression re. use of glue in dplyr::across
    ## 60                                                                                         Consider allowing `.env$` in `join_by()`
    ## 61                                    How to adjust to different behavior of across .fn argument passing in dplyr 1.1.1 vs. 1.0.10?
    ## 62                                                                                 `count()` and `add_count()` could be much faster
    ## 63                                                                                                 Reconsider re-exports from rlang
    ## 64                                                                                `filter(across())` warning isn't always triggered
    ## 65                                                                           `slice_max()` is quite slow for a big number of groups
    ## 66                                                                                         Can we improve on this `across()` error?
    ## 67                                                                    `bind_rows()` on a list of data.tables creates corrupt output
    ## 68                                                    Consider `.sort = FALSE` for `summarise()`, `reframe()`, and `slice_sample()`
    ## 69                                         `slice()` and `slice_head/tail/min/max()` should act like a `filter()` not a `reframe()`
    ## 70                                                      `mutate(.by_row =)`, `reframe(.by_row =)`, and possibly `filter(.by_row =)`
    ## 71                                                                       Make `Joining with` message clickable to copy-to-clipboard
    ## 72                                                                                              Alternative `summarise()` groupings
    ## 73                                                                                                           `nest_join()` upgrades
    ## 74                                                                              Should joins have `.before` and `.after` arguments?
    ## 75                                                                                               Add `merge` indicator after a join
    ## 76                                                        `dplyr::group_by_prepare()` does not work with lazy tables and `across()`
    ## 77                                                             Add argument `na_matches = c("na", "never")` to `rows_*()` functions
    ## 78                                                                                        Remove lazy eval fallbacks (>= Sept 2023)
    ## 79                                                                                               Add dplyr_sticky_cols() or similar
    ## 80                                                                                                 Move database generics to dbplyr
    ## 81                                                                                    Better way to handle name collisions in joins
    ##                                                                                   body
    ## 1        Hi, \n\nThis is a minor bug, but it could lead to potential errors.\n\nI w...
    ## 2            I am not sure if this is a bug or not, but it surprised me when I was ...
    ## 3          Consider this warning message about multiple matches in joins\n\nhttps:/...
    ## 4          Hi,\n\nSince https://github.com/tidyverse/dplyr/issues/7059, zero-length...
    ## 5            Is it possible to include the `bind_cols` and `bind_rows` functions in...
    ## 6            Hiya! Was just explaining to someone else how to resolve bugs caused b...
    ## 7            The `wt`, `sort` and `name` arguments should be behind an ellipsis, li...
    ## 8            Hello, I am excited about the new dplyr verbs `recode_values()` and `r...
    ## 9            The main title of the function reads "Detect where values fall in a sp...
    ## 10       ## Problem description\n\nHi, \n\nThis issue is based on https://github.co...
    ## 11           they were deprecated in tibble 2.0, (2019) and create a bit of noise i...
    ## 12           In the example below, the function gives a 2-length result for a 1-len...
    ## 13           I've been playing around with slice_sample on grouped data frames for ...
    ## 14           The next version of dbplyr will no longer need them (https://github.co...
    ## 15        Hello!\nI would like to write code with dplyr + across. for this:\n\nWher...
    ## 16           If you use the count function and set name to be one of the existing c...
    ## 17         The docs of `between()` say:\n\n   `This is a shortcut for x >= left & x...
    ## 18         The docs of `between()` say:\n\n> This is a shortcut for `x >= left & x ...
    ## 19           `count()`, `add_count()`, and `tally()` are generics but `add_tally()`...
    ## 20     ``` r\nlibrary(dplyr)\n\npenguins |>\n  summarize(\n    .by = species,\n    ...
    ## 21           It doesn't seem to be the expected behavior according to the documenta...
    ## 22           This currently affects joins with `library(duckplyr)` . I can work aro...
    ## 23           When I call `reframe` with `across` and the length of the output is no...
    ## 24      `Mutate-joins (dplyr)` documentation says:\n\n```\nrelationship\n\nHandling...
    ## 25           I accidentally used the syntax below, and wonder if this should be the...
    ## 26           Example: if dbplyr is loaded, `?mutate` would contain a link to `?dbpl...
    ## 27           Currently dplyr warns users who accidentally use `=` instead of `==`. ...
    ## 28         Please run these codes, and it will yeild an error message.\n```\na <- d...
    ## 29           I have encounter with the necessity of joining several tibbles, which ...
    ## 30           Sometimes, when doing data wrangling, you need to apply functions not ...
    ## 31           Currently, `join_cols()` is called by `join_filter()` but is doing too...
    ## 32   ## Problem\r\n\r\nThanks @AMDraghici for your suggestions!\r\n\r\nFor example,...
    ## 33       See https://github.com/tidyverse/dplyr/issues/7044\r\n\r\nIn particular, n...
    ## 34           Should we guarantee that the functions used in a rowwise `mutate()` or...
    ## 35           This would be useful in packages to avoid cran warnings as `pick()` is...
    ## 36           I'm not sure if this is intended behaviour but it came up in a recent ...
    ## 37       Hello,\r\n\r\nThis error was driving me crazy and took me a while to isola...
    ## 38           I find the docs for `c_across()` imply the requirement for a `rowwise(...
    ## 39           Please briefly describe your problem and what output you expect. If yo...
    ## 40       Hi,  \r\n\r\nWhen using `rename_with()` and ending with duplicated column ...
    ## 41         ``` r\r\nwaldo::compare(dplyr:::as_join_by("a"), dplyr::join_by(a == a))...
    ## 42           For example, I now have the following Table 1 and Table 2. I want to f...
    ## 43           Hello, I've been working on [`tidypolars`](https://tidypolars.etienneb...
    ## 44           I believe this is an unexplored performance issue, seemingly relating ...
    ## 45       Hello,\r\n\r\nWhen using `arrange` on grouped data (and wanting to respect...
    ## 46       This code does not work:\r\n```r\r\nf <- function(df, var) filter(df, {{ v...
    ## 47           One common thing that I want to do in the `dplyr` workflow is take a s...
    ## 48       `join_by` refuses to handle any predicates it doesn't recognize:\r\n\r\n``...
    ## 49     Have had to re-confirm this for myself a few times:\r\n\r\n```r\r\nfilter(mt...
    ## 50           i.e. it tells you to run the lifecycle function, but there is no warni...
    ## 51     Maybe because of a delayed evaluation issue ?\r\n\r\n``` r\r\nbugged <- func...
    ## 52       Hi,\r\n\r\nit took me a while to get to this (very artificial) reduced exa...
    ## 53       Extracted from https://github.com/tidyverse/dplyr/issues/6933\r\n\r\nSomet...
    ## 54       Is the following example a bug in `near`?\r\n```r\r\n> near(1.1 * 100 * 10...
    ## 55           Do we want to add a function that clears all rows to the `rows_*()` fa...
    ## 56           I was getting a weird error inside the `mutate(across(...))` (see repr...
    ## 57           It appears that after an application of `rowwise` the behavior of `gro...
    ## 58           I recently noticed that `transmute` has been marked as superseded by `...
    ## 59           This is discussed in https://twitter.com/mjskay/status/166077086508714...
    ## 60     Motivated by https://github.com/tidyverse/dplyr/issues/6821\r\n\r\n``` r\r\n...
    ## 61           I have a summarizing function that's similar to the function below. It...
    ## 62           Right now these eventually just do `summarise(n = n())` or `mutate(n =...
    ## 63           Can we start to un-export any of these https://github.com/tidyverse/dp...
    ## 64           Between 1.0.7 and 1.1.0 `filter()` stopped taking matrices, per #5973....
    ## 65           It has gotten better after installing the dev version of dplyr (before...
    ## 66 ``` r\r\nlibrary(dplyr)\r\n\r\ndf <- tibble(x = 1:2, y = 3:4)\r\n\r\nfn <- funct...
    ## 67         \r\nwhen using bind_rows on a list of data.tables with keys, with either...
    ## 68           With the introduction of `.by`, we no longer sort group keys automatic...
    ## 69           Note that this `filter()` call keeps the groups of `x` separated. i.e....
    ## 70       Related to https://github.com/tidyverse/dplyr/issues/4723\r\n\r\nWith the ...
    ## 71       Hi,\r\n\r\ndplyr 1.1.0 seems like it is going to be great (I installed the...
    ## 72       Related to\r\nhttps://github.com/tidyverse/dplyr/issues/14\r\nhttps://gith...
    ## 73           In some recent exploration of `nest_join()`, I've decided that it is l...
    ## 74                                                                 To match `mutate()`
    ## 75           A prior iteration of this request was [closed and locked as old](https...
    ## 76     ``` r\r\nlibrary(dplyr, warn.conflicts = FALSE)\r\nlibrary(rlang)\r\ndf <- m...
    ## 77           Like the `*_join()` functions the `rows_*()` functions should get an a...
    ## 78           They shouldn't be needed anymore, and they make the error messages unn...
    ## 79           So that when you implement a tibble subclass with sticky columns, you ...
    ## 80           Deprecate database generics, following strategy in https://github.com/...
    ## 81           Currently, non-join columns available in both tables are given suffixe...
    ##          date                                           link
    ## 1  2026-07-14 https://github.com/tidyverse/dplyr/issues/7849
    ## 2  2026-06-11 https://github.com/tidyverse/dplyr/issues/7845
    ## 3  2026-05-18 https://github.com/tidyverse/dplyr/issues/7838
    ## 4  2026-04-10 https://github.com/tidyverse/dplyr/issues/7831
    ## 5  2026-03-23 https://github.com/tidyverse/dplyr/issues/7822
    ## 6  2026-03-09 https://github.com/tidyverse/dplyr/issues/7816
    ## 7  2026-02-21 https://github.com/tidyverse/dplyr/issues/7812
    ## 8  2026-02-07 https://github.com/tidyverse/dplyr/issues/7806
    ## 9  2026-01-17 https://github.com/tidyverse/dplyr/issues/7792
    ## 10 2026-01-04 https://github.com/tidyverse/dplyr/issues/7787
    ## 11 2025-12-22 https://github.com/tidyverse/dplyr/issues/7786
    ## 12 2025-12-21 https://github.com/tidyverse/dplyr/issues/7785
    ## 13 2025-12-10 https://github.com/tidyverse/dplyr/issues/7781
    ## 14 2025-12-02 https://github.com/tidyverse/dplyr/issues/7779
    ## 15 2025-11-21 https://github.com/tidyverse/dplyr/issues/7774
    ## 16 2025-11-20 https://github.com/tidyverse/dplyr/issues/7773
    ## 17 2025-09-18 https://github.com/tidyverse/dplyr/issues/7712
    ## 18 2025-07-20 https://github.com/tidyverse/dplyr/issues/7702
    ## 19 2025-06-18 https://github.com/tidyverse/dplyr/issues/7695
    ## 20 2025-06-09 https://github.com/tidyverse/dplyr/issues/7693
    ## 21 2025-06-09 https://github.com/tidyverse/dplyr/issues/7692
    ## 22 2025-03-09 https://github.com/tidyverse/dplyr/issues/7668
    ## 23 2025-02-12 https://github.com/tidyverse/dplyr/issues/7657
    ## 24 2025-01-06 https://github.com/tidyverse/dplyr/issues/7622
    ## 25 2024-12-18 https://github.com/tidyverse/dplyr/issues/7112
    ## 26 2024-11-21 https://github.com/tidyverse/dplyr/issues/7106
    ## 27 2024-11-21 https://github.com/tidyverse/dplyr/issues/7105
    ## 28 2024-11-08 https://github.com/tidyverse/dplyr/issues/7102
    ## 29 2024-09-07 https://github.com/tidyverse/dplyr/issues/7083
    ## 30 2024-07-17 https://github.com/tidyverse/dplyr/issues/7056
    ## 31 2024-07-10 https://github.com/tidyverse/dplyr/issues/7050
    ## 32 2024-07-03 https://github.com/tidyverse/dplyr/issues/7048
    ## 33 2024-06-26 https://github.com/tidyverse/dplyr/issues/7045
    ## 34 2024-06-12 https://github.com/tidyverse/dplyr/issues/7039
    ## 35 2024-05-18 https://github.com/tidyverse/dplyr/issues/7028
    ## 36 2024-04-29 https://github.com/tidyverse/dplyr/issues/7017
    ## 37 2024-04-20 https://github.com/tidyverse/dplyr/issues/7016
    ## 38 2024-04-20 https://github.com/tidyverse/dplyr/issues/7015
    ## 39 2024-04-02 https://github.com/tidyverse/dplyr/issues/7008
    ## 40 2024-03-28 https://github.com/tidyverse/dplyr/issues/7006
    ## 41 2024-03-08 https://github.com/tidyverse/dplyr/issues/7001
    ## 42 2024-02-21 https://github.com/tidyverse/dplyr/issues/6992
    ## 43 2024-02-14 https://github.com/tidyverse/dplyr/issues/6991
    ## 44 2024-01-18 https://github.com/tidyverse/dplyr/issues/6985
    ## 45 2024-01-08 https://github.com/tidyverse/dplyr/issues/6980
    ## 46 2023-12-28 https://github.com/tidyverse/dplyr/issues/6978
    ## 47 2023-11-30 https://github.com/tidyverse/dplyr/issues/6972
    ## 48 2023-11-23 https://github.com/tidyverse/dplyr/issues/6970
    ## 49 2023-11-20 https://github.com/tidyverse/dplyr/issues/6968
    ## 50 2023-11-03 https://github.com/tidyverse/dplyr/issues/6952
    ## 51 2023-10-25 https://github.com/tidyverse/dplyr/issues/6943
    ## 52 2023-10-10 https://github.com/tidyverse/dplyr/issues/6939
    ## 53 2023-10-02 https://github.com/tidyverse/dplyr/issues/6934
    ## 54 2023-08-31 https://github.com/tidyverse/dplyr/issues/6921
    ## 55 2023-08-20 https://github.com/tidyverse/dplyr/issues/6915
    ## 56 2023-07-24 https://github.com/tidyverse/dplyr/issues/6892
    ## 57 2023-06-24 https://github.com/tidyverse/dplyr/issues/6870
    ## 58 2023-05-30 https://github.com/tidyverse/dplyr/issues/6861
    ## 59 2023-05-23 https://github.com/tidyverse/dplyr/issues/6853
    ## 60 2023-04-13 https://github.com/tidyverse/dplyr/issues/6822
    ## 61 2023-03-27 https://github.com/tidyverse/dplyr/issues/6809
    ## 62 2023-03-23 https://github.com/tidyverse/dplyr/issues/6806
    ## 63 2023-03-21 https://github.com/tidyverse/dplyr/issues/6802
    ## 64 2023-03-20 https://github.com/tidyverse/dplyr/issues/6795
    ## 65 2023-03-08 https://github.com/tidyverse/dplyr/issues/6783
    ## 66 2023-02-10 https://github.com/tidyverse/dplyr/issues/6712
    ## 67 2023-02-01 https://github.com/tidyverse/dplyr/issues/6676
    ## 68 2023-01-26 https://github.com/tidyverse/dplyr/issues/6663
    ## 69 2023-01-26 https://github.com/tidyverse/dplyr/issues/6662
    ## 70 2023-01-25 https://github.com/tidyverse/dplyr/issues/6660
    ## 71 2022-11-30 https://github.com/tidyverse/dplyr/issues/6580
    ## 72 2022-11-08 https://github.com/tidyverse/dplyr/issues/6532
    ## 73 2022-10-11 https://github.com/tidyverse/dplyr/issues/6497
    ## 74 2022-09-01 https://github.com/tidyverse/dplyr/issues/6446
    ## 75 2022-08-30 https://github.com/tidyverse/dplyr/issues/6435
    ## 76 2022-02-01 https://github.com/tidyverse/dplyr/issues/6170
    ## 77 2021-09-17 https://github.com/tidyverse/dplyr/issues/6022
    ## 78 2020-10-26 https://github.com/tidyverse/dplyr/issues/5573
    ## 79 2020-06-01 https://github.com/tidyverse/dplyr/issues/5290
    ## 80 2019-12-13 https://github.com/tidyverse/dplyr/issues/4663
    ## 81 2018-12-17 https://github.com/tidyverse/dplyr/issues/4028
    ## 
    ## $pull_requests
    ##                                                       title
    ## 1                                          Update copy-to.R
    ## 2         Fix #7773 and #7785: Improve count() and across()
    ## 3                            Use dev roxygen2 + doc listing
    ## 4 add examples for `if_any()`/`if_all()` to `filter()` docs
    ## 5               Add ellipsis to `tally()` and `add_tally()`
    ## 6                     Prototype of webr on the landing page
    ## 7 chore: update readme to use `.by` instead of `group_by()`
    ##                                                                          body
    ## 1   Fix issue where copy argument in join can be anything and code will ru...
    ## 2                                                                            
    ## 3   * Re-run with dev roxygen2 (lots of diffs due to consist link generati...
    ## 4                                                               Closes #7816 
    ## 5  - [x] Revert to original state to address reviewer feedback\n- [x] Move...
    ## 6 - [ ] Could we add some kind of Plausible integration?\r\n- [ ] Fonts ar...
    ## 7   Please feel free to reject this if you prefer to keep as-is. Just thou...
    ##         date                                         link
    ## 1 2026-06-25 https://github.com/tidyverse/dplyr/pull/7847
    ## 2 2026-05-13 https://github.com/tidyverse/dplyr/pull/7835
    ## 3 2026-04-06 https://github.com/tidyverse/dplyr/pull/7829
    ## 4 2026-03-09 https://github.com/tidyverse/dplyr/pull/7817
    ## 5 2026-02-21 https://github.com/tidyverse/dplyr/pull/7813
    ## 6 2026-02-09 https://github.com/tidyverse/dplyr/pull/7807
    ## 7 2026-02-04 https://github.com/tidyverse/dplyr/pull/7803
    ## 
    ## $github_dependencies
    ## NULL

[`summarize_repository()`](https://cbedwards-dfw.github.io/codeInspectr/reference/summarize_repository.md)
uses
[`get_branch_activity()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_branch_activity.md),
[`get_pull_requests()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_pull_requests.md)
and
[`get_issues()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_issues.md)
to populate several of its tables. Those functions can be used on their
own, and none of them rely on the repository being an R package. Here
are the current issues listed for the “fram_doc” repository, which is
used to generate our documentation website.

``` r

get_issues("FRAMverse/fram_doc")
```

    ##                                title
    ## 1                Update OA3 language
    ## 2 Get Surrogate Fisheries Table 1 up
    ## 3                  Natural Mortality
    ## 4           Skagit TAMM calculations
    ## 5 Funkiness of coastal tribe dropoff
    ## 6             Add FRAM run checklist
    ## 7                          EQUATIONS
    ## 8                       GIT COMMANDS
    ##                                                                                                            body
    ## 1          The glossary definition for Ocean Age 3s implies that it is the cohort size in timestep 1 after n...
    ## 2          @marlenebellman noted a dead table in this section: https://framverse.github.io/fram_doc/base_chi...
    ## 3          Add table with values for coho natural mortality by timestep to documentation (and if possible, i...
    ## 4          For Skagit, the fish from the hatchery are genetically-wild-but-hatchery-reared, and it is an agr...
    ## 5          Steph and I spent a lot of time figuring out dropoff for Grays harbor, and I want this weird case...
    ## 6          Based on documents from Ty, Steph, Derek, others. Get input from the typical FRAM modelers (Yi, O...
    ## 7          Equations are for some reason failing to fully render when a fraction is NOT involved. A workarou...
    ## 8 Git command lines:\r\n@fidelicus or anyone else\r\n\r\ngit pull origin bp_documentation\r\ngit add *.Rmd\r...
    ##         date                                            link
    ## 1 2026-04-11 https://github.com/FRAMverse/fram_doc/issues/22
    ## 2 2026-03-26 https://github.com/FRAMverse/fram_doc/issues/21
    ## 3 2026-02-17 https://github.com/FRAMverse/fram_doc/issues/20
    ## 4 2026-01-06 https://github.com/FRAMverse/fram_doc/issues/19
    ## 5 2025-04-14 https://github.com/FRAMverse/fram_doc/issues/18
    ## 6 2025-04-13 https://github.com/FRAMverse/fram_doc/issues/17
    ## 7 2023-09-28 https://github.com/FRAMverse/fram_doc/issues/13
    ## 8 2023-09-27 https://github.com/FRAMverse/fram_doc/issues/11

## Understanding functions within a package

[codeInspectr](https://github.com/cbedwards-dfw/codeInspectr) has tools
for understanding the relationships between functions in a package. Here
we will explore the codeInspectr package itself with those tools.

First, we can list the functions in a package

``` r

package_functions("codeInspectr")
```

    ##  [1] "backup_github_info"          "build_package_network"      
    ##  [3] "build_recursive_edges"       "find_function_dependencies" 
    ##  [5] "find_recursive_dependencies" "find_reverse_dependencies"  
    ##  [7] "get_branch_activity"         "get_issues"                 
    ##  [9] "get_noncran_dependencies"    "get_pull_requests"          
    ## [11] "get_raw_issues"              "get_raw_pulls"              
    ## [13] "list_repos"                  "package_functions"          
    ## [15] "parse_name"                  "plot_function_dependencies" 
    ## [17] "process_repo"                "summarize_repository"       
    ## [19] "validate_character"          "validate_data_frame"        
    ## [21] "validate_filepath"           "validate_flag"              
    ## [23] "validate_integer"            "validate_numeric"           
    ## [25] "validate_repository"

### Plotting dependency network

We can look at the network of function dependencies for a specific
function with
[`plot_function_dependencies()`](https://cbedwards-dfw.github.io/codeInspectr/reference/plot_function_dependencies.md)
Here we look at the dependency network for
[`summarize_repository()`](https://cbedwards-dfw.github.io/codeInspectr/reference/summarize_repository.md)
above. *This only shows the relationship of functions defined by the
package*, not dependencies on functions from other packages

``` r

plot_function_dependencies("codeInspectr",
                           fun = "summarize_repository")
```

This kind of plot can help understand how different parts of a package
interact. There is also the option to ignore functions that match one or
more regex patterns. This can be helpful for removing validation
functions that would otherwise clog up a network diagram. Let’s take a
look at one of the functions from the `framrsquared` package, which has
much more complicated dependencies:

``` r

plot_function_dependencies("framrsquared",
                           fun = "fetch_table")
```

Many of the functions listed here are validation functions (starting
with “validate\_” that check that the provided arguments are the right
form. Typically we don’t care about these functions if we want to
understand how a function works, so it would be nice to exclude them. We
can do this with the `pattern_ignore` argument:

``` r

plot_function_dependencies("framrsquared",
                           fun = "fetch_table",
                           pattern_ignore = "validate_")
```

This makes it much easier to focus on the meaningful functions.

Sometimes we may want to include the dependency on a key function, but
not clog our diagram up with the all the functions THAT depends on.
Let’s imagine we’re trying to look at how
[`stock_fate()`](https://framverse.github.io/framrsquared/reference/stock_fate.html)
works, and we already feel comfortable with the
[`fetch_table()`](https://framverse.github.io/framrsquared/reference/fetch_table.html)
and
[`fetch_table_()`](https://framverse.github.io/framrsquared/reference/fetch_table.html)
functions. Or perhaps we’re presenting this information, and we feel
like the audience either understands or doesn’t need to worry about how
[`fetch_table()`](https://framverse.github.io/framrsquared/reference/fetch_table.html)
works. Our default diagram, even excluding the validate functions, is
unnecessarily complicated:

``` r

plot_function_dependencies("framrsquared",
                           fun = "stock_fate",
                           pattern_ignore = "validate_")
```

We can use the `pattern_dont_recurse` to identify function(s) that we
want to show up on the plot, but for which we don’t want to track
*their* dependencies:

``` r

plot_function_dependencies("framrsquared",
                           fun = "stock_fate",
                           pattern_ignore = "validate_",
                           pattern_dont_recurse = "fetch_table")
```

### Dependency lists

We may not want to deal with a plot, and instead just list dependencies.
This can be helpful when updating code.

[`find_function_dependencies()`](https://cbedwards-dfw.github.io/codeInspectr/reference/find_function_dependencies.md)
finds all the functions that the listed function depends on.

Here are the functions in `codeInspectr` that
[`summarize_repository()`](https://cbedwards-dfw.github.io/codeInspectr/reference/summarize_repository.md)
function uses:

``` r

find_function_dependencies("codeInspectr", fun = "summarize_repository")
```

    ## [1] "get_branch_activity" "get_issues"          "get_pull_requests"  
    ## [4] "validate_repository"

Optionally, we can list dependencies on all functions, including those
outside of the focal package. `include = "no operators"` will (usually)
exclude R operators from the list of functions used:

``` r

find_function_dependencies("codeInspectr", fun = "summarize_repository", include = "no operators")
```

    ##  [1] "basename"            "get_branch_activity" "get_issues"         
    ##  [4] "get_pull_requests"   "grep"                "gsub"               
    ##  [7] "list"                "readLines"           "return"             
    ## [10] "validate_repository"

while `include = "all"` will also list operators:

``` r

find_function_dependencies("codeInspectr", fun = "summarize_repository", include = "all")
```

    ##  [1] "::"                  "{"                   "<-"                 
    ##  [4] "="                   "$"                   "basename"           
    ##  [7] "get_branch_activity" "get_issues"          "get_pull_requests"  
    ## [10] "grep"                "gsub"                "list"               
    ## [13] "readLines"           "return"              "validate_repository"

We can also work the other direction: what functions in the package
depend on a focal function? For this we use
[`find_reverse_dependencies()`](https://cbedwards-dfw.github.io/codeInspectr/reference/find_reverse_dependencies.md)

``` r

find_reverse_dependencies("codeInspectr", "summarize_repository")
```

    ## character(0)

No functions depend on
[`summarize_repository()`](https://cbedwards-dfw.github.io/codeInspectr/reference/summarize_repository.md).

``` r

find_reverse_dependencies("codeInspectr", "get_issues")
```

    ## [1] "summarize_repository"

Only
[`summarize_repository()`](https://cbedwards-dfw.github.io/codeInspectr/reference/summarize_repository.md)
depends on
[`get_issues()`](https://cbedwards-dfw.github.io/codeInspectr/reference/get_issues.md).

This function can be helpful if we’re considering changing the behavior
of a function in a package, and want to see what else that might affect.
For example, what if we wanted to tweak the output format of
[`fetch_table_()`](https://framverse.github.io/framrsquared/reference/fetch_table.html)
in the [framrsquared](https://framverse.github.io/framrsquared/)
package?

``` r

find_reverse_dependencies("framrsquared", "fetch_table_")
```

    ##  [1] "addstock_check"                     "aeq_mortality"                     
    ##  [3] "bkfram_checks_coho"                 "calc_fram_scaling"                 
    ##  [5] "coho_mark_rates"                    "cohort_abundance"                  
    ##  [7] "compare_databases"                  "compare_fishery_input_flags"       
    ##  [9] "compare_fishery_inputs"             "compare_inputs"                    
    ## [11] "compare_non_retention_input_flags"  "compare_non_retention_inputs"      
    ## [13] "compare_recruits"                   "compare_runs"                      
    ## [15] "compare_stock_fishery_rate_scalers" "copy_fishery_scalers"              
    ## [17] "copy_run"                           "fetch_table_bkchin"                
    ## [19] "fishery_mortality"                  "get_fishery_ids"                   
    ## [21] "get_run_ids"                        "get_stock_ids"                     
    ## [23] "label_fisheries_db"                 "label_stocks_db"                   
    ## [25] "mortality_scalers_chinook_"         "mortality_scalers_coho_"           
    ## [27] "msf_encounters_coho_"               "msf_landed_catch_coho_"            
    ## [29] "msf_mortalities_coho_"              "msp_mortality"                     
    ## [31] "plot_impacts_per_catch_heatmap"     "plot_stock_comp"                   
    ## [33] "plot_stock_mortality"               "plot_stock_mortality_time_step"    
    ## [35] "population_statistics"              "post_season_abundance"             
    ## [37] "run_info"                           "stock_fate_chinook"                
    ## [39] "stock_fate_coho"                    "stock_mortality"                   
    ## [41] "terminal_info"                      "truns_fisheries"                   
    ## [43] "truns_stocks"

We would need to check that all of those functions still worked.

## Downloading Pull Requests and Issues

If you lose access to a github repository, you lose access to the Issues
and Pull Requests as well. You may be able to recreate the repository
from your local version, but not the Issues and Pull requests.

[`backup_github_info()`](https://cbedwards-dfw.github.io/codeInspectr/reference/backup_github_info.md)
can be used to save Issues and PRs locally for all repositories of a
given user or organization. Using this function regularly to maintain a
backup of these key tools.
