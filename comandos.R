?getwd
(WD <- getwd())
if (!is.null(WD)) setwd(WD)

?mean
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim=0.10))

?sd
sd(1:2)^2

?sum
sum(1:5)
sum(1, 2, 3, 4, 5)
sum(1:2, 3:5)

?seq
seq(17)
seq(0, 1, length.out = 11)
seq(stats::rnorm(22))
seq(22)
seq(1, 9, by = pi)
