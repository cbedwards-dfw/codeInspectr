## Fake Github search API: every day in the window has `per_day` matching
## items, so tests can exercise pagination and window splitting offline.
fake_search_page <- function(per_day = 3){
  function(endpoint, q, page){
    dates <- regmatches(q, regexpr("[0-9-]{10}\\.\\.[0-9-]{10}", q))
    range <- as.Date(strsplit(dates, "..", fixed = TRUE)[[1]])
    n_days <- as.numeric(range[2] - range[1]) + 1
    total <- n_days * per_day
    idx <- seq_len(total)
    idx <- idx[idx > (page - 1) * 100 & idx <= min(page * 100, 1000)]
    is_repo <- endpoint == "repositories"
    is_pr <- grepl("is:pr", q)
    items <- lapply(idx, \(i){
      if(is_repo){
        list(full_name = paste0("owner/new", i), description = NULL, private = TRUE,
             fork = FALSE, created_at = paste0(range[1], "T00:00:00Z"),
             html_url = paste0("https://github.com/owner/new", i))
      } else {
        list(repository_url = paste0("https://api.github.com/repos/owner/repo", i %% 2),
             number = i, title = paste("item", i), user = list(login = "someone"),
             state_reason = if(is_pr) NULL else "completed",
             created_at = paste0(range[1], "T00:00:00Z"),
             closed_at = paste0(range[2], "T00:00:00Z"),
             pull_request = if(is_pr) list(merged_at = NULL) else NULL,
             html_url = paste0("https://github.com/owner/repo/issues/", i))
      }
    })
    list(total_count = total, items = items)
  }
}


test_that("search_github paginates and splits windows over 1,000 results", {
  local_mocked_bindings(search_page = fake_search_page(per_day = 150))
  ## 10 days * 150 = 1,500 results: needs splitting into two 750-result windows
  items <- search_github("issues", "user:owner is:issue", "closed",
                         as.Date("2026-01-01"), as.Date("2026-01-10"))
  expect_length(items, 1500)
})

test_that("search_github handles empty results", {
  local_mocked_bindings(search_page = function(endpoint, q, page) list(total_count = 0, items = list()))
  expect_length(search_github("issues", "q", "closed", as.Date("2026-01-01"), as.Date("2026-01-02")), 0)
  expect_equal(nrow(parse_issue_items(list(), "issues_closed")), 0)
  expect_equal(nrow(parse_repo_items(list())), 0)
})

test_that("summarize_github_activity counts each activity type", {
  local_mocked_bindings(search_page = fake_search_page(per_day = 3),
                        owner_qualifier = function(owner) paste0("user:", owner))
  res <- summarize_github_activity("owner", since = "2026-01-01", until = "2026-01-02",
                                   verbose = FALSE)
  total <- res$totals[res$totals$owner == "TOTAL", ]
  expect_equal(total$issues_closed, 6L)
  expect_equal(total$prs_opened, 6L)
  expect_equal(total$prs_merged, 6L)
  expect_equal(total$repos_created, 6L)
  expect_equal(sort(res$by_repo$repo), c("owner/repo0", "owner/repo1"))
  expect_equal(sum(res$by_repo$issues_closed), 6L)
  expect_true(all(res$items$state_reason[res$items$activity == "issues_closed"] == "completed"))
})

test_that("summarize_github_activity reports zeros when nothing happened", {
  local_mocked_bindings(search_page = function(endpoint, q, page) list(total_count = 0, items = list()),
                        owner_qualifier = function(owner) paste0("org:", owner))
  res <- summarize_github_activity(c("a", "b"), since = "2026-01-01", verbose = FALSE)
  expect_equal(res$totals$owner, c("a", "b", "TOTAL"))
  expect_true(all(res$totals$issues_closed == 0L))
  expect_equal(nrow(res$by_repo), 0)
})

test_that("summarize_github_activity rejects bad windows", {
  expect_error(summarize_github_activity("a", since = "2026-02-01", until = "2026-01-01"))
})

test_that("search_page sends the request to the search endpoint", {
  captured <- NULL
  local_mocked_bindings(search_pause = function(...) invisible())
  local_mocked_bindings(gh = function(...) { captured <<- list(...); list(total_count = 0, items = list()) },
                        .package = "gh")
  search_page("issues", "user:owner is:issue", page = 2)
  expect_equal(captured[[1]], "GET /search/{search_type}")
  expect_equal(captured$search_type, "issues")
  expect_equal(captured$page, 2)
  ## must not pass a named `endpoint`, which would override gh()'s own argument
  expect_false("endpoint" %in% names(captured))
})

test_that("search_github gives a clear error on a non-search response", {
  local_mocked_bindings(search_page = function(endpoint, q, page) list(list(id = 1)))
  expect_error(search_github("issues", "q", "closed", as.Date("2026-01-01"), as.Date("2026-01-02")),
               "total_count")
})

test_that("owners with PRs but no issues (and vice versa) get zeros, not errors", {
  issues_only_none <- function(endpoint, q, page){
    if(grepl("is:issue", q)) return(list(total_count = 0, items = list()))
    fake_search_page(per_day = 1)(endpoint, q, page)
  }
  local_mocked_bindings(search_page = issues_only_none,
                        owner_qualifier = function(owner) paste0("user:", owner))
  res <- summarize_github_activity("owner", since = "2026-01-01", until = "2026-01-02",
                                   verbose = FALSE)
  expect_true(all(res$by_repo$issues_closed == 0L))
  expect_equal(sum(res$by_repo$prs_opened), 2L)

  prs_none <- function(endpoint, q, page){
    if(grepl("is:pr", q) || endpoint == "repositories") return(list(total_count = 0, items = list()))
    fake_search_page(per_day = 1)(endpoint, q, page)
  }
  local_mocked_bindings(search_page = prs_none)
  res <- summarize_github_activity("owner", since = "2026-01-01", until = "2026-01-02",
                                   verbose = FALSE)
  expect_true(all(res$by_repo$prs_opened == 0L))
  expect_true(all(res$by_repo$prs_merged == 0L))
  expect_equal(res$totals$repos_created, c(0L, 0L))
})

