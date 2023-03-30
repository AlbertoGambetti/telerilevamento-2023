#install.packages("raster")

library(raster)
# Settaggio cartella di lavoro
setwd("~/Documents/lab") #mac

#import defor1_.png
l1992 <- brick("defor1_.png")
l2011

# plot
plot(l1992)

# Exercize: plot the image plotRGB
plotRGB(l1992, 1, 2, 3, stretch="lin")

# What ia NIR
# NIR = 1
# Red = 2
# Green = 3


# quando si scarica un immagine già esportata in questo caso dalla nasa l'infrarosso viene assegnato alla banda 1
# plotRGB(l1992, r=4, g=3, r=2, stretch="lin")
# export: 1, 2, 3

# Exercise: calculate DVI for 1992
dvi1992 <- l1992[[1]]-l1992[[2]]
dvi1992
# la riflettanza in ogni banda va da un valore di 0 ad un valore max di 255
# il massimo di 255 è dato dal fatto che l'immagine che utilliziamo è ad 8 bit quindi un numero di valori possibili di 256 perchè 2^8=256à
# il DVI ha un gange di valori che va dal -255 al 255

# Plotting DVI of 1992
cl1992<- colorRampPalette(c("darkblue","yellow","red","black")) (100)
plot(dvi1992, col=cl1992)

# Exercise: calculate DVI for 2006
dvi2006 <- l2006[[1]]-l2006[[2]]
dvi2006

cl2006<- colorRampPalette(c("darkblue","yellow","red","black")) (100)
plot(dvi2006, col=cl1992)

#import defor2_.png
l2006 <- brick("defor2_.png")
#plot
plotRGB(l2006, 1, 2, 3, stretch="Lin")

