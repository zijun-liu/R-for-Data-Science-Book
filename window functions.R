# https://cran.r-project.org/web/packages/dplyr/vignettes/window-functions.html

# A window function is a variation on an aggregation function. Where an aggregation function, 
# like sum() and mean(), takes n inputs and return a single value, a window function returns n values. 
# The output of a window function depends on all its input values, so window functions don’t include 
# functions that work element-wise, like + or round(). Window functions include variations on aggregate 
# functions, like cumsum() and cummean(), functions for ranking and ordering, like rank(), and functions
# for taking offsets, like lead() and lag().


# What are the top 5 sepal lengths based on the species?
library(dplyr)
mydata2 <-iris %>% 
  select(Species,Sepal.Length) %>%
  group_by(Species) %>%
  filter(min_rank(desc(Sepal.Length))<=5)
# To answer this question, we can simply use one of the rank functions
# called ‘min_rank()’ from dplyr and call it directly inside the ‘filter()’ function

names(iris)
iris$Sepal.Length

?min_rank()


# Types of window functions:
#   Ranking and ordering functions: row_number(), min_rank (RANK in SQL), dense_rank(), 
# cume_dist(), percent_rank(), and ntile(). These functions all take a vector to order by, 
# and return various types of ranks.

# Examples of R ranking fcns:
x <- c(5, 1, 3, 2, 2, NA)
row_number(x)
min_rank(x)
dense_rank(x)
percent_rank(x)
cume_dist(x)