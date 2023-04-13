# Classification of remote sensing data via RStoolbox

#set working directory
setwd("~/Documents/lab")

library(raster)

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpeg")

plotRGB(so, 1, 2, 3, stretch="lin")
