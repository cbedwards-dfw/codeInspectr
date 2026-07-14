# Return summary of open Github Issues

Return summary of open Github Issues

## Usage

``` r
get_issues(repo_address, max_char = 97)
```

## Arguments

- repo_address:

  Github repository address, of the form "user/repository", as in
  `"FRAMverse/framrsquared"`. Does not need to be an R package.

- max_char:

  Maximum number of characters to return in the "body" column.

## Value

dataframe with `$title`, `$body`, and `$date` of open issues.

## Examples

``` r
get_issues("FRAMverse/framrsquared")
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
#>                                                                                                        body
#> 1                                                                                                          
#> 2     - The compiling of quarto docs buries them pretty deep. Have them save in a clearer location\n- Co...
#> 3      I want to check in with the FRAM team on the following items to get consensus before finalizing 0...
#> 4      Elaboration on our sensitivity analyses functions. Users identify the timestep x fisheries they w...
#> 5                                                                                                          
#> 6                                        Currently run copying happens first, and error seems to be silent!
#> 7                                                                                                          
#> 8                                                                                                          
#> 9             This function is only intended for QAQC of fram changes, so shouldn't live in `framrsquared`.
#> 10     I've created the following files, and want to confirm that functions either error correctly or pr...
#> 11     Goal: barebones framverse website, make a blog post on the changes with this release. Aiming for ...
#> 12     - Filter_union() --> takes two filters, use the alternative return approach to create a new vecto...
#> 13                                                                                                         
#> 14     Currently when a flag changes, compare_runs reports the flag but not if the corresponding values ...
#> 15     Show costs of changes to one fishery on another fishery. Should just be ratio of values in the im...
#> 16     I haven't been using lintR or the format cleaning plugin. I should apply that across the board to...
#> 17     From Collin: brainstorm a LUT with any relevant terms, and we can build a filtering function (or ...
#> 18                                                                                                         
#> 19              Only used internally and not exported, but probably helpful to include for future dev info.
#> 20     @Angelikahagen wrote some code to visualize convergence to target escapements in the backwards FR...
#> 21     Add a check to make sure the stock fishery rate scalers match between the forward and backward ru...
#> 22     https://github.com/FRAMverse/framrsquared/blob/c838dc922c195275ad9a84701294eebaf118fbdb/R/post_se...
#> 23     Use `testthat::skip_if_not()` to skip tests when the test databases are not available. This packa...
#> 24     Request from @sthurner11. The following is a script used by coho modelers to transfer ocean optio...
#> 25     Try custom filtering to commercial WA net -- end up with a 2x2 grid, but the "timesteps" axis sho...
#> 26     currently compare_database() assumes run_ids match between the two databases. add optional argume...
#> 27                                   Right now the assignment of stock groups is using a LUT for coho only.
#> 28     During preseason we copy the ocean options into our NOF runs using 'merge ocean option' R code --...
#> 29                            Includes fisheries like central OR Troll and Sport, So Calif Troll and Sport.
#> 30     For chinook, warn if making any changes to the fisheries that are overwritten by the TAMM tami ta...
#> 31     Currently copy_fishery_scalers uses an "Update" call. This can give screwy behavior when the numb...
#> 32                                                                                         As appropriate. 
#> 33     - Would be very useful to be able to zero out individual fishery (or fisheries) programmatically....
#> 34                                          The fishery_ids used in `filter_commercial_wa_nt()` are wrong. 
#> 35     Working with @sthurner11 on making the VS Input Template from the final run this year. The final ...
#> 36     Currently we can layer filters to look at the intersection of filters (filter_wa() |> filter_net(...
#> 37     Failing to pick up changes in inputs where the flag has changed  e.g. a fishery input with a scal...
#> 38     Many of the treaty fisheries have harvests that are based on terminal run size. When we change ot...
#> 39                                                                  Add function to calculate ERs directly.
#> 40     I was trying to use the compare functions on a transfer file with two runs in it, and most of the...
#> 41 @cbedwards-dfw \r\n\r\nIt'd be a good idea to have stock filtering as well as the fishery filtering f...
#> 42     From conversation with @Ty-WDFW on 12/13/24. Add `describe_data()` functionality. Goal is to be a...
#> 43     Derek has an excel-based tool that uses some complex logic and pivot tables to summarize mortalit...
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
get_issues("tidyverse/dplyr")
#>                                                                                                                               title
#> 1                                      `pull()` interprets subtraction between column names as subtraction between column positions
#> 2  When reusing argument names in `summarise()` to build a complex expression, the length of intermediate expressions is considered
#> 3                                                                                              Should we have AI specific warnings?
#> 4                                                                                                       FR: `if_any(.empty="keep")`
#> 5                                                                     Should `cbind` and `rbind` be mentionned in dplyr <-> base R?
#> 6                                       `filter()` documentation should refer to `if_any()` or `if_all()` for across-like filtering
#> 7                                                                                       Add ellipsis to `tally()` and `add_tally()`
#> 8                                             Argument inconsistency between `case_when()` and `recode_values()`/`replace_values()`
#> 9                                                                             no error or warning on incorrect usage of `between()`
#> 10                                                                                 dplyr verbs remove attributes of classed columns
#> 11                                                                 Stop exporting `data_frame()` and `as_data_frame()` from tibble?
#> 12                                                         Across gives unclear error when function returns incorrect length output
#> 13                                                 slice_sample does not restrict sampling to n() within a group when replace=TRUE.
#> 14                                                                                                     Deprecate `sql_*` and `db_*`
#> 15                                                                          Using related columns in `cur_column()` with `across()`
#> 16                                                       count function needs guard rails that name shouldn't be an existing column
#> 17                                                                                               Add `bounds` to `dplyr::between()`
#> 18                                                   `between()` doesn't work if `x` is `Date` and `left` and `right` are character
#> 19                                                                                                   Make `add_tally()` S3 generic?
#> 20                                                                                                  Internal error in `summarise()`
#> 21                                                                   `across(.names =)` evaluates `"{col}"` as if it was `"{.col}"`
#> 22                                                                                     `tbl_vars()` accesses `nrow()` unnecessarily
#> 23                                                                           reframe with across returns an unhelpful error message
#> 24                                                                               `Mutating joins` relationship documentation issues
#> 25                                                                                                                  `count(.by = )`
#> 26                                                                     Show methods implemented by loaded packages more prominently
#> 27                                                              filter should warn or prevent users from using named logical inputs
#> 28                                                                                           dplyr::cur_column don't support dtplyr
#> 29                                                                                                         Join list of data frames
#> 30                                                                                           across(), but over two sets of vector 
#> 31                                                                                                              Split `join_cols()`
#> 32                                                         `dplyr_reconstruct` can create data.table with corrupted secondary index
#> 33                                                                Should `desc()` use `vec_rank()` internally on character vectors?
#> 34                                                                                                      `rowwise()` and empty input
#> 35                                FR: allow `pick()` to rename in `distinct()` + some thoughts about `arrange()` allowing renaming.
#> 36                                                                                         In `select` `!` and `-` work differently
#> 37                                                       Variable scoping issue with .data inside lambda Ffunction used in across()
#> 38                                                                                  c_across() docs imply a dependency on rowwise()
#> 39                                                     `summarise()` and `reframe()` turns warnings from inside functions as errors
#> 40                                                                         Clarity of "duplicated" error message in `rename_with()`
#> 41                                                        Internal: slightly inaccurate `as_join_by()` implementation for character
#> 42                                                              Request non-equal join: closest() supports dual-sided inequality <>
#> 43                                                                                        Add `tidypolars` to the list of backends?
#> 44                                                                                  perfromance slowdown using across within mutate
#> 45                                                                                 arrange not reporting syntax errors on .by_group
#> 46                             A better data masking indirection example in the `programming.Rmd` vignette: `filter(df, {{ var }})`
#> 47                                                                  Feature Request: In across, have function for `.names` argument
#> 48                                                                          Feature request: allow additional predicates in join_by
#> 49                                               Emphasize that filter(x, A, B) is not strictly the same as filter(filter(x, A), B)
#> 50                                             `lifecycle::last_lifecycle_warnings()` seems incompatible with dplyr warning handler
#> 51                                                                                   condition handling ignores locally set options
#> 52                `Error in vapply(.x, .f, .mold, ..., USE.NAMES = FALSE)`: cli_warn together with dplyr grouping results in error.
#> 53                                                    When `.unpack = TRUE`, `.names` should delay its column name uniqueness check
#> 54                                                                                                            bug in `dplyr::near`?
#> 55                                                                                                              FR: `rows_clean()`?
#> 56                                                           dplyr::across inappropriately rewrites dollar indexes my function code
#> 57                                                                          Unexpected interaction between rowwise and group_modify
#> 58                                                                   `mutate` superseding `transmute` should allow ordering columns
#> 59                                                                             Possible regression re. use of glue in dplyr::across
#> 60                                                                                         Consider allowing `.env$` in `join_by()`
#> 61                                    How to adjust to different behavior of across .fn argument passing in dplyr 1.1.1 vs. 1.0.10?
#> 62                                                                                 `count()` and `add_count()` could be much faster
#> 63                                                                                                 Reconsider re-exports from rlang
#> 64                                                                                `filter(across())` warning isn't always triggered
#> 65                                                                           `slice_max()` is quite slow for a big number of groups
#> 66                                                                                         Can we improve on this `across()` error?
#> 67                                                                    `bind_rows()` on a list of data.tables creates corrupt output
#> 68                                                    Consider `.sort = FALSE` for `summarise()`, `reframe()`, and `slice_sample()`
#> 69                                         `slice()` and `slice_head/tail/min/max()` should act like a `filter()` not a `reframe()`
#> 70                                                      `mutate(.by_row =)`, `reframe(.by_row =)`, and possibly `filter(.by_row =)`
#> 71                                                                       Make `Joining with` message clickable to copy-to-clipboard
#> 72                                                                                              Alternative `summarise()` groupings
#> 73                                                                                                           `nest_join()` upgrades
#> 74                                                                              Should joins have `.before` and `.after` arguments?
#> 75                                                                                               Add `merge` indicator after a join
#> 76                                                        `dplyr::group_by_prepare()` does not work with lazy tables and `across()`
#> 77                                                             Add argument `na_matches = c("na", "never")` to `rows_*()` functions
#> 78                                                                                        Remove lazy eval fallbacks (>= Sept 2023)
#> 79                                                                                               Add dplyr_sticky_cols() or similar
#> 80                                                                                                 Move database generics to dbplyr
#> 81                                                                                    Better way to handle name collisions in joins
#>                                                                                                                body
#> 1          Hi, \n\nThis is a minor bug, but it could lead to potential errors.\n\nI was trying to one-line pull ...
#> 2              I am not sure if this is a bug or not, but it surprised me when I was implementing https://github...
#> 3            Consider this warning message about multiple matches in joins\n\nhttps://github.com/tidyverse/dplyr...
#> 4            Hi,\n\nSince https://github.com/tidyverse/dplyr/issues/7059, zero-length selection in `if_any()` yi...
#> 5              Is it possible to include the `bind_cols` and `bind_rows` functions in the R base and tidyverse c...
#> 6              Hiya! Was just explaining to someone else how to resolve bugs caused by the [deprecation of using...
#> 7              The `wt`, `sort` and `name` arguments should be behind an ellipsis, like for `count()` and simila...
#> 8              Hello, I am excited about the new dplyr verbs `recode_values()` and `replace_values()` and have b...
#> 9              The main title of the function reads "Detect where values fall in a specified range" which, if yo...
#> 10         ## Problem description\n\nHi, \n\nThis issue is based on https://github.com/tidyverse/dplyr/issues/76...
#> 11             they were deprecated in tibble 2.0, (2019) and create a bit of noise in the autocomplete. Removin...
#> 12             In the example below, the function gives a 2-length result for a 1-length input. (My real case to...
#> 13             I've been playing around with slice_sample on grouped data frames for bootstrapping. The document...
#> 14             The next version of dbplyr will no longer need them (https://github.com/tidyverse/dbplyr/pull/165...
#> 15          Hello!\nI would like to write code with dplyr + across. for this:\n\nWhere x = x_1 + x_2, y = y_1 + ...
#> 16             If you use the count function and set name to be one of the existing columns you are tabulating o...
#> 17         The docs of `between()` say:\n\n   `This is a shortcut for x >= left & x <= right`\n\nIt would be nic...
#> 18         The docs of `between()` say:\n\n> This is a shortcut for `x >= left & x <= right`\n\nHowever, `betwee...
#> 19          `count()`, `add_count()`, and `tally()` are generics but `add_tally()` is not:\n\n``` r\nsloop::is_s...
#> 20       ``` r\nlibrary(dplyr)\n\npenguins |>\n  summarize(\n    .by = species,\n    across(everything(), identi...
#> 21        It doesn't seem to be the expected behavior according to the documentation.\n\n``` r\ncol <- "foo"\n\n...
#> 22             This currently affects joins with `library(duckplyr)` . I can work around, perhaps we find a nice...
#> 23             When I call `reframe` with `across` and the length of the output is not consistent, the error mes...
#> 24        `Mutate-joins (dplyr)` documentation says:\n\n```\nrelationship\n\nHandling of the expected relationsh...
#> 25             I accidentally used the syntax below, and wonder if this should be the default recommended one, o...
#> 26           Example: if dbplyr is loaded, `?mutate` would contain a link to `?dbplyr::mutate.tbl_lazy` .\n\nPre...
#> 27            Currently dplyr warns users who accidentally use `=` instead of `==`. \nHowever, this does not occ...
#> 28           Please run these codes, and it will yeild an error message.\n```\na <- data.frame(x1 =c(0, 1), x2 =...
#> 29             I have encounter with the necessity of joining several tibbles, which i have nested in a list. Th...
#> 30             Sometimes, when doing data wrangling, you need to apply functions not only on multiple columns, b...
#> 31             Currently, `join_cols()` is called by `join_filter()` but is doing too much. The `$out` component...
#> 32     ## Problem\r\n\r\nThanks @AMDraghici for your suggestions!\r\n\r\nFor example, in `bind_rows`, if the fir...
#> 33         See https://github.com/tidyverse/dplyr/issues/7044\r\n\r\nIn particular, note that `arrange(df, x)` w...
#> 34             Should we guarantee that the functions used in a rowwise `mutate()` or `summarize()` or `reframe(...
#> 35         This would be useful in packages to avoid cran warnings as `pick()` is the new preferred way.\r\n\r\n...
#> 36             I'm not sure if this is intended behaviour but it came up in a recent training session and wasn't...
#> 37       Hello,\r\n\r\nThis error was driving me crazy and took me a while to isolate it. \r\nif one wants to us...
#> 38             I find the docs for `c_across()` imply the requirement for a `rowwise()` call which isn't require...
#> 39             Please briefly describe your problem and what output you expect. If you have a question, please d...
#> 40         Hi,  \r\n\r\nWhen using `rename_with()` and ending with duplicated column names, the error message te...
#> 41         ``` r\r\nwaldo::compare(dplyr:::as_join_by("a"), dplyr::join_by(a == a))\r\n#> `old$exprs[[1]]`: `"a"...
#> 42             For example, I now have the following Table 1 and Table 2. I want to find a `value2` from both si...
#> 43             Hello, I've been working on [`tidypolars`](https://tidypolars.etiennebacher.com/) for a few month...
#> 44         I believe this is an unexplored performance issue, seemingly relating to dplyr::expand_across\r\n\r\n...
#> 45         Hello,\r\n\r\nWhen using `arrange` on grouped data (and wanting to respect the grouping), we need to ...
#> 46     This code does not work:\r\n```r\r\nf <- function(df, var) filter(df, {{ var }})\r\nf(mtcars, am)\r\n# Er...
#> 47             One common thing that I want to do in the `dplyr` workflow is take a set of variables, apply some...
#> 48       `join_by` refuses to handle any predicates it doesn't recognize:\r\n\r\n```\r\nExpressions must use one...
#> 49       Have had to re-confirm this for myself a few times:\r\n\r\n```r\r\nfilter(mtcars, cyl < max(cyl), hp < ...
#> 50       i.e. it tells you to run the lifecycle function, but there is no warning there:\r\n\r\n``` r\r\nlibrary...
#> 51     Maybe because of a delayed evaluation issue ?\r\n\r\n``` r\r\nbugged <- function() {\r\n  withr::local_op...
#> 52         Hi,\r\n\r\nit took me a while to get to this (very artificial) reduced example, but I managed to get ...
#> 53         Extracted from https://github.com/tidyverse/dplyr/issues/6933\r\n\r\nSometimes the function you apply...
#> 54       Is the following example a bug in `near`?\r\n```r\r\n> near(1.1 * 100 * 10^200, 110 * 10^200)\r\n[1] FA...
#> 55             Do we want to add a function that clears all rows to the `rows_*()` family? For data frames, this...
#> 56             I was getting a weird error inside the `mutate(across(...))` (see reprex), and by closely reading...
#> 57             It appears that after an application of `rowwise` the behavior of `group_modify` differs from tha...
#> 58             I recently noticed that `transmute` has been marked as superseded by `mutate(.keep="none")`. Howe...
#> 59         This is discussed in https://twitter.com/mjskay/status/1660770865087148032\r\n\r\nEssentially, users ...
#> 60       Motivated by https://github.com/tidyverse/dplyr/issues/6821\r\n\r\n``` r\r\nlibrary(dplyr, warn.conflic...
#> 61             I have a summarizing function that's similar to the function below. It allows the user to pass gr...
#> 62             Right now these eventually just do `summarise(n = n())` or `mutate(n = n())` at some point, but t...
#> 63             Can we start to un-export any of these https://github.com/tidyverse/dplyr/blob/main/R/utils-tidy-...
#> 64             Between 1.0.7 and 1.1.0 `filter()` stopped taking matrices, per #5973. [NEWS for dplyr 1.0.8](htt...
#> 65             It has gotten better after installing the dev version of dplyr (before a lot of time was wasted i...
#> 66 ``` r\r\nlibrary(dplyr)\r\n\r\ndf <- tibble(x = 1:2, y = 3:4)\r\n\r\nfn <- function(col) {\r\n  stop("oh no")...
#> 67           \r\nwhen using bind_rows on a list of data.tables with keys, with either map_dfr or a do.call, the ...
#> 68             With the introduction of `.by`, we no longer sort group keys automatically. There are a whole hos...
#> 69             Note that this `filter()` call keeps the groups of `x` separated. i.e.  the groups of `2` and `1`...
#> 70         Related to https://github.com/tidyverse/dplyr/issues/4723\r\n\r\nWith the introduction of `.by`, it s...
#> 71         Hi,\r\n\r\ndplyr 1.1.0 seems like it is going to be great (I installed the dev version with `pak::[pa...
#> 72         Related to\r\nhttps://github.com/tidyverse/dplyr/issues/14\r\nhttps://github.com/tidyverse/dplyr/issu...
#> 73             In some recent exploration of `nest_join()`, I've decided that it is lacking some features that w...
#> 74                                                                                              To match `mutate()`
#> 75             A prior iteration of this request was [closed and locked as old](https://github.com/tidyverse/dpl...
#> 76     ``` r\r\nlibrary(dplyr, warn.conflicts = FALSE)\r\nlibrary(rlang)\r\ndf <- mtcars\r\ndt <- dtplyr::lazy_d...
#> 77             Like the `*_join()` functions the `rows_*()` functions should get an argument `na_matches = c("na...
#> 78             They shouldn't be needed anymore, and they make the error messages unnecessarily confusing. (Have...
#> 79             So that when you implement a tibble subclass with sticky columns, you don't need to add a new `se...
#> 80             Deprecate database generics, following strategy in https://github.com/tidyverse/design/issues/106...
#> 81             Currently, non-join columns available in both tables are given suffixes `.x` and `.y` . Occasiona...
#>          date                                           link
#> 1  2026-07-14 https://github.com/tidyverse/dplyr/issues/7849
#> 2  2026-06-11 https://github.com/tidyverse/dplyr/issues/7845
#> 3  2026-05-18 https://github.com/tidyverse/dplyr/issues/7838
#> 4  2026-04-10 https://github.com/tidyverse/dplyr/issues/7831
#> 5  2026-03-23 https://github.com/tidyverse/dplyr/issues/7822
#> 6  2026-03-09 https://github.com/tidyverse/dplyr/issues/7816
#> 7  2026-02-21 https://github.com/tidyverse/dplyr/issues/7812
#> 8  2026-02-07 https://github.com/tidyverse/dplyr/issues/7806
#> 9  2026-01-17 https://github.com/tidyverse/dplyr/issues/7792
#> 10 2026-01-04 https://github.com/tidyverse/dplyr/issues/7787
#> 11 2025-12-22 https://github.com/tidyverse/dplyr/issues/7786
#> 12 2025-12-21 https://github.com/tidyverse/dplyr/issues/7785
#> 13 2025-12-10 https://github.com/tidyverse/dplyr/issues/7781
#> 14 2025-12-02 https://github.com/tidyverse/dplyr/issues/7779
#> 15 2025-11-21 https://github.com/tidyverse/dplyr/issues/7774
#> 16 2025-11-20 https://github.com/tidyverse/dplyr/issues/7773
#> 17 2025-09-18 https://github.com/tidyverse/dplyr/issues/7712
#> 18 2025-07-20 https://github.com/tidyverse/dplyr/issues/7702
#> 19 2025-06-18 https://github.com/tidyverse/dplyr/issues/7695
#> 20 2025-06-09 https://github.com/tidyverse/dplyr/issues/7693
#> 21 2025-06-09 https://github.com/tidyverse/dplyr/issues/7692
#> 22 2025-03-09 https://github.com/tidyverse/dplyr/issues/7668
#> 23 2025-02-12 https://github.com/tidyverse/dplyr/issues/7657
#> 24 2025-01-06 https://github.com/tidyverse/dplyr/issues/7622
#> 25 2024-12-18 https://github.com/tidyverse/dplyr/issues/7112
#> 26 2024-11-21 https://github.com/tidyverse/dplyr/issues/7106
#> 27 2024-11-21 https://github.com/tidyverse/dplyr/issues/7105
#> 28 2024-11-08 https://github.com/tidyverse/dplyr/issues/7102
#> 29 2024-09-07 https://github.com/tidyverse/dplyr/issues/7083
#> 30 2024-07-17 https://github.com/tidyverse/dplyr/issues/7056
#> 31 2024-07-10 https://github.com/tidyverse/dplyr/issues/7050
#> 32 2024-07-03 https://github.com/tidyverse/dplyr/issues/7048
#> 33 2024-06-26 https://github.com/tidyverse/dplyr/issues/7045
#> 34 2024-06-12 https://github.com/tidyverse/dplyr/issues/7039
#> 35 2024-05-18 https://github.com/tidyverse/dplyr/issues/7028
#> 36 2024-04-29 https://github.com/tidyverse/dplyr/issues/7017
#> 37 2024-04-20 https://github.com/tidyverse/dplyr/issues/7016
#> 38 2024-04-20 https://github.com/tidyverse/dplyr/issues/7015
#> 39 2024-04-02 https://github.com/tidyverse/dplyr/issues/7008
#> 40 2024-03-28 https://github.com/tidyverse/dplyr/issues/7006
#> 41 2024-03-08 https://github.com/tidyverse/dplyr/issues/7001
#> 42 2024-02-21 https://github.com/tidyverse/dplyr/issues/6992
#> 43 2024-02-14 https://github.com/tidyverse/dplyr/issues/6991
#> 44 2024-01-18 https://github.com/tidyverse/dplyr/issues/6985
#> 45 2024-01-08 https://github.com/tidyverse/dplyr/issues/6980
#> 46 2023-12-28 https://github.com/tidyverse/dplyr/issues/6978
#> 47 2023-11-30 https://github.com/tidyverse/dplyr/issues/6972
#> 48 2023-11-23 https://github.com/tidyverse/dplyr/issues/6970
#> 49 2023-11-20 https://github.com/tidyverse/dplyr/issues/6968
#> 50 2023-11-03 https://github.com/tidyverse/dplyr/issues/6952
#> 51 2023-10-25 https://github.com/tidyverse/dplyr/issues/6943
#> 52 2023-10-10 https://github.com/tidyverse/dplyr/issues/6939
#> 53 2023-10-02 https://github.com/tidyverse/dplyr/issues/6934
#> 54 2023-08-31 https://github.com/tidyverse/dplyr/issues/6921
#> 55 2023-08-20 https://github.com/tidyverse/dplyr/issues/6915
#> 56 2023-07-24 https://github.com/tidyverse/dplyr/issues/6892
#> 57 2023-06-24 https://github.com/tidyverse/dplyr/issues/6870
#> 58 2023-05-30 https://github.com/tidyverse/dplyr/issues/6861
#> 59 2023-05-23 https://github.com/tidyverse/dplyr/issues/6853
#> 60 2023-04-13 https://github.com/tidyverse/dplyr/issues/6822
#> 61 2023-03-27 https://github.com/tidyverse/dplyr/issues/6809
#> 62 2023-03-23 https://github.com/tidyverse/dplyr/issues/6806
#> 63 2023-03-21 https://github.com/tidyverse/dplyr/issues/6802
#> 64 2023-03-20 https://github.com/tidyverse/dplyr/issues/6795
#> 65 2023-03-08 https://github.com/tidyverse/dplyr/issues/6783
#> 66 2023-02-10 https://github.com/tidyverse/dplyr/issues/6712
#> 67 2023-02-01 https://github.com/tidyverse/dplyr/issues/6676
#> 68 2023-01-26 https://github.com/tidyverse/dplyr/issues/6663
#> 69 2023-01-26 https://github.com/tidyverse/dplyr/issues/6662
#> 70 2023-01-25 https://github.com/tidyverse/dplyr/issues/6660
#> 71 2022-11-30 https://github.com/tidyverse/dplyr/issues/6580
#> 72 2022-11-08 https://github.com/tidyverse/dplyr/issues/6532
#> 73 2022-10-11 https://github.com/tidyverse/dplyr/issues/6497
#> 74 2022-09-01 https://github.com/tidyverse/dplyr/issues/6446
#> 75 2022-08-30 https://github.com/tidyverse/dplyr/issues/6435
#> 76 2022-02-01 https://github.com/tidyverse/dplyr/issues/6170
#> 77 2021-09-17 https://github.com/tidyverse/dplyr/issues/6022
#> 78 2020-10-26 https://github.com/tidyverse/dplyr/issues/5573
#> 79 2020-06-01 https://github.com/tidyverse/dplyr/issues/5290
#> 80 2019-12-13 https://github.com/tidyverse/dplyr/issues/4663
#> 81 2018-12-17 https://github.com/tidyverse/dplyr/issues/4028
```
