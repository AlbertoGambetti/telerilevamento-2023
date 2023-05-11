#R code for downloading and visualizing Copernicus data

#install.packages("ncdf4")
library(ncdf4)
library(raster)
library(ggplot2)
library(viridis)

# Setting the working directory for macOS
setwd("~/Documents/lab")

# dataset: c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc

#importing data
sc <- raster("c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc")
plot(sc)
