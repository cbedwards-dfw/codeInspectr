test_that("multiplication works", {

  expect_true(is_r_package("FRAMverse/framrsquared"))
  expect_false(is_r_package("FRAMverse/snippets"))
  expect_error(is_r_package("FRAMverse/thisdoesnotexist"))
})
