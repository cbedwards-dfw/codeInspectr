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
get_branch_activity("tidyverse/dplyr")
#>                              branch most_recent_update
#> 1                              main         2026-02-04
#> 2               copilot/sub-pr-7046         2025-11-17
#> 3              feature/advance-lazy         2025-11-12
#> 4                feature/filter-out         2025-11-06
#> 5               feature/case-family         2025-09-09
#> 6                          f-revdep         2025-04-16
#> 7                     f-lazy-always         2024-05-09
#> 8              f-reconstruct-altrep         2023-09-10
#> 9             f-collect-materialize         2023-08-12
#> 10                     f-fast-count         2023-05-29
#> 11                f-marker-comments         2023-01-05
#> 12        f-avoid-purge-reconstruct         2022-12-11
#> 13                     f-relational         2022-12-10
#> 14                          v1.0.10         2022-08-31
#> 15                      f-poc-focus         2022-08-28
#> 16           f-6382-summarize-multi         2022-08-19
#> 17                   f-generic-dots         2022-08-19
#> 18            simpler-slice-helpers         2022-08-16
#> 19                       db-defunct         2022-08-03
#> 20                 lazyeval-defunct         2022-08-01
#> 21                   rowwise-across         2022-07-30
#> 22           f-6254-across-original         2022-05-01
#> 23          f-vec-if-else-case-when         2022-02-03
#> 24                  arrange_0col_df         2021-12-01
#> 25   mutate_grouped_attributes_6100         2021-11-30
#> 26               f-tbl-sum-ellipsis         2021-10-25
#> 27             f-5903-row-number-na         2021-10-20
#> 28           6015_early_materialize         2021-09-16
#> 29                b-rsqlite-example         2021-07-29
#> 30                   f-check-bionic         2021-07-29
#> 31         5918_rowwise_df_subclass         2021-06-29
#> 32               defunct_underscore         2021-04-20
#> 33                 remove_lazy_eval         2021-04-20
#> 34 add_count_dplyr_reconstruct_5837         2021-04-09
#> 35             vctrs_vec_order_locs         2021-03-10
#> 36                   v1_0_4_pkgdown         2021-02-12
#> 37                   1.0.4.constant         2021-02-01
#> 38                           bundle         2020-12-04
#> 39               shiny_error_bypass         2020-11-20
#> 40            rows_update_duplicate         2020-11-05
#> 41            slice_num_as_location         2020-07-15
#>                                                                        link
#> 1                              https://github.com/tidyverse/dplyr/tree/main
#> 2               https://github.com/tidyverse/dplyr/tree/copilot/sub-pr-7046
#> 3              https://github.com/tidyverse/dplyr/tree/feature/advance-lazy
#> 4                https://github.com/tidyverse/dplyr/tree/feature/filter-out
#> 5               https://github.com/tidyverse/dplyr/tree/feature/case-family
#> 6                          https://github.com/tidyverse/dplyr/tree/f-revdep
#> 7                     https://github.com/tidyverse/dplyr/tree/f-lazy-always
#> 8              https://github.com/tidyverse/dplyr/tree/f-reconstruct-altrep
#> 9             https://github.com/tidyverse/dplyr/tree/f-collect-materialize
#> 10                     https://github.com/tidyverse/dplyr/tree/f-fast-count
#> 11                https://github.com/tidyverse/dplyr/tree/f-marker-comments
#> 12        https://github.com/tidyverse/dplyr/tree/f-avoid-purge-reconstruct
#> 13                     https://github.com/tidyverse/dplyr/tree/f-relational
#> 14                          https://github.com/tidyverse/dplyr/tree/v1.0.10
#> 15                      https://github.com/tidyverse/dplyr/tree/f-poc-focus
#> 16           https://github.com/tidyverse/dplyr/tree/f-6382-summarize-multi
#> 17                   https://github.com/tidyverse/dplyr/tree/f-generic-dots
#> 18            https://github.com/tidyverse/dplyr/tree/simpler-slice-helpers
#> 19                       https://github.com/tidyverse/dplyr/tree/db-defunct
#> 20                 https://github.com/tidyverse/dplyr/tree/lazyeval-defunct
#> 21                   https://github.com/tidyverse/dplyr/tree/rowwise-across
#> 22           https://github.com/tidyverse/dplyr/tree/f-6254-across-original
#> 23          https://github.com/tidyverse/dplyr/tree/f-vec-if-else-case-when
#> 24                  https://github.com/tidyverse/dplyr/tree/arrange_0col_df
#> 25   https://github.com/tidyverse/dplyr/tree/mutate_grouped_attributes_6100
#> 26               https://github.com/tidyverse/dplyr/tree/f-tbl-sum-ellipsis
#> 27             https://github.com/tidyverse/dplyr/tree/f-5903-row-number-na
#> 28           https://github.com/tidyverse/dplyr/tree/6015_early_materialize
#> 29                https://github.com/tidyverse/dplyr/tree/b-rsqlite-example
#> 30                   https://github.com/tidyverse/dplyr/tree/f-check-bionic
#> 31         https://github.com/tidyverse/dplyr/tree/5918_rowwise_df_subclass
#> 32               https://github.com/tidyverse/dplyr/tree/defunct_underscore
#> 33                 https://github.com/tidyverse/dplyr/tree/remove_lazy_eval
#> 34 https://github.com/tidyverse/dplyr/tree/add_count_dplyr_reconstruct_5837
#> 35             https://github.com/tidyverse/dplyr/tree/vctrs_vec_order_locs
#> 36                   https://github.com/tidyverse/dplyr/tree/v1_0_4_pkgdown
#> 37                   https://github.com/tidyverse/dplyr/tree/1.0.4.constant
#> 38                           https://github.com/tidyverse/dplyr/tree/bundle
#> 39               https://github.com/tidyverse/dplyr/tree/shiny_error_bypass
#> 40            https://github.com/tidyverse/dplyr/tree/rows_update_duplicate
#> 41            https://github.com/tidyverse/dplyr/tree/slice_num_as_location
```
