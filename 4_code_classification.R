# Classification of remote sensing data via RStoolbox

#set working directory
setwd("~/Documents/lab")

library(raster)

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpeg")

plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")

# Classification

# 1. Get values
singlenr <- getValues(so)
singlenr

# 2. kmeans
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3. Set values to a raster on the basis of so
soclass <- setValues(so[[1]], kcluster$cluster) # assign new values to a raster object

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)

# class 1: highest energy level
# class 2: medium energy level
# class 3: lowest energy level

frequencies <- freq(soclass)
tot = 2221440
percentages =  frequencies * 100 / tot

# class 1: highest energy level: 21.2%
# class 2: medium energy level: 41.4%
# class 3: lowest energy level: 37.3%

# Grand Canyon Exercise
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpeg")
gc

#faccio il plot dell' immagine
plotRGB(gc, 1, 2, 3, stretch="lin")
# rosso = 1
# verde = 2
# blu = 3

# cropping the image to make it lighter
gcc <- crop(gc, drawExtent())
gcc

plotRGB(gcc, 1, 2, 3, stretch="lin")

ncell(gc)
ncell(gcc) #mi da il numero di pixel dell'immagine

# Classification

# 1. Get values
singlenr <- getValues(gcc) # catturo tutti i valori della mia immagine tramite questa funzione generale(getValues), mi da una lista di tutti i valori possibili all' interno dell'immagine
singlenr

# 2. Classify
kcluster <- kmeans(singlenr, centers = 3)# faccio 3 classi per 3 elementi diversi nell'immagine
kcluster

# 3. Set values to a raster image, it assiociate back the values of the 3 different classes to the respective pixel
gcclass <- setValues(gcc[[1]], kcluster$cluster) # assign new values to a raster object

#let's plot it
plot(gcclass)

# let's make an example of what the different classes could represent:
# Class 1 (white): volcanic rocks
# Class 2 (yellow): sandstone
# Class 3 (green): conglomerates

# Calculating the frequencies of the different classes
frequencies <- freq(gcclass)
frequencies # How many pixel i have in each class
# we can transform the value in a percentage to make it more understandable
total <- ncell(gcclass)
percentages <- frequencies *100/total
percentages# i have 25% volcanic rocks, 38% sandstone, 35% conglomerates
