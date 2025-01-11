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

# lapply function (lista, funzione)
import <- lapply(rlist,raster)# like that i can import the 4 images in my rlist
import

# importa immagini tutti insieme
TGr <- stack(import)
TGr
plot(TGr)

# RGB di alcuni dati - 
plotRGB(TGr, 1, 2, 3, stretch="Lin")  # temperatura più alta nel 2000: rosso; 2005: verde; 2010: blu
# temperatura più alta nella terza immagine perchè più blu
plotRGB(TGr, 2, 3, 4, stretch="Lin") # temperatura più alta nel 2005: rosso; 2010: verde; 2015: blu
plotRGB(TGr, 4, 3, 2, stretch="Lin") # temperatura più alta nel 2015: rosso; 2010: verde; 2005: blu

# differenza 
dift <- TGr[[2]] - TGr[[1]]
plot(dift)

# cambio legenda dei colori 
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl) #

#----- exercise 2: european NO2

library(raster)

# Set working directory
setwd("~/Documents/lab/EN")

#importing a single file
en_first <- raster("EN_0001.png")
en_first

cl <- colorRampPalette(c("blue", "light blue", "pink", "red"))(100)
plot(en_first, cl)

#importing all files
rlist <- list.files(pattern="EN")
rlist

import <- lapply(rlist,raster)
import

EN <- stack(import)
EN

#plotting all 13 files
plot(EN, col=cl)

#check 1
par(mfrow=c(1,2))
plot(en_first, col=cl)
plot(EN[[1]], col=cl)
dev.off()

#check 2
difcheck <- en_first - EN[[1]]
difcheck
plot(difcheck)

#first and last data
par(mfrow=c(1,2))
plot(EN[[1]], col=cl)
plot(EN[[13]], col=cl)
dev.off()

difen = EN[[1]]-EN[[13]]
cldif <- colorRampPalette(c("blue","white","red"))(100)
plot(difen, col = cldif)

#plotRGB
plotRGB(EN, r=1, g=7, b=13, stretch="lin") #plotting of the values of max CO2 levels in 3 months in color red green and blue
plotRGB(EN, r=1, g=7, b=13, stretch="hist")
