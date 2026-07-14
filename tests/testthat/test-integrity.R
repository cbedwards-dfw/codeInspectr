

test_that("validate_filepath works, handles multiple entries", {
  temp1 <- tempfile()
  temp2 <- tempfile()
  temp3 <- tempfile()

  expect_error(validate_filepath(temp1),
               regexp = "`temp1` must exist")

  file.create(temp1)
  withr::defer(unlink(temp1))

  expect_no_error(validate_filepath(temp1))

  expect_error(validate_filepath(c(temp1, temp2)),
               "is not a valid filepath")

  expect_error(validate_filepath(c(temp1, temp2, temp3)),
               "are not valid filepaths")

  file.create(temp2)
  withr::defer(unlink(temp2))

  expect_no_error(validate_filepath(c(temp1, temp2)))


})
