test_that("get_session_list works", {

  # Make sure it doesn't error on valid use
  expect_no_error(get_session_list())
})

test_that("get_master_list works", {

  # Make sure it doesn't error on valid use
  expect_no_error(get_master_list(id = "1983"))
})

test_that("get_master_list_raw works", {

  # Make sure it doesn't error on valid use
  expect_no_error(get_master_list_raw(id = "1983"))
})

test_that("get_bill works", {

  # Make sure it doesn't error on valid use
  expect_no_error(get_bill("1633691"))
})

test_that("get_session_people works", {

  # Make sure it doesn't error on valid use
  expect_no_error(get_session_people("1983"))
})