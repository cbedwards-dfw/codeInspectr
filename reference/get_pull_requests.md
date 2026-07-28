# Return summary of open Github Pull Requests

Including title, initial text of body, and date

## Usage

``` r
get_pull_requests(repo_address, max_char = 97)
```

## Arguments

- repo_address:

  Github repository address, of the form "user/repository", as in
  `"FRAMverse/framrsquared"`. Does not need to be an R package.

- max_char:

  Maximum number of characters to return in the "body" column.

## Value

dataframe with `$title`, `$body`, and `$date` of open pull requests.

## Examples

``` r
get_pull_requests("FRAMverse/framrsquared")
#>                                                                    title
#> 1                                                        Add/nr/checking
#> 2                              Added proper string handling to modify_db
#> 3                                                 Added 'zero_fishery()'
#> 4 added two functions for comparing preseason and postseason mortalitie…
#> 5                                    refactored to support transfer runs
#> 6                                                        Add/sensitivity
#>                                                                                                       body
#> 1 Added the following functions to help identify problems with non-retention modeling:\r\n\r\n- `check_...
#> 2     Addressing #103. modify_table() writes a sql query based on the conditions / replacement values l...
#> 3     Addressing #99. Adds `zero_fishery()` which 0s out the quota, scaler, and MSF versions of the sam...
#> 4     `create_mort_comparison()` takes a focal year and focal stock and a preseason and postseason data...
#> 5 Addressing #68. \r\n\r\nChanged `compare_*` functions to use framrosetta to obtain stock and fishery ...
#> 6                                        Linear scaling of potential inputs for sensitivity analyses. #38 
#>         date                                               link
#> 1 2025-11-24 https://github.com/FRAMverse/framrsquared/pull/111
#> 2 2025-10-29 https://github.com/FRAMverse/framrsquared/pull/104
#> 3 2025-10-23 https://github.com/FRAMverse/framrsquared/pull/102
#> 4 2025-01-22  https://github.com/FRAMverse/framrsquared/pull/70
#> 5 2025-01-07  https://github.com/FRAMverse/framrsquared/pull/69
#> 6 2024-11-04  https://github.com/FRAMverse/framrsquared/pull/43
get_pull_requests("tidyverse/dplyr")
#>                                                                                    title
#> 1 Enhance README documentation with comprehensive examples and improved user guidance.md
#> 2                                                                       Update copy-to.R
#> 3                                      Fix #7773 and #7785: Improve count() and across()
#> 4                                                         Use dev roxygen2 + doc listing
#> 5                              add examples for `if_any()`/`if_all()` to `filter()` docs
#> 6                                            Add ellipsis to `tally()` and `add_tally()`
#> 7                                                  Prototype of webr on the landing page
#> 8                              chore: update readme to use `.by` instead of `group_by()`
#>                                                                                                         body
#> 1     ## Summary\r\nThis PR enhances the dplyr README documentation with comprehensive examples, improved...
#> 2 Fix issue where copy argument in join can be anything and code will run.\r\n\r\nlibrary(tidyverse)\r\ns...
#> 3                                                                                                           
#> 4     * Re-run with dev roxygen2 (lots of diffs due to consist link generation)\r\n* Switch to using `doc...
#> 5                                                                                              Closes #7816 
#> 6      - [x] Revert to original state to address reviewer feedback\n- [x] Move dots checking from method ...
#> 7     - [ ] Could we add some kind of Plausible integration?\r\n- [ ] Fonts are hardcoded to `font-family...
#> 8       Please feel free to reject this if you prefer to keep as-is. Just thought the upcoming release mi...
#>         date                                         link
#> 1 2026-07-25 https://github.com/tidyverse/dplyr/pull/7850
#> 2 2026-06-25 https://github.com/tidyverse/dplyr/pull/7847
#> 3 2026-05-13 https://github.com/tidyverse/dplyr/pull/7835
#> 4 2026-04-06 https://github.com/tidyverse/dplyr/pull/7829
#> 5 2026-03-09 https://github.com/tidyverse/dplyr/pull/7817
#> 6 2026-02-21 https://github.com/tidyverse/dplyr/pull/7813
#> 7 2026-02-09 https://github.com/tidyverse/dplyr/pull/7807
#> 8 2026-02-04 https://github.com/tidyverse/dplyr/pull/7803
```
