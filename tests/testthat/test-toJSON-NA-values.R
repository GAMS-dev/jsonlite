test_that("Test NA values", {
  options(stringsAsFactors = FALSE)
  x <- list(foo = c(TRUE, NA, FALSE, TRUE), bar = c(3.14, NA, 42, NA), zoo = c(NA, "bla", "boe", NA))
  x$mydf <- data.frame(col1 = c(FALSE, NA, NA, TRUE), col2 = c(1.23, NA, 23, NA))
  x$mydf$mylist <- list(c(TRUE, NA, FALSE, NA), NA, c("blabla", NA), c(NA, 12, 13, NA, NA, NA, 1001))

  expect_true(validate(toJSON(x)))
  expect_equal(fromJSON(toJSON(x)), x)
  expect_equal(fromJSON(toJSON(x, na = "null")), x)
})
