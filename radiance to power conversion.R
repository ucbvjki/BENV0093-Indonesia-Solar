library(tidyverse)
library(raster)

ghi_idw <- raster("Criteria/Interpolated/ghi_idw.tiff")
capacity_kwh <- ghi_idw * 365 * 0.6 * 0.175 ##365 to convert daily values to yearly

writeRaster(capacity_kwh, "capacity_kwh.tiff", format = "GTIFF", overwrite = TRUE)


#convert GHI kWh to Joules
kwh_idn <- raster("Criteria/Indonesia_GISdata_LTAy_AvgDailyTotals_GlobalSolarAtlas-v2_GEOTIFF/GHI.tif")
plot(kwh_idn)

#Conversion rate: 1kWh = 36,000,000 J
joules_idn <- kwh_idn * 36000000 #joules per square meter of Indonesia
plot(joules_idn) #plots for kwh_idn and joules_idn should look the same but different scale
  
#Conversion to capacity function (per square meter)
ghi_to_capacity <- function(ghi_kwh, A = 1, y = 0.175, pr = 0.6){
  capacity_kwh <- ghi_kwh * 36000000 * A * y * pr
  return(capacity_kWh)
}

##y = panel efficiency / yield parameter (%)
##pr = performance ratio of overall system (%)

farm_capacity <- 


