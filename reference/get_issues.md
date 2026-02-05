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
#>                                                                                                        body
#> 1      Use `testthat::skip_if_not()` to skip tests when the test databases are not available. This packa...
#> 2       Yi was experiencing issues with a preseason chinook database when running plot_stock_mortality_t...
#> 3      Request from @sthurner11. The following is a script used by coho modelers to transfer ocean optio...
#> 4      Try custom filtering to commercial WA net -- end up with a 2x2 grid, but the "timesteps" axis sho...
#> 5      currently compare_database() assumes run_ids match between the two databases. add optional argume...
#> 6                                    Right now the assignment of stock groups is using a LUT for coho only.
#> 7      During preseason we copy the ocean options into our NOF runs using 'merge ocean option' R code --...
#> 8                             Includes fisheries like central OR Troll and Sport, So Calif Troll and Sport.
#> 9                                                                                                          
#> 10     For chinook, warn if making any changes to the fisheries that are overwritten by the TAMM tami ta...
#> 11     The fishery scalers table can be misleading to look at -- we might have values for MSF scalers bu...
#> 12     Currently `modify_table()` cannot replace character strings (and likely can't match them) without...
#> 13     Currently copy_fishery_scalers uses an "Update" call. This can give screwy behavior when the numb...
#> 14                                                                                         As appropriate. 
#> 15     - Would be very useful to be able to zero out individual fishery (or fisheries) programmatically....
#> 16                                          The fishery_ids used in `filter_commercial_wa_nt()` are wrong. 
#> 17     Working with @sthurner11 on making the VS Input Template from the final run this year. The final ...
#> 18                   Tool to help us identify other-target fisheries that are impacting a stock of concern.
#> 19     Currently we can layer filters to look at the intersection of filters (filter_wa() |> filter_net(...
#> 20     Failing to pick up changes in inputs where the flag has changed  e.g. a fishery input with a scal...
#> 21     Many of the treaty fisheries have harvests that are based on terminal run size. When we change ot...
#> 22                                                                  Add function to calculate ERs directly.
#> 23     I was trying to use the compare functions on a transfer file with two runs in it, and most of the...
#> 24 @cbedwards-dfw \r\n\r\nIt'd be a good idea to have stock filtering as well as the fishery filtering f...
#> 25     From conversation with @Ty-WDFW on 12/13/24. Add `describe_data()` functionality. Goal is to be a...
#> 26     Derek has an excel-based tool that uses some complex logic and pivot tables to summarize mortalit...
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
get_issues("tidyverse/dplyr")
#>                                                                                                                title
#> 1                                                              no error or warning on incorrect usage of `between()`
#> 2                                                                   dplyr verbs remove attributes of classed columns
#> 3                                                   Stop exporting `data_frame()` and `as_data_frame()` from tibble?
#> 4                                           Across gives unclear error when function returns incorrect length output
#> 5                                   slice_sample does not restrict sampling to n() within a group when replace=TRUE.
#> 6                                                                                       Deprecate `sql_*` and `db_*`
#> 7                                                            Using related columns in `cur_column()` with `across()`
#> 8                                         count function needs guard rails that name shouldn't be an existing column
#> 9                                                                                 Add `bounds` to `dplyr::between()`
#> 10                                    `between()` doesn't work if `x` is `Date` and `left` and `right` are character
#> 11                                                                                    Make `add_tally()` S3 generic?
#> 12                                                                                   Internal error in `summarise()`
#> 13                                                    `across(.names =)` evaluates `"{col}"` as if it was `"{.col}"`
#> 14                                                                      `tbl_vars()` accesses `nrow()` unnecessarily
#> 15                                                       mutate() doesn't seem to signal warning conditions properly
#> 16                                                            reframe with across returns an unhelpful error message
#> 17                                                                `Mutating joins` relationship documentation issues
#> 18                                                                                                   `count(.by = )`
#> 19                                                      Show methods implemented by loaded packages more prominently
#> 20                                               filter should warn or prevent users from using named logical inputs
#> 21                                                                            dplyr::cur_column don't support dtplyr
#> 22                                                                                          Join list of data frames
#> 23                                                                            across(), but over two sets of vector 
#> 24                                                                                               Split `join_cols()`
#> 25                                          `dplyr_reconstruct` can create data.table with corrupted secondary index
#> 26                                                 Should `desc()` use `vec_rank()` internally on character vectors?
#> 27                                                                                       `rowwise()` and empty input
#> 28                 FR: allow `pick()` to rename in `distinct()` + some thoughts about `arrange()` allowing renaming.
#> 29                                                  Weird behavior with bind_rows(), mutate(), and ggeffects package
#> 30                                                                          In `select` `!` and `-` work differently
#> 31                                        Variable scoping issue with .data inside lambda Ffunction used in across()
#> 32                                                                   c_across() docs imply a dependency on rowwise()
#> 33                                      `summarise()` and `reframe()` turns warnings from inside functions as errors
#> 34                                                          Clarity of "duplicated" error message in `rename_with()`
#> 35                                         Internal: slightly inaccurate `as_join_by()` implementation for character
#> 36                                               Request non-equal join: closest() supports dual-sided inequality <>
#> 37                                                                         Add `tidypolars` to the list of backends?
#> 38                                                                   perfromance slowdown using across within mutate
#> 39                                                                  arrange not reporting syntax errors on .by_group
#> 40              A better data masking indirection example in the `programming.Rmd` vignette: `filter(df, {{ var }})`
#> 41                                                   Feature Request: In across, have function for `.names` argument
#> 42                                                           Feature request: allow additional predicates in join_by
#> 43                                Emphasize that filter(x, A, B) is not strictly the same as filter(filter(x, A), B)
#> 44                              `lifecycle::last_lifecycle_warnings()` seems incompatible with dplyr warning handler
#> 45                                                                    condition handling ignores locally set options
#> 46 `Error in vapply(.x, .f, .mold, ..., USE.NAMES = FALSE)`: cli_warn together with dplyr grouping results in error.
#> 47                                     When `.unpack = TRUE`, `.names` should delay its column name uniqueness check
#> 48                                                                                             bug in `dplyr::near`?
#> 49                                                                                               FR: `rows_clean()`?
#> 50                                            dplyr::across inappropriately rewrites dollar indexes my function code
#> 51                                                           Unexpected interaction between rowwise and group_modify
#> 52                                                    `mutate` superseding `transmute` should allow ordering columns
#> 53                                                              Possible regression re. use of glue in dplyr::across
#> 54                                                                          Consider allowing `.env$` in `join_by()`
#> 55                     How to adjust to different behavior of across .fn argument passing in dplyr 1.1.1 vs. 1.0.10?
#> 56                                                                  `count()` and `add_count()` could be much faster
#> 57                                                                                  Reconsider re-exports from rlang
#> 58                                                                 `filter(across())` warning isn't always triggered
#> 59                                                            `slice_max()` is quite slow for a big number of groups
#> 60                                                                          Can we improve on this `across()` error?
#> 61                                                     `bind_rows()` on a list of data.tables creates corrupt output
#> 62                                     Consider `.sort = FALSE` for `summarise()`, `reframe()`, and `slice_sample()`
#> 63                          `slice()` and `slice_head/tail/min/max()` should act like a `filter()` not a `reframe()`
#> 64                                       `mutate(.by_row =)`, `reframe(.by_row =)`, and possibly `filter(.by_row =)`
#> 65                                                        Make `Joining with` message clickable to copy-to-clipboard
#> 66                                                                               Alternative `summarise()` groupings
#> 67                                                                                            `nest_join()` upgrades
#> 68                                                               Should joins have `.before` and `.after` arguments?
#> 69                                                                                Add `merge` indicator after a join
#> 70                                         `dplyr::group_by_prepare()` does not work with lazy tables and `across()`
#> 71                                              Add argument `na_matches = c("na", "never")` to `rows_*()` functions
#> 72                                                                         Remove lazy eval fallbacks (>= Sept 2023)
#> 73                                                                                Add dplyr_sticky_cols() or similar
#> 74                                                                                  Move database generics to dbplyr
#> 75                                                                     Better way to handle name collisions in joins
#>                                                                                                                body
#> 1              The main title of the function reads "Detect where values fall in a specified range" which, if yo...
#> 2          Hi, \n\nThis issue is based on https://github.com/tidyverse/dplyr/issues/7630, which was closed.\n\nT...
#> 3              they were deprecated in tibble 2.0, (2019) and create a bit of noise in the autocomplete. Removin...
#> 4              In the example below, the function gives a 2-length result for a 1-length input. (My real case to...
#> 5              I've been playing around with slice_sample on grouped data frames for bootstrapping. The document...
#> 6              The next version of dbplyr will no longer need them (https://github.com/tidyverse/dbplyr/pull/165...
#> 7           Hello!\nI would like to write code with dplyr + across. for this:\n\nWhere x = x_1 + x_2, y = y_1 + ...
#> 8              If you use the count function and set name to be one of the existing columns you are tabulating o...
#> 9          The docs of `between()` say:\n\n   `This is a shortcut for x >= left & x <= right`\n\nIt would be nic...
#> 10         The docs of `between()` say:\n\n> This is a shortcut for `x >= left & x <= right`\n\nHowever, `betwee...
#> 11          `count()`, `add_count()`, and `tally()` are generics but `add_tally()` is not:\n\n``` r\nsloop::is_s...
#> 12       ``` r\nlibrary(dplyr)\n\npenguins |>\n  summarize(\n    .by = species,\n    across(everything(), identi...
#> 13        It doesn't seem to be the expected behavior according to the documentation.\n\n``` r\ncol <- "foo"\n\n...
#> 14             This currently affects joins with `library(duckplyr)` . I can work around, perhaps we find a nice...
#> 15           `mutate()` doesn't seem to signal named warning conditions for calling handlers to pick up.\n\nExam...
#> 16             When I call `reframe` with `across` and the length of the output is not consistent, the error mes...
#> 17        `Mutate-joins (dplyr)` documentation says:\n\n```\nrelationship\n\nHandling of the expected relationsh...
#> 18             I accidentally used the syntax below, and wonder if this should be the default recommended one, o...
#> 19           Example: if dbplyr is loaded, `?mutate` would contain a link to `?dbplyr::mutate.tbl_lazy` .\n\nPre...
#> 20            Currently dplyr warns users who accidentally use `=` instead of `==`. \nHowever, this does not occ...
#> 21           Please run these codes, and it will yeild an error message.\n```\na <- data.frame(x1 =c(0, 1), x2 =...
#> 22             I have encounter with the necessity of joining several tibbles, which i have nested in a list. Th...
#> 23             Sometimes, when doing data wrangling, you need to apply functions not only on multiple columns, b...
#> 24             Currently, `join_cols()` is called by `join_filter()` but is doing too much. The `$out` component...
#> 25     ## Problem\r\n\r\nThanks @AMDraghici for your suggestions!\r\n\r\nFor example, in `bind_rows`, if the fir...
#> 26         See https://github.com/tidyverse/dplyr/issues/7044\r\n\r\nIn particular, note that `arrange(df, x)` w...
#> 27             Should we guarantee that the functions used in a rowwise `mutate()` or `summarize()` or `reframe(...
#> 28         This would be useful in packages to avoid cran warnings as `pick()` is the new preferred way.\r\n\r\n...
#> 29             This is kind of a weird niche problem. The mutate function is interacting strangely with the ggef...
#> 30             I'm not sure if this is intended behaviour but it came up in a recent training session and wasn't...
#> 31       Hello,\r\n\r\nThis error was driving me crazy and took me a while to isolate it. \r\nif one wants to us...
#> 32             I find the docs for `c_across()` imply the requirement for a `rowwise()` call which isn't require...
#> 33             Please briefly describe your problem and what output you expect. If you have a question, please d...
#> 34         Hi,  \r\n\r\nWhen using `rename_with()` and ending with duplicated column names, the error message te...
#> 35         ``` r\r\nwaldo::compare(dplyr:::as_join_by("a"), dplyr::join_by(a == a))\r\n#> `old$exprs[[1]]`: `"a"...
#> 36             For example, I now have the following Table 1 and Table 2. I want to find a `value2` from both si...
#> 37             Hello, I've been working on [`tidypolars`](https://tidypolars.etiennebacher.com/) for a few month...
#> 38         I believe this is an unexplored performance issue, seemingly relating to dplyr::expand_across\r\n\r\n...
#> 39         Hello,\r\n\r\nWhen using `arrange` on grouped data (and wanting to respect the grouping), we need to ...
#> 40     This code does not work:\r\n```r\r\nf <- function(df, var) filter(df, {{ var }})\r\nf(mtcars, am)\r\n# Er...
#> 41             One common thing that I want to do in the `dplyr` workflow is take a set of variables, apply some...
#> 42       `join_by` refuses to handle any predicates it doesn't recognize:\r\n\r\n```\r\nExpressions must use one...
#> 43       Have had to re-confirm this for myself a few times:\r\n\r\n```r\r\nfilter(mtcars, cyl < max(cyl), hp < ...
#> 44       i.e. it tells you to run the lifecycle function, but there is no warning there:\r\n\r\n``` r\r\nlibrary...
#> 45     Maybe because of a delayed evaluation issue ?\r\n\r\n``` r\r\nbugged <- function() {\r\n  withr::local_op...
#> 46         Hi,\r\n\r\nit took me a while to get to this (very artificial) reduced example, but I managed to get ...
#> 47         Extracted from https://github.com/tidyverse/dplyr/issues/6933\r\n\r\nSometimes the function you apply...
#> 48       Is the following example a bug in `near`?\r\n```r\r\n> near(1.1 * 100 * 10^200, 110 * 10^200)\r\n[1] FA...
#> 49             Do we want to add a function that clears all rows to the `rows_*()` family? For data frames, this...
#> 50             I was getting a weird error inside the `mutate(across(...))` (see reprex), and by closely reading...
#> 51             It appears that after an application of `rowwise` the behavior of `group_modify` differs from tha...
#> 52             I recently noticed that `transmute` has been marked as superseded by `mutate(.keep="none")`. Howe...
#> 53         This is discussed in https://twitter.com/mjskay/status/1660770865087148032\r\n\r\nEssentially, users ...
#> 54       Motivated by https://github.com/tidyverse/dplyr/issues/6821\r\n\r\n``` r\r\nlibrary(dplyr, warn.conflic...
#> 55             I have a summarizing function that's similar to the function below. It allows the user to pass gr...
#> 56             Right now these eventually just do `summarise(n = n())` or `mutate(n = n())` at some point, but t...
#> 57             Can we start to un-export any of these https://github.com/tidyverse/dplyr/blob/main/R/utils-tidy-...
#> 58             Between 1.0.7 and 1.1.0 `filter()` stopped taking matrices, per #5973. [NEWS for dplyr 1.0.8](htt...
#> 59             It has gotten better after installing the dev version of dplyr (before a lot of time was wasted i...
#> 60 ``` r\r\nlibrary(dplyr)\r\n\r\ndf <- tibble(x = 1:2, y = 3:4)\r\n\r\nfn <- function(col) {\r\n  stop("oh no")...
#> 61           \r\nwhen using bind_rows on a list of data.tables with keys, with either map_dfr or a do.call, the ...
#> 62             With the introduction of `.by`, we no longer sort group keys automatically. There are a whole hos...
#> 63             Note that this `filter()` call keeps the groups of `x` separated. i.e.  the groups of `2` and `1`...
#> 64         Related to https://github.com/tidyverse/dplyr/issues/4723\r\n\r\nWith the introduction of `.by`, it s...
#> 65         Hi,\r\n\r\ndplyr 1.1.0 seems like it is going to be great (I installed the dev version with `pak::[pa...
#> 66         Related to\r\nhttps://github.com/tidyverse/dplyr/issues/14\r\nhttps://github.com/tidyverse/dplyr/issu...
#> 67             In some recent exploration of `nest_join()`, I've decided that it is lacking some features that w...
#> 68                                                                                              To match `mutate()`
#> 69             A prior iteration of this request was [closed and locked as old](https://github.com/tidyverse/dpl...
#> 70     ``` r\r\nlibrary(dplyr, warn.conflicts = FALSE)\r\nlibrary(rlang)\r\ndf <- mtcars\r\ndt <- dtplyr::lazy_d...
#> 71             Like the `*_join()` functions the `rows_*()` functions should get an argument `na_matches = c("na...
#> 72             They shouldn't be needed anymore, and they make the error messages unnecessarily confusing. (Have...
#> 73             So that when you implement a tibble subclass with sticky columns, you don't need to add a new `se...
#> 74             Deprecate database generics, following strategy in https://github.com/tidyverse/design/issues/106...
#> 75             Currently, non-join columns available in both tables are given suffixes `.x` and `.y` . Occasiona...
#>          date                                           link
#> 1  2026-01-17 https://github.com/tidyverse/dplyr/issues/7792
#> 2  2026-01-04 https://github.com/tidyverse/dplyr/issues/7787
#> 3  2025-12-22 https://github.com/tidyverse/dplyr/issues/7786
#> 4  2025-12-21 https://github.com/tidyverse/dplyr/issues/7785
#> 5  2025-12-10 https://github.com/tidyverse/dplyr/issues/7781
#> 6  2025-12-02 https://github.com/tidyverse/dplyr/issues/7779
#> 7  2025-11-21 https://github.com/tidyverse/dplyr/issues/7774
#> 8  2025-11-20 https://github.com/tidyverse/dplyr/issues/7773
#> 9  2025-09-18 https://github.com/tidyverse/dplyr/issues/7712
#> 10 2025-07-20 https://github.com/tidyverse/dplyr/issues/7702
#> 11 2025-06-18 https://github.com/tidyverse/dplyr/issues/7695
#> 12 2025-06-09 https://github.com/tidyverse/dplyr/issues/7693
#> 13 2025-06-09 https://github.com/tidyverse/dplyr/issues/7692
#> 14 2025-03-09 https://github.com/tidyverse/dplyr/issues/7668
#> 15 2025-02-20 https://github.com/tidyverse/dplyr/issues/7663
#> 16 2025-02-12 https://github.com/tidyverse/dplyr/issues/7657
#> 17 2025-01-06 https://github.com/tidyverse/dplyr/issues/7622
#> 18 2024-12-18 https://github.com/tidyverse/dplyr/issues/7112
#> 19 2024-11-21 https://github.com/tidyverse/dplyr/issues/7106
#> 20 2024-11-21 https://github.com/tidyverse/dplyr/issues/7105
#> 21 2024-11-08 https://github.com/tidyverse/dplyr/issues/7102
#> 22 2024-09-07 https://github.com/tidyverse/dplyr/issues/7083
#> 23 2024-07-17 https://github.com/tidyverse/dplyr/issues/7056
#> 24 2024-07-10 https://github.com/tidyverse/dplyr/issues/7050
#> 25 2024-07-03 https://github.com/tidyverse/dplyr/issues/7048
#> 26 2024-06-26 https://github.com/tidyverse/dplyr/issues/7045
#> 27 2024-06-12 https://github.com/tidyverse/dplyr/issues/7039
#> 28 2024-05-18 https://github.com/tidyverse/dplyr/issues/7028
#> 29 2024-05-06 https://github.com/tidyverse/dplyr/issues/7019
#> 30 2024-04-29 https://github.com/tidyverse/dplyr/issues/7017
#> 31 2024-04-20 https://github.com/tidyverse/dplyr/issues/7016
#> 32 2024-04-20 https://github.com/tidyverse/dplyr/issues/7015
#> 33 2024-04-02 https://github.com/tidyverse/dplyr/issues/7008
#> 34 2024-03-28 https://github.com/tidyverse/dplyr/issues/7006
#> 35 2024-03-08 https://github.com/tidyverse/dplyr/issues/7001
#> 36 2024-02-21 https://github.com/tidyverse/dplyr/issues/6992
#> 37 2024-02-14 https://github.com/tidyverse/dplyr/issues/6991
#> 38 2024-01-18 https://github.com/tidyverse/dplyr/issues/6985
#> 39 2024-01-08 https://github.com/tidyverse/dplyr/issues/6980
#> 40 2023-12-28 https://github.com/tidyverse/dplyr/issues/6978
#> 41 2023-11-30 https://github.com/tidyverse/dplyr/issues/6972
#> 42 2023-11-23 https://github.com/tidyverse/dplyr/issues/6970
#> 43 2023-11-20 https://github.com/tidyverse/dplyr/issues/6968
#> 44 2023-11-03 https://github.com/tidyverse/dplyr/issues/6952
#> 45 2023-10-25 https://github.com/tidyverse/dplyr/issues/6943
#> 46 2023-10-10 https://github.com/tidyverse/dplyr/issues/6939
#> 47 2023-10-02 https://github.com/tidyverse/dplyr/issues/6934
#> 48 2023-08-31 https://github.com/tidyverse/dplyr/issues/6921
#> 49 2023-08-20 https://github.com/tidyverse/dplyr/issues/6915
#> 50 2023-07-24 https://github.com/tidyverse/dplyr/issues/6892
#> 51 2023-06-24 https://github.com/tidyverse/dplyr/issues/6870
#> 52 2023-05-30 https://github.com/tidyverse/dplyr/issues/6861
#> 53 2023-05-23 https://github.com/tidyverse/dplyr/issues/6853
#> 54 2023-04-13 https://github.com/tidyverse/dplyr/issues/6822
#> 55 2023-03-27 https://github.com/tidyverse/dplyr/issues/6809
#> 56 2023-03-23 https://github.com/tidyverse/dplyr/issues/6806
#> 57 2023-03-21 https://github.com/tidyverse/dplyr/issues/6802
#> 58 2023-03-20 https://github.com/tidyverse/dplyr/issues/6795
#> 59 2023-03-08 https://github.com/tidyverse/dplyr/issues/6783
#> 60 2023-02-10 https://github.com/tidyverse/dplyr/issues/6712
#> 61 2023-02-01 https://github.com/tidyverse/dplyr/issues/6676
#> 62 2023-01-26 https://github.com/tidyverse/dplyr/issues/6663
#> 63 2023-01-26 https://github.com/tidyverse/dplyr/issues/6662
#> 64 2023-01-25 https://github.com/tidyverse/dplyr/issues/6660
#> 65 2022-11-30 https://github.com/tidyverse/dplyr/issues/6580
#> 66 2022-11-08 https://github.com/tidyverse/dplyr/issues/6532
#> 67 2022-10-11 https://github.com/tidyverse/dplyr/issues/6497
#> 68 2022-09-01 https://github.com/tidyverse/dplyr/issues/6446
#> 69 2022-08-30 https://github.com/tidyverse/dplyr/issues/6435
#> 70 2022-02-01 https://github.com/tidyverse/dplyr/issues/6170
#> 71 2021-09-17 https://github.com/tidyverse/dplyr/issues/6022
#> 72 2020-10-26 https://github.com/tidyverse/dplyr/issues/5573
#> 73 2020-06-01 https://github.com/tidyverse/dplyr/issues/5290
#> 74 2019-12-13 https://github.com/tidyverse/dplyr/issues/4663
#> 75 2018-12-17 https://github.com/tidyverse/dplyr/issues/4028
```
