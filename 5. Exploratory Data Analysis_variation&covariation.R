################################### Variation #################################################

# variation: within a variable.
# covariation: between variables. Covariabtion is the tendency for the values of 
# two or more variables to vary together in a related way.

library(tidyverse)

data <- diamonds
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

diamonds %>%
  count(cut)

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

diamonds %>% 
  count(cut_width(carat, 0.5))

# zoom in
smaller <- diamonds %>% 
  filter(carat<3)
ggplot(data = smaller) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.1)

# overlay multiple histograms with geom_freqpoly
ggplot(data = smaller, mapping = aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1)

ggplot(data = smaller) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.01)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

faithful
ggplot(data = faithful) +
  geom_histogram(mapping = aes(x = eruptions))

# zoom in to see unusual values
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x =y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>% 
  filter(y<3 |y>20) %>% 
  arrange(y)
unusual

diamonds
ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 20) +
  coord_cartesian(xlim = c(0, 2500))

diamonds %>% 
  count(carat = 0.99 )

diamonds %>% 
  count(carat = 1 )

diamonds(diamonds$carat = 0.99)

data %>% 
  filter(carat==0.99|carat==1)%>% 
  count(carat)

# missing values
temp <- nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time)
  )

################################### Covariation #################################################
# a categorical and continuous variable
ggplot(diamonds) +
  geom_freqpoly(mapping = aes(x = price, color = cut))

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut))


names(diamonds)

??..density..

ggplot(
  data = diamonds, mapping = aes(x = price, y = ..density..)
  ) + 
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

## boxplot
ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x = cut, y = price))
## reorder()
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = class, y = hwy))
# reorder class based on the median value of hwy
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = (reorder(class, hwy, FUN = median)), y = hwy)) +
  coord_flip()


# install.packages("ggstance")
# library(ggstance)
# ggstance: Horizontal 'ggplot2' Components

# install.packages("lvplot")
# library(lvplot)
# ??lvplot

## two categorical variables

ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

diamonds %>% 
   count(color, cut) %>% 
   ggplot(mapping = aes(x = color, y = cut)) +
   geom_tile(mapping = aes(fill = n))
 
## two continuous variables
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price), 
             alpha = 1/100)

ggplot(data = diamonds) +
  geom_bin2d(mapping = aes(x = carat, y = price))

# install.packages("hexbin")
ggplot(data = diamonds) +
  geom_hex(mapping = aes(x = carat, y = price))

# Another option is to bin one continuous variable so it acts like a categorical variable.
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1), varwidth = TRUE))

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_number(carat, 20)))
