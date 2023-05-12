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
sc # the size of the image is 28311808 pixels

plot(sc)

# with the raster package -> RasterLayer

# transforming the file in a dataframe
scd <- as.data.frame(sc, xy=T)
head(scd)

#ggplot graph
ggplot()+
geom_raster(scd, mapping=aes(x=x, y=y, fill=Surface.Soil.Moisture))+
ggtitle("Soil Moisture from copernicus")

# Cropping an image
ext <- c(20,35,62,68)# the first 2 values are the min and the max values of the x coordinates, the last 2 values arethe min and the max values of the y coordinates
sc.crop <- crop(sc, ext)# making a crop of the sc image, with the extension "ext" just defined before
plot(sc.crop)

# transforming the cropped file in a dataframe
sc.crop.d <- as.data.frame(sc.crop, xy=T)
head(sc.crop.d) #to see the values of the firs 6 
names(sc.crop.d) # to see the name of the variables

#ggplot of the cropped image
ggplot()+
geom_raster(sc.crop.d, mapping=aes(x=x, y=y, fill=Surface.Soil.Moisture))+
ggtitle("Soil Moisture from copernicus")+
scale_fill_viridis(option="cividis")
