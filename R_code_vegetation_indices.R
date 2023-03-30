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
dvi1992 = l1992[[1]]-l1992[[2]]
dvi1992
# la riflettanza in ogni banda va da un valore di 0 ad un valore max di 255
# il massimo di 255 è dato dal fatto che l'immagine che utilliziamo è ad 8 bit quindi un numero di valori possibili di 256 perchè 2^8=256à
# il DVI ha un gange di valori che va dal -255 al 255

# Plotting DVI of 1992
cl1992<- colorRampPalette(c("darkblue","yellow","red","black")) (100)
plot(dvi1992, col=cl1992)

#---- importing the most recent image defor2_.png
l2006 <- brick("defor2_.png")
#plot
plotRGB(l2006, 1, 2, 3, stretch="Lin")

#exercise: plot the image from 1992 ontop of that of 2006
par(mfrow=c(2,1))
plotRGB(l1992, 1, 2, 3, stretch="lin")
plotRGB(l2006, 1, 2, 3, stretch="Lin")
dev.off()

#let's put the images in a row
par(mfrow=c(1,2))
plotRGB(l1992, 1, 2, 3, stretch="lin")
plotRGB(l2006, 1, 2, 3, stretch="Lin")
dev.off()

# Exercise: calculate DVI for 2006
dvi2006 = l2006[[1]]-l2006[[2]]
dvi2006

cl2006<- colorRampPalette(c("darkblue","yellow","red","black")) (100)
plot(dvi2006, col=cl2006)# in the yellow areas the vegetation has been detroyed, its used for agricolture

# Multitemporal analisis
difdvi = dvi1992 - dvi2006# lets calculate a multitemporal DVI between the 1992 and the 2006 images

cld<- colorRampPalette(c("blue","white","red")) (100)
plot(difdvi, col=cld)#the red areas indicate the destruction of the forest

# NDVI serve per normalizzare il DVI da -1 a 1, questo mi oermette di fare confronti tra le immagini ad 8 bit e quelle a 16 bit
# più l'NDVI è alto più indica un buono stato di salute delle piante, più è basso più indica un cattivo stato di salute










