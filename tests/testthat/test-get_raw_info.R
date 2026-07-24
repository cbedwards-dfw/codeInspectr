test_that("parse_name: basics work", {
  expect_error(parse_name(repo_name = "FRAMverse/framrsquared"))
  expect_error(parse_name())

  expect_equal(parse_name(repo_address = "FRAMverse/framrsquared"),
               "FRAMverse/framrsquared")

  expect_equal(parse_name(entity_name = "FRAMverse", repo_name = "framrsquared"),
               "FRAMverse/framrsquared")

}
)


test_that("parse_name: slash counting works", {
  expect_error(parse_name("FRAMverse_framrsquared"))
  expect_error(parse_name("FRAMverse/fram/rsquared"))
  expect_error(parse_name(entity_name = "FRAMverse",
                          repo_name = "fram/rsquared"),
               regexp = "2")

  expect_no_error(parse_name("FRAMverse/framrsquared"))

}
)
