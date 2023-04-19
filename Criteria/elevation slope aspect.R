library(raster)
library(terra)
library(tidyverse)

rast_template = rast(
  resolution = 0.05,
  xmin = 94,
  ymin = -11,
  xmax = 142,
  ymax = 7
)

rast_template <- raster(rast_template)

crs(rast_template) <- 4326


# Elevation ---------------------------------------------------------------

#Load elevation raster from DIVA
elevation_ras <- raster("Criteria/IDN_elevation/IDN_msk_alt.vrt")
res()

#Extract slope and aspect
slope <- terrain(elevation_ras, "slope", unit = "degrees")
aspect <- terrain(elevation_ras, "aspect", unit = "degrees")

#Export 
writeRaster(elevation_ras, "elevation_idn.tiff", format = "GTiff")
writeRaster(slope, "slope_idn.tiff", format = "GTiff")
writeRaster(aspect, "aspect_idn.tiff", format = "GTiff")

#Check plot
plot(elevation_ras)
plot(slope)





