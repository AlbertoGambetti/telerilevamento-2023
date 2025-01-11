# R code for species distribution modelling

# Species Distribution Modelling

# install.packages("sdm")
# install.packages("rgdal", dependencies=T)

library(sdm)
library(raster) # predictors
library(rgdal) # species

file <- system.file("external/species.shp", package="sdm")
file

species <- shapefile(file)
species # the occurence is if a species is present = 1 or absent = 0

plot(species, pch=19)# we have a plot with all the absent or present species.

# lets make a plot of jut the present species
presences <- species[species$Occurrence == 1, ] # we now just have the presences that are just 94
presences
plot(presences, col="blue", pch=19)

# lets make a plot of jut the absences
absences <- species[species$Occurrence == 0, ] # we now just have the presences that are just 94
absences
plot(absences, col="red", pch=19)

# plotting togheter the presence and the abscences
plot(presences, col="blue", pch=19)
points(absences, col="red", pch=19)

# predictors: look at the path
path <- system.file("external", package="sdm")
path

#lets import all the predictors togheter
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T)
lst

# stack
preds <- stack(lst) # lets put togheter all the predictors
preds # the predictors are: elevation, precipitation, temperature, vegetation 
plot(preds) # plotting the 4 predictors

# plot preds using a custom color palette
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

# plotting the elevetion with on top the presences of the species
plot(preds$elevation, col=cl)
points(presences, pch=19)# we can observe that this species doesn't love high altitudes but it prefer low altitudes 

# plotting the temperature with on top the presences of the species
plot(preds$temperature, col=cl)
points(presences, pch=19)# we can observe that this species doesn't love low temperatures

# plotting the precipitation with on top the presences of the species
plot(preds$precipitation, col=cl)
points(presences, pch=19)# we can observe that this species likes high humidity

# plotting the vegetation with on top the presences of the species
plot(preds$vegetation, col=cl)
points(presences, pch=19)# this species search protection in the vegetation cover


# with the predictors and the presence or absence of species we can make a model to predict if a species could be present in an area

# model
# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)

# model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl) # we just made a map that predicts the presence of the specie in analisys
points(presences, pch=19)
# the blue zones are where there is a low probability of presence of the specie

# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)# we have plottet togheter the 4 predictors and the final prediction map

# changing the name of the prediction map
names(s1[[5]]) <- c('model')
plot(s1, col=cl)
