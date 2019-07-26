################################## Getting Started ###########################################
library(tidyverse)

# read_csv()
# read_csv2() # semi-colon separated files
# read_tsv()
# read_delim()
# read_fwf() # fixed-width files
# read_log() # Apache style log files

read_csv("data/heights.csv")

read_csv("a, b, c
         1, 2, 3
         4, 5, 6")

#skip lines
read_csv("The first line of metadata
         The second line of metadata
         x, y, x
         1, 2, 3", skip = 2)
read_csv("# a comment I want to skip
         a, b, c
         1, 2, 3", comment = "#")
# add column names
read_csv("1, 2, 3\n4, 5, 6", col_names = c("x", "y", "z"))

# specify how missing value is represented in your file
read_csv("a, b, c\n1, 2,.", na = ".")

################################## Parsing a vector #########################################
parse_integer(c("1", "231", ".", "456"), na = ".")

x <- parse_integer(c("1", "231", "abc", "456.123"))
problems(x)

parse_double("1,23", locale = locale(decimal_mark = ","))
parse_number("$100.45")

fruit <- c("apple", "banana")
parse_factor(c("apple", "banana", "banana"), levels = fruit)

parse_datetime("2010-10-01T2010")
parse_datetime("20101001")
parse_time("01:10 am")
parse_time("20:10:01")
parse_date("07/19/19", "%m/%d/%y")
parse_date("1 janvier 2019", "%d %B %Y", locale = locale("fr"))
##################################   Parsing a file  #########################################
guess_parser("2010-10-01")
challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)

?tribble
?type_convert

################################## Writing to a file #########################################
write_csv(challenge, "chanllenge.csv")
# type info is lost when you save to csv, which makes it a little unreliable for caching interim results
# alternatives
write_rds()
read_rds
install.packages("feather")
library(feather)

write_feather(challenge, "challenge.feather")
read_feather("challenge.feather")
# feather tends to be faster than RDS and is usable outside of R.

################################## Other types of data #######################################

# haven: SPSS, State and SAS
# readxl: xls, xlsx
# DBI: run SQL