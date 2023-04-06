library(tidyverse)
library(dplyr)
library(readr)
library(raster)
library(sf)
library(tmap)
library(stringr)
library(RColorBrewer)

# Import Files ------------------------------------------------------------
plant <- read_csv(url("https://raw.githubusercontent.com/ucbvjki/BENV0093-Indonesia-Solar/main/Data/Plant%20Data.csv"))
boundary0 <- read_sf(dsn = "Data/Shapefiles/idn_admbnda_adm0_bps_20200401.shp", layer = "SHAPEFILE")
  
  
boundary1 <-


# Clean Data --------------------------------------------------------------
##Create coordinates
