# How to measure landscape variability with R

# Loading the required packages
library(raster) # or require()
#install.packages("patchwork")
library(patchwork)
library(ggplot2)
#install.packages("viridis")
library(viridis)

# Setting the working directory for macOS
setwd("~/Documents/lab")

# Importing the file
sen <- brick("sentinel.jpg")

# Plotting the image
# 1 = NIR, 2 = red, 3 = green
plotRGB(sen, 1, 2, 3, stretch="lin")
plotRGB(sen, 2, 1, 3, stretch="lin")

# Standard deviation on the NIR band
nir <- sen[[1]]
mean3 <- focal(nir, matrix(1/9, 3, 3), fun=mean) # calculating the mean value

sd3 <- focal(nir,matrix(1/9, 3, 3), fun=sd) # calculating standard deviation
plot(sd3)

sd3d <- as.data.frame(sd3, xy=TRUE) # we need it to be a dataframe
sd3d

ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))+ # lets set the aestetic of the plot, y correspond to y in the image, x correspond to x,  these values are contained in the layer
ggtitle("standard deviation moving window 3x3")

# Using the Viridis package for different color palette
ggplot()+
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))+ # lets set the aestetic of the plot, y correspond to y in the image, x correspond to x,  these values are contained in the layer
ggtitle("standard deviation moving window 3x3")+
scale_fill_viridis()

ggplot()+
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))+ # lets set the aestetic of the plot, y correspond to y in the image, x correspond to x,  these values are contained in the layer
ggtitle("standard deviation moving window 3x3")+
scale_fill_viridis(option="cividis")
 
ggplot()+
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))+ # lets set the aestetic of the plot, y correspond to y in the image, x correspond to x,  these values are contained in the layer
ggtitle("standard deviation moving window 3x3")+
scale_fill_viridis(option="magma")

#patcwork, plotting multiple images in a single image
p1 <- ggplot()+
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))+ # lets set the aestetic of the plot, y correspond to y in the image, x correspond to x,  these values are contained in the layer
ggtitle("standard deviation moving window 3x3")+
scale_fill_viridis(option="cividis")

 
p2 <- ggplot()+
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))+ # lets set the aestetic of the plot, y correspond to y in the image, x correspond to x,  these values are contained in the layer
ggtitle("standard deviation moving window 3x3")+
scale_fill_viridis(option="magma")

p1+p2

# Exercise: plot the original image (nir) and its standard deviation
nird <- as.data.frame(nir, xy = T)

p3 <- ggplot() +
  geom_raster(nird,
              mapping = aes(x = x, y = y, fill = sentinel_1)) +
  scale_fill_viridis(option = "cividis") +
  ggtitle("NIR via the cividis colour scale")

p3

p3 + p1
