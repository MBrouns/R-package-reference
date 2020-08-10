logger <- logging::getLogger('fibo.fibo')

#' Calculates the nth fibonacci number
#'
#' @param n
#'
#' @return the nth fibonacci number
#'
#' @expose
#' @examples
#' fibo(6)
#'
#' fibo(5) == fibo(4) + fibo(3)
fibo <- function(n) {
  logger$info('calculating fibo(%d)', n)
  if (n == 1 || n == 2) {
    return(1)
  }
  return(fibo(n-1) + fibo(n-2))
}
