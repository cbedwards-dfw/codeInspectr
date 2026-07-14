test_that("parse_name: basics work", {
  expect_error(parse_name(repo_name = "FRAMverse/codeInspectr"))
  expect_error(parse_name())

  expect_equal(parse_name(full_name = "FRAMverse/codeInspectr"),
               "FRAMverse/codeInspectr")

  expect_equal(parse_name(entity_name = "FRAMverse", repo_name = "codeInspectr"),
               "FRAMverse/codeInspectr")

}
)


test_that("parse_name: slash counting works", {
  expect_error(parse_name("FRAMverse_codeInspectr"),
               regexp = "0")
  expect_error(parse_name("FRAMverse/code/Inspectr"),
               regexp = "2")
  expect_error(parse_name(entity_name = "FRAMverse",
                          repo_name = "code/Inspectr"),
               regexp = "2")

  expect_no_error(parse_name("FRAMverse/codeInspectr"))

}
)
