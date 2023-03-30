# R code for importing and analyzing several images

library(raster)

# Set working directory
setwd("~/Documents/lab/greenland")

# importing files
lst_2000 <- raster("lst_2000.tif")# like that we imported just an images combosed by just one layer
plot(lst_2000)

# Exercise: import all the data
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")# this is a long way of doing it, faster ways exists 

ls() #it makes a list of every object present

rlist <- list.files(pattern="lst")# it can make a list of all 4 imagesmin my folder with the pattern "lst" in the name

import <- lapply(rlist,raster)# like that i can import the 4 images in my rlist
import
