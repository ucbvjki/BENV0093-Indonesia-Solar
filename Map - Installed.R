library(tidyverse)
library(dplyr)
library(ggsn)
library(ggspatial)
library(readr)
library(raster)
library(sf)
library(stringr)
library(RColorBrewer)

plant <- read_csv(url("https://raw.githubusercontent.com/ucbvjki/BENV0093-Indonesia-Solar/main/Data/Plant%20Data.csv"))
boundary <- read_sf("Data/indonesia-province.json")
boundary1 <- st_read("Data/Shapefiles/idn_admbnda_adm1_bps_20200401.shp")


##Lower resolution of boundary shapefile

r_template <- rast(resolution = 0.05, 
                   xmin = 94, ymin = -11, xmax = 142, ymax= 7, crs = st_crs())


point_sf = st_as_sf(plant, coords=c("longitude", "latitude" ))
st_crs(point_sf) =4326
plot(point_sf$geometry)

ggplot() + 
  geom_sf(data = boundary) +
  geom_sf(data = point_sf, aes(color = type, size = capacity_mw, shape = status)) +
  coord_sf() +
  north(data = boundary, scale = 0.3) +
  annotation_scale()



# Old Tmap Code -----------------------------------------------------------
library(tmap)
tmap_mode("plot")

tm_shape(boundary) + tm_fill() + 
  tm_shape(point_sf) + tm_symbols(shape = 'status',
                                  col = 'type',
                                  size = 'capacity_mw', scale = 4) +
  tm_layout(legend.outside = TRUE,
            legend.outside.position = "right",
            legend.title.size = 1.2, legend.text.size = 0.8) +
  tm_scale_bar(position = c("LEFT", "BOTTOM")) + tm_compass()
