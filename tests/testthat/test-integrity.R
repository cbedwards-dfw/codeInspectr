

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

test_that("github_to_repo_address validates inputs", {

  expect_error(github_to_repo_address(2))
  expect_error(github_to_repo_address(letters[1:3]))

  #nonexistent repo
  expect_error(github_to_repo_address("FRAMverse/doesnotexist"))

  # works for real repo, correct inputs:
  expect_no_error(github_to_repo_address("FRAMverse/framrsquared"))
})


test_that("github_to_repo_address works correctly, trims urls", {
  expect_equal("FRAMverse/framrsquared",
               github_to_repo_address("FRAMverse/framrsquared"))
  expect_equal("FRAMverse/framrsquared",
               github_to_repo_address("https://github.com/FRAMverse/framrsquared/"))
  expect_equal("FRAMverse/framrsquared",
               github_to_repo_address("www.github.com/FRAMverse/framrsquared/"))
})
