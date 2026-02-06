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
    ## 1                            main         2026-02-03
    ## 2                             dev         2026-01-28
    ## 3                 add/nr/checking         2025-11-24
    ## 4            improve/modify/table         2025-10-31
    ## 5                    nuke/fishery         2025-10-23
    ## 6                   add/copy_runs         2025-10-13
    ## 7                 add/sensitivity         2025-10-07
    ## 8                     add/taaetrs         2025-09-05
    ## 9            add/stock_comp_graph         2025-05-14
    ## 10              add/fate_function         2025-04-23
    ## 11                   fix/run_info         2025-04-23
    ## 12       add/mortality/comparison         2025-04-21
    ## 13              refactor/compares         2025-04-21
    ## 14 update/filter/species/handling         2025-04-21
    ## 15               fix/compare/runs         2025-04-04
    ## 16          add/stock/proportions         2025-03-19
    ## 17           refactor/post_season         2025-01-02
    ## 18           update/documentation         2024-11-01
    ## 19                    minortweaks         2024-10-10
    ##                                                                             link
    ## 1                            https://github.com/FRAMverse/framrsquared/tree/main
    ## 2                             https://github.com/FRAMverse/framrsquared/tree/dev
    ## 3                 https://github.com/FRAMverse/framrsquared/tree/add/nr/checking
    ## 4            https://github.com/FRAMverse/framrsquared/tree/improve/modify/table
    ## 5                    https://github.com/FRAMverse/framrsquared/tree/nuke/fishery
    ## 6                   https://github.com/FRAMverse/framrsquared/tree/add/copy_runs
    ## 7                 https://github.com/FRAMverse/framrsquared/tree/add/sensitivity
    ## 8                     https://github.com/FRAMverse/framrsquared/tree/add/taaetrs
    ## 9            https://github.com/FRAMverse/framrsquared/tree/add/stock_comp_graph
    ## 10              https://github.com/FRAMverse/framrsquared/tree/add/fate_function
    ## 11                   https://github.com/FRAMverse/framrsquared/tree/fix/run_info
    ## 12       https://github.com/FRAMverse/framrsquared/tree/add/mortality/comparison
    ## 13              https://github.com/FRAMverse/framrsquared/tree/refactor/compares
    ## 14 https://github.com/FRAMverse/framrsquared/tree/update/filter/species/handling
    ## 15               https://github.com/FRAMverse/framrsquared/tree/fix/compare/runs
    ## 16          https://github.com/FRAMverse/framrsquared/tree/add/stock/proportions
    ## 17           https://github.com/FRAMverse/framrsquared/tree/refactor/post_season
    ## 18           https://github.com/FRAMverse/framrsquared/tree/update/documentation
    ## 19                    https://github.com/FRAMverse/framrsquared/tree/minortweaks
    ## 
    ## $issues
    ##                                                                                            title
    ## 1                                                                      Write complete test suite
    ## 2                                                           plot_stock_mortality_time_step() bug
    ## 3                                              Add "Merge Coho Ocean Options" script as function
    ## 4                   plot_impacts_per_catch_heatmap does not grid well when timesteps are missing
    ## 5                                           add ability to specify mappings for compare_database
    ## 6                                                     Update `plot_stock_comp` to handle Chinook
    ## 7                                              Function which replicates merge ocean option code
    ## 8                                                    filter_wa() isn't working right for Chinook
    ## 9  `filter_flag()` is a safety function, but getting pulled into filter section of pkgdown site.
    ## 10                                                     Add safety net to fishery scalers writing
    ## 11                                               Add safety net to fishery scalers table reading
    ## 12                                                 modify_table() needs help changing characters
    ## 13                                               Update copy_fishery_scalers for more robustness
    ## 14                                                Lock down stock tables to use only one species
    ## 15                                                Add function to zero out one or more fisheries
    ## 16                                                             Commercial net filter misbehaving
    ## 17                                                  Do we want "populate VS SFRS" functionality?
    ## 18            Function to summarize non-retention impacts in sport fisheries for specified stock
    ## 19                                                            filter_union() and filter_invert()
    ## 20                                                                      compare_fishery_inputs()
    ## 21             update compare_runs to clarify fisheries whose inputs are not directly determined
    ## 22                                                                   Add ER calculation function
    ## 23                                          compare_* functions won't work on transfer databases
    ## 24                                                                               Stock filtering
    ## 25                                                             Add `describe_data` functionality
    ## 26                                                  Replicate Derek's mortality aggregation tool
    ##                                                                             body
    ## 1      Use `testthat::skip_if_not()` to skip tests when the test databases ar...
    ## 2       Yi was experiencing issues with a preseason chinook database when run...
    ## 3      Request from @sthurner11. The following is a script used by coho model...
    ## 4      Try custom filtering to commercial WA net -- end up with a 2x2 grid, b...
    ## 5      currently compare_database() assumes run_ids match between the two dat...
    ## 6         Right now the assignment of stock groups is using a LUT for coho only.
    ## 7      During preseason we copy the ocean options into our NOF runs using 'me...
    ## 8      Includes fisheries like central OR Troll and Sport, So Calif Troll and...
    ## 9                                                                               
    ## 10     For chinook, warn if making any changes to the fisheries that are over...
    ## 11     The fishery scalers table can be misleading to look at -- we might hav...
    ## 12     Currently `modify_table()` cannot replace character strings (and likel...
    ## 13     Currently copy_fishery_scalers uses an "Update" call. This can give sc...
    ## 14                                                              As appropriate. 
    ## 15     - Would be very useful to be able to zero out individual fishery (or f...
    ## 16               The fishery_ids used in `filter_commercial_wa_nt()` are wrong. 
    ## 17     Working with @sthurner11 on making the VS Input Template from the fina...
    ## 18     Tool to help us identify other-target fisheries that are impacting a s...
    ## 19     Currently we can layer filters to look at the intersection of filters ...
    ## 20     Failing to pick up changes in inputs where the flag has changed  e.g. ...
    ## 21     Many of the treaty fisheries have harvests that are based on terminal ...
    ## 22                                       Add function to calculate ERs directly.
    ## 23     I was trying to use the compare functions on a transfer file with two ...
    ## 24 @cbedwards-dfw \r\n\r\nIt'd be a good idea to have stock filtering as well...
    ## 25     From conversation with @Ty-WDFW on 12/13/24. Add `describe_data()` fun...
    ## 26     Derek has an excel-based tool that uses some complex logic and pivot t...
    ##          date                                                 link
    ## 1  2026-01-21 https://github.com/FRAMverse/framrsquared/issues/120
    ## 2  2026-01-15 https://github.com/FRAMverse/framrsquared/issues/119
    ## 3  2026-01-08 https://github.com/FRAMverse/framrsquared/issues/117
    ## 4  2025-12-09 https://github.com/FRAMverse/framrsquared/issues/115
    ## 5  2025-12-08 https://github.com/FRAMverse/framrsquared/issues/113
    ## 6  2025-11-26 https://github.com/FRAMverse/framrsquared/issues/112
    ## 7  2025-11-24 https://github.com/FRAMverse/framrsquared/issues/110
    ## 8  2025-11-21 https://github.com/FRAMverse/framrsquared/issues/108
    ## 9  2025-11-20 https://github.com/FRAMverse/framrsquared/issues/107
    ## 10 2025-11-03 https://github.com/FRAMverse/framrsquared/issues/106
    ## 11 2025-10-30 https://github.com/FRAMverse/framrsquared/issues/105
    ## 12 2025-10-28 https://github.com/FRAMverse/framrsquared/issues/103
    ## 13 2025-10-14 https://github.com/FRAMverse/framrsquared/issues/101
    ## 14 2025-10-10 https://github.com/FRAMverse/framrsquared/issues/100
    ## 15 2025-09-08  https://github.com/FRAMverse/framrsquared/issues/99
    ## 16 2025-04-28  https://github.com/FRAMverse/framrsquared/issues/89
    ## 17 2025-04-21  https://github.com/FRAMverse/framrsquared/issues/85
    ## 18 2025-04-14  https://github.com/FRAMverse/framrsquared/issues/83
    ## 19 2025-04-13  https://github.com/FRAMverse/framrsquared/issues/81
    ## 20 2025-03-28  https://github.com/FRAMverse/framrsquared/issues/77
    ## 21 2025-03-13  https://github.com/FRAMverse/framrsquared/issues/75
    ## 22 2025-02-11  https://github.com/FRAMverse/framrsquared/issues/71
    ## 23 2025-01-07  https://github.com/FRAMverse/framrsquared/issues/68
    ## 24 2024-12-27  https://github.com/FRAMverse/framrsquared/issues/60
    ## 25 2024-12-13  https://github.com/FRAMverse/framrsquared/issues/52
    ## 26 2024-12-11  https://github.com/FRAMverse/framrsquared/issues/50
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
    ## 1                              main         2026-02-04
    ## 2               copilot/sub-pr-7046         2025-11-17
    ## 3              feature/advance-lazy         2025-11-12
    ## 4                feature/filter-out         2025-11-06
    ## 5               feature/case-family         2025-09-09
    ## 6                          f-revdep         2025-04-16
    ## 7                     f-lazy-always         2024-05-09
    ## 8              f-reconstruct-altrep         2023-09-10
    ## 9             f-collect-materialize         2023-08-12
    ## 10                     f-fast-count         2023-05-29
    ## 11                f-marker-comments         2023-01-05
    ## 12        f-avoid-purge-reconstruct         2022-12-11
    ## 13                     f-relational         2022-12-10
    ## 14                          v1.0.10         2022-08-31
    ## 15                      f-poc-focus         2022-08-28
    ## 16           f-6382-summarize-multi         2022-08-19
    ## 17                   f-generic-dots         2022-08-19
    ## 18            simpler-slice-helpers         2022-08-16
    ## 19                       db-defunct         2022-08-03
    ## 20                 lazyeval-defunct         2022-08-01
    ## 21                   rowwise-across         2022-07-30
    ## 22           f-6254-across-original         2022-05-01
    ## 23          f-vec-if-else-case-when         2022-02-03
    ## 24                  arrange_0col_df         2021-12-01
    ## 25   mutate_grouped_attributes_6100         2021-11-30
    ## 26               f-tbl-sum-ellipsis         2021-10-25
    ## 27             f-5903-row-number-na         2021-10-20
    ## 28           6015_early_materialize         2021-09-16
    ## 29                b-rsqlite-example         2021-07-29
    ## 30                   f-check-bionic         2021-07-29
    ## 31         5918_rowwise_df_subclass         2021-06-29
    ## 32               defunct_underscore         2021-04-20
    ## 33                 remove_lazy_eval         2021-04-20
    ## 34 add_count_dplyr_reconstruct_5837         2021-04-09
    ## 35             vctrs_vec_order_locs         2021-03-10
    ## 36                   v1_0_4_pkgdown         2021-02-12
    ## 37                   1.0.4.constant         2021-02-01
    ## 38                           bundle         2020-12-04
    ## 39               shiny_error_bypass         2020-11-20
    ## 40            rows_update_duplicate         2020-11-05
    ## 41            slice_num_as_location         2020-07-15
    ##                                                                        link
    ## 1                              https://github.com/tidyverse/dplyr/tree/main
    ## 2               https://github.com/tidyverse/dplyr/tree/copilot/sub-pr-7046
    ## 3              https://github.com/tidyverse/dplyr/tree/feature/advance-lazy
    ## 4                https://github.com/tidyverse/dplyr/tree/feature/filter-out
    ## 5               https://github.com/tidyverse/dplyr/tree/feature/case-family
    ## 6                          https://github.com/tidyverse/dplyr/tree/f-revdep
    ## 7                     https://github.com/tidyverse/dplyr/tree/f-lazy-always
    ## 8              https://github.com/tidyverse/dplyr/tree/f-reconstruct-altrep
    ## 9             https://github.com/tidyverse/dplyr/tree/f-collect-materialize
    ## 10                     https://github.com/tidyverse/dplyr/tree/f-fast-count
    ## 11                https://github.com/tidyverse/dplyr/tree/f-marker-comments
    ## 12        https://github.com/tidyverse/dplyr/tree/f-avoid-purge-reconstruct
    ## 13                     https://github.com/tidyverse/dplyr/tree/f-relational
    ## 14                          https://github.com/tidyverse/dplyr/tree/v1.0.10
    ## 15                      https://github.com/tidyverse/dplyr/tree/f-poc-focus
    ## 16           https://github.com/tidyverse/dplyr/tree/f-6382-summarize-multi
    ## 17                   https://github.com/tidyverse/dplyr/tree/f-generic-dots
    ## 18            https://github.com/tidyverse/dplyr/tree/simpler-slice-helpers
    ## 19                       https://github.com/tidyverse/dplyr/tree/db-defunct
    ## 20                 https://github.com/tidyverse/dplyr/tree/lazyeval-defunct
    ## 21                   https://github.com/tidyverse/dplyr/tree/rowwise-across
    ## 22           https://github.com/tidyverse/dplyr/tree/f-6254-across-original
    ## 23          https://github.com/tidyverse/dplyr/tree/f-vec-if-else-case-when
    ## 24                  https://github.com/tidyverse/dplyr/tree/arrange_0col_df
    ## 25   https://github.com/tidyverse/dplyr/tree/mutate_grouped_attributes_6100
    ## 26               https://github.com/tidyverse/dplyr/tree/f-tbl-sum-ellipsis
    ## 27             https://github.com/tidyverse/dplyr/tree/f-5903-row-number-na
    ## 28           https://github.com/tidyverse/dplyr/tree/6015_early_materialize
    ## 29                https://github.com/tidyverse/dplyr/tree/b-rsqlite-example
    ## 30                   https://github.com/tidyverse/dplyr/tree/f-check-bionic
    ## 31         https://github.com/tidyverse/dplyr/tree/5918_rowwise_df_subclass
    ## 32               https://github.com/tidyverse/dplyr/tree/defunct_underscore
    ## 33                 https://github.com/tidyverse/dplyr/tree/remove_lazy_eval
    ## 34 https://github.com/tidyverse/dplyr/tree/add_count_dplyr_reconstruct_5837
    ## 35             https://github.com/tidyverse/dplyr/tree/vctrs_vec_order_locs
    ## 36                   https://github.com/tidyverse/dplyr/tree/v1_0_4_pkgdown
    ## 37                   https://github.com/tidyverse/dplyr/tree/1.0.4.constant
    ## 38                           https://github.com/tidyverse/dplyr/tree/bundle
    ## 39               https://github.com/tidyverse/dplyr/tree/shiny_error_bypass
    ## 40            https://github.com/tidyverse/dplyr/tree/rows_update_duplicate
    ## 41            https://github.com/tidyverse/dplyr/tree/slice_num_as_location
    ## 
    ## $issues
    ##                                                                                                                title
    ## 1                                                              no error or warning on incorrect usage of `between()`
    ## 2                                                                   dplyr verbs remove attributes of classed columns
    ## 3                                                   Stop exporting `data_frame()` and `as_data_frame()` from tibble?
    ## 4                                           Across gives unclear error when function returns incorrect length output
    ## 5                                   slice_sample does not restrict sampling to n() within a group when replace=TRUE.
    ## 6                                                                                       Deprecate `sql_*` and `db_*`
    ## 7                                                            Using related columns in `cur_column()` with `across()`
    ## 8                                         count function needs guard rails that name shouldn't be an existing column
    ## 9                                                                                 Add `bounds` to `dplyr::between()`
    ## 10                                    `between()` doesn't work if `x` is `Date` and `left` and `right` are character
    ## 11                                                                                    Make `add_tally()` S3 generic?
    ## 12                                                                                   Internal error in `summarise()`
    ## 13                                                    `across(.names =)` evaluates `"{col}"` as if it was `"{.col}"`
    ## 14                                                                      `tbl_vars()` accesses `nrow()` unnecessarily
    ## 15                                                       mutate() doesn't seem to signal warning conditions properly
    ## 16                                                            reframe with across returns an unhelpful error message
    ## 17                                                                `Mutating joins` relationship documentation issues
    ## 18                                                                                                   `count(.by = )`
    ## 19                                                      Show methods implemented by loaded packages more prominently
    ## 20                                               filter should warn or prevent users from using named logical inputs
    ## 21                                                                            dplyr::cur_column don't support dtplyr
    ## 22                                                                                          Join list of data frames
    ## 23                                                                            across(), but over two sets of vector 
    ## 24                                                                                               Split `join_cols()`
    ## 25                                          `dplyr_reconstruct` can create data.table with corrupted secondary index
    ## 26                                                 Should `desc()` use `vec_rank()` internally on character vectors?
    ## 27                                                                                       `rowwise()` and empty input
    ## 28                 FR: allow `pick()` to rename in `distinct()` + some thoughts about `arrange()` allowing renaming.
    ## 29                                                  Weird behavior with bind_rows(), mutate(), and ggeffects package
    ## 30                                                                          In `select` `!` and `-` work differently
    ## 31                                        Variable scoping issue with .data inside lambda Ffunction used in across()
    ## 32                                                                   c_across() docs imply a dependency on rowwise()
    ## 33                                      `summarise()` and `reframe()` turns warnings from inside functions as errors
    ## 34                                                          Clarity of "duplicated" error message in `rename_with()`
    ## 35                                         Internal: slightly inaccurate `as_join_by()` implementation for character
    ## 36                                               Request non-equal join: closest() supports dual-sided inequality <>
    ## 37                                                                         Add `tidypolars` to the list of backends?
    ## 38                                                                   perfromance slowdown using across within mutate
    ## 39                                                                  arrange not reporting syntax errors on .by_group
    ## 40              A better data masking indirection example in the `programming.Rmd` vignette: `filter(df, {{ var }})`
    ## 41                                                   Feature Request: In across, have function for `.names` argument
    ## 42                                                           Feature request: allow additional predicates in join_by
    ## 43                                Emphasize that filter(x, A, B) is not strictly the same as filter(filter(x, A), B)
    ## 44                              `lifecycle::last_lifecycle_warnings()` seems incompatible with dplyr warning handler
    ## 45                                                                    condition handling ignores locally set options
    ## 46 `Error in vapply(.x, .f, .mold, ..., USE.NAMES = FALSE)`: cli_warn together with dplyr grouping results in error.
    ## 47                                     When `.unpack = TRUE`, `.names` should delay its column name uniqueness check
    ## 48                                                                                             bug in `dplyr::near`?
    ## 49                                                                                               FR: `rows_clean()`?
    ## 50                                            dplyr::across inappropriately rewrites dollar indexes my function code
    ## 51                                                           Unexpected interaction between rowwise and group_modify
    ## 52                                                    `mutate` superseding `transmute` should allow ordering columns
    ## 53                                                              Possible regression re. use of glue in dplyr::across
    ## 54                                                                          Consider allowing `.env$` in `join_by()`
    ## 55                     How to adjust to different behavior of across .fn argument passing in dplyr 1.1.1 vs. 1.0.10?
    ## 56                                                                  `count()` and `add_count()` could be much faster
    ## 57                                                                                  Reconsider re-exports from rlang
    ## 58                                                                 `filter(across())` warning isn't always triggered
    ## 59                                                            `slice_max()` is quite slow for a big number of groups
    ## 60                                                                          Can we improve on this `across()` error?
    ## 61                                                     `bind_rows()` on a list of data.tables creates corrupt output
    ## 62                                     Consider `.sort = FALSE` for `summarise()`, `reframe()`, and `slice_sample()`
    ## 63                          `slice()` and `slice_head/tail/min/max()` should act like a `filter()` not a `reframe()`
    ## 64                                       `mutate(.by_row =)`, `reframe(.by_row =)`, and possibly `filter(.by_row =)`
    ## 65                                                        Make `Joining with` message clickable to copy-to-clipboard
    ## 66                                                                               Alternative `summarise()` groupings
    ## 67                                                                                            `nest_join()` upgrades
    ## 68                                                               Should joins have `.before` and `.after` arguments?
    ## 69                                                                                Add `merge` indicator after a join
    ## 70                                         `dplyr::group_by_prepare()` does not work with lazy tables and `across()`
    ## 71                                              Add argument `na_matches = c("na", "never")` to `rows_*()` functions
    ## 72                                                                         Remove lazy eval fallbacks (>= Sept 2023)
    ## 73                                                                                Add dplyr_sticky_cols() or similar
    ## 74                                                                                  Move database generics to dbplyr
    ## 75                                                                     Better way to handle name collisions in joins
    ##                                                                                   body
    ## 1            The main title of the function reads "Detect where values fall in a sp...
    ## 2          Hi, \n\nThis issue is based on https://github.com/tidyverse/dplyr/issues...
    ## 3            they were deprecated in tibble 2.0, (2019) and create a bit of noise i...
    ## 4            In the example below, the function gives a 2-length result for a 1-len...
    ## 5            I've been playing around with slice_sample on grouped data frames for ...
    ## 6            The next version of dbplyr will no longer need them (https://github.co...
    ## 7         Hello!\nI would like to write code with dplyr + across. for this:\n\nWher...
    ## 8            If you use the count function and set name to be one of the existing c...
    ## 9          The docs of `between()` say:\n\n   `This is a shortcut for x >= left & x...
    ## 10         The docs of `between()` say:\n\n> This is a shortcut for `x >= left & x ...
    ## 11           `count()`, `add_count()`, and `tally()` are generics but `add_tally()`...
    ## 12     ``` r\nlibrary(dplyr)\n\npenguins |>\n  summarize(\n    .by = species,\n    ...
    ## 13           It doesn't seem to be the expected behavior according to the documenta...
    ## 14           This currently affects joins with `library(duckplyr)` . I can work aro...
    ## 15           `mutate()` doesn't seem to signal named warning conditions for calling...
    ## 16           When I call `reframe` with `across` and the length of the output is no...
    ## 17      `Mutate-joins (dplyr)` documentation says:\n\n```\nrelationship\n\nHandling...
    ## 18           I accidentally used the syntax below, and wonder if this should be the...
    ## 19           Example: if dbplyr is loaded, `?mutate` would contain a link to `?dbpl...
    ## 20           Currently dplyr warns users who accidentally use `=` instead of `==`. ...
    ## 21         Please run these codes, and it will yeild an error message.\n```\na <- d...
    ## 22           I have encounter with the necessity of joining several tibbles, which ...
    ## 23           Sometimes, when doing data wrangling, you need to apply functions not ...
    ## 24           Currently, `join_cols()` is called by `join_filter()` but is doing too...
    ## 25   ## Problem\r\n\r\nThanks @AMDraghici for your suggestions!\r\n\r\nFor example,...
    ## 26       See https://github.com/tidyverse/dplyr/issues/7044\r\n\r\nIn particular, n...
    ## 27           Should we guarantee that the functions used in a rowwise `mutate()` or...
    ## 28           This would be useful in packages to avoid cran warnings as `pick()` is...
    ## 29           This is kind of a weird niche problem. The mutate function is interact...
    ## 30           I'm not sure if this is intended behaviour but it came up in a recent ...
    ## 31       Hello,\r\n\r\nThis error was driving me crazy and took me a while to isola...
    ## 32           I find the docs for `c_across()` imply the requirement for a `rowwise(...
    ## 33           Please briefly describe your problem and what output you expect. If yo...
    ## 34       Hi,  \r\n\r\nWhen using `rename_with()` and ending with duplicated column ...
    ## 35         ``` r\r\nwaldo::compare(dplyr:::as_join_by("a"), dplyr::join_by(a == a))...
    ## 36           For example, I now have the following Table 1 and Table 2. I want to f...
    ## 37           Hello, I've been working on [`tidypolars`](https://tidypolars.etienneb...
    ## 38           I believe this is an unexplored performance issue, seemingly relating ...
    ## 39       Hello,\r\n\r\nWhen using `arrange` on grouped data (and wanting to respect...
    ## 40       This code does not work:\r\n```r\r\nf <- function(df, var) filter(df, {{ v...
    ## 41           One common thing that I want to do in the `dplyr` workflow is take a s...
    ## 42       `join_by` refuses to handle any predicates it doesn't recognize:\r\n\r\n``...
    ## 43     Have had to re-confirm this for myself a few times:\r\n\r\n```r\r\nfilter(mt...
    ## 44           i.e. it tells you to run the lifecycle function, but there is no warni...
    ## 45     Maybe because of a delayed evaluation issue ?\r\n\r\n``` r\r\nbugged <- func...
    ## 46       Hi,\r\n\r\nit took me a while to get to this (very artificial) reduced exa...
    ## 47       Extracted from https://github.com/tidyverse/dplyr/issues/6933\r\n\r\nSomet...
    ## 48       Is the following example a bug in `near`?\r\n```r\r\n> near(1.1 * 100 * 10...
    ## 49           Do we want to add a function that clears all rows to the `rows_*()` fa...
    ## 50           I was getting a weird error inside the `mutate(across(...))` (see repr...
    ## 51           It appears that after an application of `rowwise` the behavior of `gro...
    ## 52           I recently noticed that `transmute` has been marked as superseded by `...
    ## 53           This is discussed in https://twitter.com/mjskay/status/166077086508714...
    ## 54     Motivated by https://github.com/tidyverse/dplyr/issues/6821\r\n\r\n``` r\r\n...
    ## 55           I have a summarizing function that's similar to the function below. It...
    ## 56           Right now these eventually just do `summarise(n = n())` or `mutate(n =...
    ## 57           Can we start to un-export any of these https://github.com/tidyverse/dp...
    ## 58           Between 1.0.7 and 1.1.0 `filter()` stopped taking matrices, per #5973....
    ## 59           It has gotten better after installing the dev version of dplyr (before...
    ## 60 ``` r\r\nlibrary(dplyr)\r\n\r\ndf <- tibble(x = 1:2, y = 3:4)\r\n\r\nfn <- funct...
    ## 61         \r\nwhen using bind_rows on a list of data.tables with keys, with either...
    ## 62           With the introduction of `.by`, we no longer sort group keys automatic...
    ## 63           Note that this `filter()` call keeps the groups of `x` separated. i.e....
    ## 64       Related to https://github.com/tidyverse/dplyr/issues/4723\r\n\r\nWith the ...
    ## 65       Hi,\r\n\r\ndplyr 1.1.0 seems like it is going to be great (I installed the...
    ## 66       Related to\r\nhttps://github.com/tidyverse/dplyr/issues/14\r\nhttps://gith...
    ## 67           In some recent exploration of `nest_join()`, I've decided that it is l...
    ## 68                                                                 To match `mutate()`
    ## 69           A prior iteration of this request was [closed and locked as old](https...
    ## 70     ``` r\r\nlibrary(dplyr, warn.conflicts = FALSE)\r\nlibrary(rlang)\r\ndf <- m...
    ## 71           Like the `*_join()` functions the `rows_*()` functions should get an a...
    ## 72           They shouldn't be needed anymore, and they make the error messages unn...
    ## 73           So that when you implement a tibble subclass with sticky columns, you ...
    ## 74           Deprecate database generics, following strategy in https://github.com/...
    ## 75           Currently, non-join columns available in both tables are given suffixe...
    ##          date                                           link
    ## 1  2026-01-17 https://github.com/tidyverse/dplyr/issues/7792
    ## 2  2026-01-04 https://github.com/tidyverse/dplyr/issues/7787
    ## 3  2025-12-22 https://github.com/tidyverse/dplyr/issues/7786
    ## 4  2025-12-21 https://github.com/tidyverse/dplyr/issues/7785
    ## 5  2025-12-10 https://github.com/tidyverse/dplyr/issues/7781
    ## 6  2025-12-02 https://github.com/tidyverse/dplyr/issues/7779
    ## 7  2025-11-21 https://github.com/tidyverse/dplyr/issues/7774
    ## 8  2025-11-20 https://github.com/tidyverse/dplyr/issues/7773
    ## 9  2025-09-18 https://github.com/tidyverse/dplyr/issues/7712
    ## 10 2025-07-20 https://github.com/tidyverse/dplyr/issues/7702
    ## 11 2025-06-18 https://github.com/tidyverse/dplyr/issues/7695
    ## 12 2025-06-09 https://github.com/tidyverse/dplyr/issues/7693
    ## 13 2025-06-09 https://github.com/tidyverse/dplyr/issues/7692
    ## 14 2025-03-09 https://github.com/tidyverse/dplyr/issues/7668
    ## 15 2025-02-20 https://github.com/tidyverse/dplyr/issues/7663
    ## 16 2025-02-12 https://github.com/tidyverse/dplyr/issues/7657
    ## 17 2025-01-06 https://github.com/tidyverse/dplyr/issues/7622
    ## 18 2024-12-18 https://github.com/tidyverse/dplyr/issues/7112
    ## 19 2024-11-21 https://github.com/tidyverse/dplyr/issues/7106
    ## 20 2024-11-21 https://github.com/tidyverse/dplyr/issues/7105
    ## 21 2024-11-08 https://github.com/tidyverse/dplyr/issues/7102
    ## 22 2024-09-07 https://github.com/tidyverse/dplyr/issues/7083
    ## 23 2024-07-17 https://github.com/tidyverse/dplyr/issues/7056
    ## 24 2024-07-10 https://github.com/tidyverse/dplyr/issues/7050
    ## 25 2024-07-03 https://github.com/tidyverse/dplyr/issues/7048
    ## 26 2024-06-26 https://github.com/tidyverse/dplyr/issues/7045
    ## 27 2024-06-12 https://github.com/tidyverse/dplyr/issues/7039
    ## 28 2024-05-18 https://github.com/tidyverse/dplyr/issues/7028
    ## 29 2024-05-06 https://github.com/tidyverse/dplyr/issues/7019
    ## 30 2024-04-29 https://github.com/tidyverse/dplyr/issues/7017
    ## 31 2024-04-20 https://github.com/tidyverse/dplyr/issues/7016
    ## 32 2024-04-20 https://github.com/tidyverse/dplyr/issues/7015
    ## 33 2024-04-02 https://github.com/tidyverse/dplyr/issues/7008
    ## 34 2024-03-28 https://github.com/tidyverse/dplyr/issues/7006
    ## 35 2024-03-08 https://github.com/tidyverse/dplyr/issues/7001
    ## 36 2024-02-21 https://github.com/tidyverse/dplyr/issues/6992
    ## 37 2024-02-14 https://github.com/tidyverse/dplyr/issues/6991
    ## 38 2024-01-18 https://github.com/tidyverse/dplyr/issues/6985
    ## 39 2024-01-08 https://github.com/tidyverse/dplyr/issues/6980
    ## 40 2023-12-28 https://github.com/tidyverse/dplyr/issues/6978
    ## 41 2023-11-30 https://github.com/tidyverse/dplyr/issues/6972
    ## 42 2023-11-23 https://github.com/tidyverse/dplyr/issues/6970
    ## 43 2023-11-20 https://github.com/tidyverse/dplyr/issues/6968
    ## 44 2023-11-03 https://github.com/tidyverse/dplyr/issues/6952
    ## 45 2023-10-25 https://github.com/tidyverse/dplyr/issues/6943
    ## 46 2023-10-10 https://github.com/tidyverse/dplyr/issues/6939
    ## 47 2023-10-02 https://github.com/tidyverse/dplyr/issues/6934
    ## 48 2023-08-31 https://github.com/tidyverse/dplyr/issues/6921
    ## 49 2023-08-20 https://github.com/tidyverse/dplyr/issues/6915
    ## 50 2023-07-24 https://github.com/tidyverse/dplyr/issues/6892
    ## 51 2023-06-24 https://github.com/tidyverse/dplyr/issues/6870
    ## 52 2023-05-30 https://github.com/tidyverse/dplyr/issues/6861
    ## 53 2023-05-23 https://github.com/tidyverse/dplyr/issues/6853
    ## 54 2023-04-13 https://github.com/tidyverse/dplyr/issues/6822
    ## 55 2023-03-27 https://github.com/tidyverse/dplyr/issues/6809
    ## 56 2023-03-23 https://github.com/tidyverse/dplyr/issues/6806
    ## 57 2023-03-21 https://github.com/tidyverse/dplyr/issues/6802
    ## 58 2023-03-20 https://github.com/tidyverse/dplyr/issues/6795
    ## 59 2023-03-08 https://github.com/tidyverse/dplyr/issues/6783
    ## 60 2023-02-10 https://github.com/tidyverse/dplyr/issues/6712
    ## 61 2023-02-01 https://github.com/tidyverse/dplyr/issues/6676
    ## 62 2023-01-26 https://github.com/tidyverse/dplyr/issues/6663
    ## 63 2023-01-26 https://github.com/tidyverse/dplyr/issues/6662
    ## 64 2023-01-25 https://github.com/tidyverse/dplyr/issues/6660
    ## 65 2022-11-30 https://github.com/tidyverse/dplyr/issues/6580
    ## 66 2022-11-08 https://github.com/tidyverse/dplyr/issues/6532
    ## 67 2022-10-11 https://github.com/tidyverse/dplyr/issues/6497
    ## 68 2022-09-01 https://github.com/tidyverse/dplyr/issues/6446
    ## 69 2022-08-30 https://github.com/tidyverse/dplyr/issues/6435
    ## 70 2022-02-01 https://github.com/tidyverse/dplyr/issues/6170
    ## 71 2021-09-17 https://github.com/tidyverse/dplyr/issues/6022
    ## 72 2020-10-26 https://github.com/tidyverse/dplyr/issues/5573
    ## 73 2020-06-01 https://github.com/tidyverse/dplyr/issues/5290
    ## 74 2019-12-13 https://github.com/tidyverse/dplyr/issues/4663
    ## 75 2018-12-17 https://github.com/tidyverse/dplyr/issues/4028
    ## 
    ## $pull_requests
    ##                                                       title
    ## 1 chore: update readme to use `.by` instead of `group_by()`
    ##                                                                        body
    ## 1 Please feel free to reject this if you prefer to keep as-is. Just thou...
    ##         date                                         link
    ## 1 2026-02-04 https://github.com/tidyverse/dplyr/pull/7803
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
    ## 1           Skagit TAMM calculations
    ## 2 Funkiness of coastal tribe dropoff
    ## 3             Add FRAM run checklist
    ## 4                          EQUATIONS
    ## 5                       GIT COMMANDS
    ##                                                                                                            body
    ## 1          For Skagit, the fish from the hatchery are genetically-wild-but-hatchery-reared, and it is an agr...
    ## 2          Steph and I spent a lot of time figuring out dropoff for Grays harbor, and I want this weird case...
    ## 3          Based on documents from Ty, Steph, Derek, others. Get input from the typical FRAM modelers (Yi, O...
    ## 4          Equations are for some reason failing to fully render when a fraction is NOT involved. A workarou...
    ## 5 Git command lines:\r\n@fidelicus or anyone else\r\n\r\ngit pull origin bp_documentation\r\ngit add *.Rmd\r...
    ##         date                                            link
    ## 1 2026-01-06 https://github.com/FRAMverse/fram_doc/issues/19
    ## 2 2025-04-14 https://github.com/FRAMverse/fram_doc/issues/18
    ## 3 2025-04-13 https://github.com/FRAMverse/fram_doc/issues/17
    ## 4 2023-09-28 https://github.com/FRAMverse/fram_doc/issues/13
    ## 5 2023-09-27 https://github.com/FRAMverse/fram_doc/issues/11

## Understanding functions within a package

[codeInspectr](https://github.com/cbedwards-dfw/codeInspectr) has tools
for understanding the relationships between functions in a package. Here
we will explore the codeInspectr package itself with those tools.

First, we can list the functions in a package

``` r
package_functions("codeInspectr")
```

    ##  [1] "build_package_network"       "build_recursive_edges"      
    ##  [3] "find_function_dependencies"  "find_recursive_dependencies"
    ##  [5] "find_reverse_dependencies"   "get_branch_activity"        
    ##  [7] "get_issues"                  "get_noncran_dependencies"   
    ##  [9] "get_pull_requests"           "package_functions"          
    ## [11] "plot_function_dependencies"  "summarize_repository"       
    ## [13] "validate_character"          "validate_data_frame"        
    ## [15] "validate_flag"               "validate_integer"           
    ## [17] "validate_numeric"            "validate_repository"

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
