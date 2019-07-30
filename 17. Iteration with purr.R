library(tidyverse)
#################################### For Loops ######################################
df <- tibble(
  a = rnorm(10), # The Normal Distribution
  b = rnorm(10), 
  c = rnorm(10), 
  d = rnorm(10) 
)

# instead of
median(df$a)
median(df$b)
median(df$c)
median(df$d)
# we can do
output <- vector("double", ncol(df))
for (i in seq_along(df)){
  output[[i]] <- median(df[[i]])
}
output
c(1, 7:9)
seq_along(df)

# exercise 1
mtcars
mean_per_col <- vector("double", ncol(mtcars))
for (i in seq_along(mtcars)){
  mean_per_col[[i]] <- mean(mtcars[[i]])
}
mean_per_col
test = c(10, 20, 30, 40)
test[1]
test[[1]]
# exercise 2
nycflights13::flights
type_per_col <- vector("character", ncol(nycflights13::flights))
for (i in seq_along(nycflights13::flights)){
  type_per_col[[i]] <- class(nycflights13::flights[[i]])
}
class(nycflights13::flights[[1]])
# why fail?
# exercise 3
uniq_per_col <- vector("double", ncol(iris))
for (i in seq_along(iris)){
  uniq_per_col[[i]] <- length(unique(iris[[i]]))
}
uniq_per_col

