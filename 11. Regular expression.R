# practice: regexp
library(stringr)
library(tidyverse)

############################## basics ##################################
dot <- "\\."
dot
writeLines(dot)

test <- "\\"
writeLines(test)

test <- "a\\b"
writeLines(test)

?str_view

str_view(test, "\\\\")

x <- c("apple", "banana", "pear")
str_view(x, "^a")
str_view(x, "a$")

str_view(fruit, "(..)\\1", match = TRUE)

############################# tools ####################################
x <- c("apple", "banana", "pear")
str_detect(x, "e")

# how many common words start w/ "t"?
sum(str_detect(words, "^t"))

# what proportion of common words end w/ a vowel?
mean(str_detect(words, "[aeiou]$"))
