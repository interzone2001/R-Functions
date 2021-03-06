ximr <- function(x,n=NULL) {
   # N. Radziwill, 1/5/2017: nicole.radziwill@gmail.com
   # This function creates X-MR (also called I-MR)
   # control charts from a vector x that contains
   # quantitative (variables) data, with a moving
   # range window of n (default n=2)
      require(qcc)
      q1 <- 0; q2 <- 0
      if (is.null(n)) { n <- 2 }
      lhs <- x[1:(length(x)-(n-1))]; rhs <- x[n:length(x)]
      x.mr <- as.matrix(cbind(lhs,rhs))
      mr.bar <- mean(abs((rhs-lhs)))
      xi <- qcc(x,    type="xbar.one")
      mr <- qcc(x.mr, type="R")
      dev.off()
      return(list(xi=xi,mr=mr,mr.bar=mr.bar))
}
