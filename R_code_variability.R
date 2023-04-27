# How to measure landscape variability with R

# Loading the required packages
library(raster) # or require()
library(patchwork)
library(ggplot2)

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
