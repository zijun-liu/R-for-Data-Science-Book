install.packages(c("ggmap", "maps", "mapdata"))

library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

vignette("maps")
usa <- map_data("usa")
dim(usa)
head(usa)
tail(usa)

w2hr <- map_data("world2Hires")
plot(usa)
ggplot(data = usa) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3)
# Here is no fill, with a red line. Remember, fixed value of aesthetics go outside the aes function.
ggplot(data = usa) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group), fill = NA, color = "red") +
  coord_fixed(1.3)
ggl <- ggplot(data = usa) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group), fill = "violet", color = "blue") +
  coord_fixed(1.3)
# adding points (two labs) to the map
labs <- data.frame(
  long = c(-122.064873, -122.306417),
  lat = c(36.951968, 47.644855),
  names = c("SWFSC-FED", "NWFSC"),
  stringasFactors = FALSE
)
ggl+
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 5) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 4)

# see how important the group aesthetic is
ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat), fill = "violet", color = "blue") + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 5) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 4) +
  coord_fixed(1.3)

# state maps
states <- map_data("state")
dim(states)
head(states)
tail(states)

ggplot()+
  geom_polygon(data = states, aes(x = long, y = lat, group = group, fill = region), color = "white") +
  coord_fixed(1.3) +
  guides(fill = FALSE) # leave off the color legend

west_coast <- subset(states, region %in% c("california", "oregon", "washington"))
ggplot(data = west_coast) +
  geom_polygon(aes(x = long, y = lat, group = group), fill = "palegreen", color = "black") +
  coord_fixed(1.3)

# zoom in California and look at counties
ca_df <- subset(states, region == "california")
head(ca_df)

counties <- map_data("county")
ca_county <- subset(counties, region %in% "california")
head(ca_county)
ca_base <- ggplot(data = ca_df, aes(x = long, y = lat, group = group))+
  geom_polygon(color = "black", fill = "gray")+
  coord_fixed(1.3)
ca_base + theme_nothing()

ca_base + theme_nothing() +
  geom_polygon(data = ca_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA) # draw the state border
