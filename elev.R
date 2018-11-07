library(dplyr)
elev_data <- read.delim("uw-elevations.csv.bz2") %>% mutate(elevation = ifelse(elevation < 5.5, NA, elevation))

library(ggplot2)
ggplot(elev_data, aes(lon, lat, fill=elevation)) + geom_tile() + coord_quickmap() + scale_fill_gradientn(colors=terrain.colors(10), na.value="steelblue3")
dev.copy(png, "uw-elevation.png")
dev.off()