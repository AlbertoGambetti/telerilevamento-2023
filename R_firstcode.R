# My first code in github
# let's install the raster package

install.packages("raster")

library(raster)
# Settaggio cartella di lavoro
#setwd("~/lab/") # Linux
setwd("~/Documents/lab") #mac
# setwd("C:/lab/") # windows

# import
l2011 <- brick("p224r63_2011_masked.grd")
l2011

# plot
plot(l2011)

# https://www.r-graph-gallery.com/42-colors-names.html
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)

#exercise: change the color gamut for all the images
cles <- colorRampPalette(c("blue", "violet", "aquamarine")) (100) #100 è il numero delle sfumature 
plot(l2011, col=cles)

#exercise: plot the NIR band
# Landsat ETM+
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR
cl<- colorRampPalette(c("yellow", "orange", "red")) (100) #100 è il numero delle sfumature 
plot(l2011[[4]], col=cl)
plot(l2011$B4_sre, col=cl)

dev.off() # it closes graphs

# export graphs in R
pdf("myfirstgraph.pdf")
plot(l2011[[4]], col=cl)
dev.off()

#creo un multi frame con la funzione mf, voglio 2 righe una del colore rosso ed una degli infrarossi impilate lungo un unica clonna
#plotting several bands in a multiframe
par(mfrow=c(2,1))
plot(l2011[[3]], col=cl)
plot(l2011[[4]], col=cl)

dev.off()

#plotting the first 4 layers
par(mfrow=c(2,2))

#blue
clb<- colorRampPalette(c("blue4", "blue2", "lightblue")) (100)
plot(l2011[[1]], col=clb)

#green
clg<- colorRampPalette(c("chartreuse4", "chartreuse2", "chartreuse")) (100)
plot(l2011[[2]], col=clg)

#red
clr<- colorRampPalette(c("red4", "red2", "red")) (100)
plot(l2011[[3]], col=clr)

#NIR
cln<- colorRampPalette(c("darkblue", "darkorchid2", "darkorchid")) (100)
plot(l2011[[4]], col=cln)

dev.off()

# RGB plotting
plotRGB(l2011, r=3, g=2, b=1, stretch="lin") #lultimo parametro stretch serve oer allargare la gamma dei valori visualizzati
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")# ho assegnato la banda 4 degli infrarossi alla componente red.
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")# ho assegnato la banda 4 degli infrarossi alla componente green.
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")

#multiframe with natural and false colours
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")

par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="hist")
plotRGB(l2011, r=4, g=3, b=2, stretch="hist")







