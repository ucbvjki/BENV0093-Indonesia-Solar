library(raster)
library(gstat)
library(terra)
library(sf)


#Import Rasters
boundary <- read_sf("Data/Shapefiles/idn_admbnda_adm0_bps_20200401.shp")
ghi <- raster("Criteria/Indonesia_GISdata_LTAy_AvgDailyTotals_GlobalSolarAtlas-v2_GEOTIFF/GHI.tif")
temp <- raster("Criteria/Indonesia_GISdata_LTAy_AvgDailyTotals_GlobalSolarAtlas-v2_GEOTIFF/TEMP.tif")
elevation <- raster("Criteria/elevation_idn.tiff")
slope <- raster("Criteria/slope_idn.tiff")
aspect <- raster("Criteria/aspect_idn.tiff")


rast_template = rast(resolution = 0.02,
                     xmin = 94, ymin = -12, xmax = 142, ymax = 7,  crs = st_crs(boundary)$wkt)

raster_template <- raster(rast_template)

#Resample
ghi_resampled <- resample(ghi, raster_template, method = "bilinear")
temp_resampled <- resample(temp, raster_template, method = "bilinear")
elevation_resampled <- resample(elevation, raster_template, method = "ngb")
slope_resampled <- resample(slope, raster_template, method = "ngb")
aspect_resampled <- resample(aspect, raster_template, method = "ngb")


#Export 
writeRaster(ghi_resampled, "Criteria/Interpolated/ghi_idw.tiff", format = "GTiff")
writeRaster(temp_resampled, "Criteria/Interpolated/temp_idw.tiff", format = "GTiff")
writeRaster(elevation_resampled, "Criteria/Interpolated/elevation_idw.tiff", format = "GTiff")
writeRaster(slope_resampled, "Criteria/Interpolated/slope_idw.tiff", format = "GTiff")
writeRaster(aspect_resampled, "Criteria/Interpolated/aspect_idw.tiff", format = "GTiff")


