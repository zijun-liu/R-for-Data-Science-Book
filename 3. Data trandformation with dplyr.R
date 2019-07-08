install.packages("tidyverse")
install.packages(c("nycfligts13", "gapminder", "Lahman"))

library(tidyverse)
library(nycflights13)
library(gapminder)
library(Lahman)

flights
names(flights)

##################### Grouped Summaries with summarize() #############################

flights$dep_delay
mean(flights$dep_delay, na.rm = T)

summarize(flights, delay = mean(dep_delay, na.rm = T))

# average delay per date
by_day = group_by(flights, year, month, day)
summarize(by_day, delay = mean(dep_delay, na.rm = T))

##################### Combining multiple operations with Pipe ########################

by_dest <- group_by(flights, dest)
delay <- summarize(by_dest, 
                   count = n(),
                   dist = mean(distance, na.rm = T),
                   delay = mean(arr_delay, na.rm = T))
delay
delay <- filter(delay, count > 20, dest != "HNL")
delay

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

# frustrating code as we need to name each intermediate df, though we don't care
# with pipe, %>%
delays <- flights %>%
  group_by(dest) %>%
  summarize(count = n(),
            dist = mean(distance, na.rm = T),
            delay = mean(arr_delay, na.rm = T)
            ) %>% 
  filter(count > 20, dest != "HNL")

not_cancelled

batting <- as_tibble(Lahman::Batting)
batters <- batting %>%
  group_by(playerID) %>%
  summarize(
    ba = sum(H, na.rm = TRUE) /sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )

batters %>%
  filter(ab>100) %>%
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point()+
  geom_smooth(se = FALSE)

batters %>%
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point()+
  geom_smooth(se = FALSE)

batters %>%
  arrange(desc(ba))

?summarize

?x[1]

not_cancelled

flights %>%
  group_by(carrier) %>%
  count(flight)
