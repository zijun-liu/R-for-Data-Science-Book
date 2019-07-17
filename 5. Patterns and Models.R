##################################### Patterns and Models ##############################################
library(tidyverse)

help(faithful)
summary(faithful)
ggplot(data = faithful) +
  geom_point(mapping = aes(x = eruptions, y = waiting))

library(modelr)

mod <- lm(log(price) ~ log(carat), data = diamonds)

diamonds2 <- diamonds %>% 
  add_residuals(mod) %>% # add_residuals adds a single new column, .resid, to the input data.
  mutate(resid = exp(resid))

ggplot(data = diamonds2) +
  geom_point(mapping = aes(x = carat, y = resid))

diamonds3 <- diamonds %>% 
  add_residuals(mod)

# omit data = and mapping = 
ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_freqpoly(binwidth = 0.25)

ggplot(faithful, aes(eruptions)) +
  geom_freqpoly(binwidth = 0.25)

# concatenate pipline with plot
diamonds %>% 
  count(cut, clarity)

diamonds %>% 
  count(cut, clarity) %>% 
  ggplot(aes(clarity, cut, fill = n)) +
  geom_tile()

######## chapter 6: workflow projects #########
getwd()
