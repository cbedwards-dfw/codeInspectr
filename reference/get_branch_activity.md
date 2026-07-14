# Return active branches and the most recent updates of github repository

Summarizes recent activity on a remote github repository, listing active
branches and their most recent updates. \#' Will only process the first
100 branches of a repository. Repository does not need to be an R
package, or even contain R code. Will not list activity for "gh-pages",
which is the branch used for pkgdown.

## Usage

``` r
get_branch_activity(repo_address)
```

## Arguments

- repo_address:

  Github repository address, of the form "user/repository", as in
  `"FRAMverse/framrsquared"`. Does not need to be an R package.

## Value

Dataframe with `$branch` (branch name) and `$most_recent_update` (date
of most recent commit)

## Examples

``` r
get_branch_activity("FRAMverse/framrsquared")
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
get_branch_activity("tidyverse/dplyr")
#>                              branch most_recent_update
#> 1                              main         2026-06-02
#> 2                      feature/with         2026-05-15
#> 3                      dev-roxygen2         2026-04-07
#> 4     copilot/add-ellipsis-to-tally         2026-02-22
#> 5                      feature/webr         2026-02-10
#> 6               copilot/sub-pr-7046         2025-11-17
#> 7              feature/advance-lazy         2025-11-12
#> 8                feature/filter-out         2025-11-06
#> 9               feature/case-family         2025-09-09
#> 10                         f-revdep         2025-04-16
#> 11                    f-lazy-always         2024-05-09
#> 12             f-reconstruct-altrep         2023-09-10
#> 13            f-collect-materialize         2023-08-12
#> 14                     f-fast-count         2023-05-29
#> 15                f-marker-comments         2023-01-05
#> 16        f-avoid-purge-reconstruct         2022-12-11
#> 17                     f-relational         2022-12-10
#> 18                          v1.0.10         2022-08-31
#> 19                      f-poc-focus         2022-08-28
#> 20           f-6382-summarize-multi         2022-08-19
#> 21                   f-generic-dots         2022-08-19
#> 22            simpler-slice-helpers         2022-08-16
#> 23                       db-defunct         2022-08-03
#> 24                 lazyeval-defunct         2022-08-01
#> 25                   rowwise-across         2022-07-30
#> 26           f-6254-across-original         2022-05-01
#> 27          f-vec-if-else-case-when         2022-02-03
#> 28                  arrange_0col_df         2021-12-01
#> 29   mutate_grouped_attributes_6100         2021-11-30
#> 30               f-tbl-sum-ellipsis         2021-10-25
#> 31             f-5903-row-number-na         2021-10-20
#> 32           6015_early_materialize         2021-09-16
#> 33                b-rsqlite-example         2021-07-29
#> 34                   f-check-bionic         2021-07-29
#> 35         5918_rowwise_df_subclass         2021-06-29
#> 36               defunct_underscore         2021-04-20
#> 37                 remove_lazy_eval         2021-04-20
#> 38 add_count_dplyr_reconstruct_5837         2021-04-09
#> 39             vctrs_vec_order_locs         2021-03-10
#> 40                   v1_0_4_pkgdown         2021-02-12
#> 41                   1.0.4.constant         2021-02-01
#> 42                           bundle         2020-12-04
#> 43               shiny_error_bypass         2020-11-20
#> 44            rows_update_duplicate         2020-11-05
#> 45            slice_num_as_location         2020-07-15
#>                                                                        link
#> 1                              https://github.com/tidyverse/dplyr/tree/main
#> 2                      https://github.com/tidyverse/dplyr/tree/feature/with
#> 3                      https://github.com/tidyverse/dplyr/tree/dev-roxygen2
#> 4     https://github.com/tidyverse/dplyr/tree/copilot/add-ellipsis-to-tally
#> 5                      https://github.com/tidyverse/dplyr/tree/feature/webr
#> 6               https://github.com/tidyverse/dplyr/tree/copilot/sub-pr-7046
#> 7              https://github.com/tidyverse/dplyr/tree/feature/advance-lazy
#> 8                https://github.com/tidyverse/dplyr/tree/feature/filter-out
#> 9               https://github.com/tidyverse/dplyr/tree/feature/case-family
#> 10                         https://github.com/tidyverse/dplyr/tree/f-revdep
#> 11                    https://github.com/tidyverse/dplyr/tree/f-lazy-always
#> 12             https://github.com/tidyverse/dplyr/tree/f-reconstruct-altrep
#> 13            https://github.com/tidyverse/dplyr/tree/f-collect-materialize
#> 14                     https://github.com/tidyverse/dplyr/tree/f-fast-count
#> 15                https://github.com/tidyverse/dplyr/tree/f-marker-comments
#> 16        https://github.com/tidyverse/dplyr/tree/f-avoid-purge-reconstruct
#> 17                     https://github.com/tidyverse/dplyr/tree/f-relational
#> 18                          https://github.com/tidyverse/dplyr/tree/v1.0.10
#> 19                      https://github.com/tidyverse/dplyr/tree/f-poc-focus
#> 20           https://github.com/tidyverse/dplyr/tree/f-6382-summarize-multi
#> 21                   https://github.com/tidyverse/dplyr/tree/f-generic-dots
#> 22            https://github.com/tidyverse/dplyr/tree/simpler-slice-helpers
#> 23                       https://github.com/tidyverse/dplyr/tree/db-defunct
#> 24                 https://github.com/tidyverse/dplyr/tree/lazyeval-defunct
#> 25                   https://github.com/tidyverse/dplyr/tree/rowwise-across
#> 26           https://github.com/tidyverse/dplyr/tree/f-6254-across-original
#> 27          https://github.com/tidyverse/dplyr/tree/f-vec-if-else-case-when
#> 28                  https://github.com/tidyverse/dplyr/tree/arrange_0col_df
#> 29   https://github.com/tidyverse/dplyr/tree/mutate_grouped_attributes_6100
#> 30               https://github.com/tidyverse/dplyr/tree/f-tbl-sum-ellipsis
#> 31             https://github.com/tidyverse/dplyr/tree/f-5903-row-number-na
#> 32           https://github.com/tidyverse/dplyr/tree/6015_early_materialize
#> 33                https://github.com/tidyverse/dplyr/tree/b-rsqlite-example
#> 34                   https://github.com/tidyverse/dplyr/tree/f-check-bionic
#> 35         https://github.com/tidyverse/dplyr/tree/5918_rowwise_df_subclass
#> 36               https://github.com/tidyverse/dplyr/tree/defunct_underscore
#> 37                 https://github.com/tidyverse/dplyr/tree/remove_lazy_eval
#> 38 https://github.com/tidyverse/dplyr/tree/add_count_dplyr_reconstruct_5837
#> 39             https://github.com/tidyverse/dplyr/tree/vctrs_vec_order_locs
#> 40                   https://github.com/tidyverse/dplyr/tree/v1_0_4_pkgdown
#> 41                   https://github.com/tidyverse/dplyr/tree/1.0.4.constant
#> 42                           https://github.com/tidyverse/dplyr/tree/bundle
#> 43               https://github.com/tidyverse/dplyr/tree/shiny_error_bypass
#> 44            https://github.com/tidyverse/dplyr/tree/rows_update_duplicate
#> 45            https://github.com/tidyverse/dplyr/tree/slice_num_as_location
```
