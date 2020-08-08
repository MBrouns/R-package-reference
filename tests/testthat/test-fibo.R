test_that("fibo 1 is 1", {
  expect_equal(fibo(1), 1)
})

test_that("fibo 2 is 1", {
  expect_equal(fibo(2), 1)
})


test_that("fibo n is fibo(n-1) + fibo(n-2)", {
  expect_equal(fibo(12), fibo(11) + fibo(10))
  expect_equal(fibo(8), fibo(7) + fibo(6))
})
