# Studio sulla deforestazione di foreste primarie in Romania nella
# zona dei Monti Făgăraș, ricca di aree protette natura 2000 e siti unesco.
# sono anche state svolte azioni di riforestazione nell'area di recente.

 #install.packages("raster")
 #install.packages("viridis")
 #install.packages("ggplot2")
 #install.packages("tidyr") 

# Caricamento dei pacchetti:

library(raster)
library(ggplot2)
library(tidyverse)
library(tidyr)
library(sf)
library(viridis)

# set working directory
setwd("/Users/danielaantichii/Documents/Esame telerilevamento")
getwd()

#Importazione e visualizzazione IMMAGINI Sentinel2:  ----
# Le immagini satellitari utilizzate sono state prodotte da Sentinel 2, con risoluzione 10 m x 10 m.

# Nomi delle bande:
## Banda 2 = Blu
## Banda 3 = Verde
## Banda 4 = Rosso
## Banda 8 = NIR

## Immagine 2015 ----
# Creazione di una lista cercando nella woking directory elementi in comune
rlist_2015 <- list.files(pattern = "T35TLL_20150808T092006_B")
rlist_2015
?raster
# Applico la funzione raster() all'intera lista
import_2015 <- lapply(rlist_2015, raster)
import_2015

# Unione di tutte le bande presenti nella lista in un solo oggetto
img_2015 <- stack(import_2015)

# Visualizzo le informazioni
img_2015

# Plot img_2018
plot(img_2015)  #abbiamo tutte le immagini in un singolo elemento

# Visuallizzo una singola immagine
plot(img_2015[[1]])

# Ritaglio l'area di interesse di foreste vergini
ext <- c(347000, 364000, 5040000, 5063000) #coordinate per il ritaglio 
Forest_2015 <- crop(img_2015, ext)

# Bande <- 1 = BLUE, 2 = GREEN, 3 = RED, 4 = NIR

# Plot dell'immagine ritagliata + esportazione in .pdf
pdf("Forest_2015.pdf") 
par(mfrow = c(1,2))  # grafici sono disposti in 1 riga e 2 colonne  
plotRGB(Forest_2015,3,2,1, stretch = "lin") # colori reali
plotRGB(Forest_2015,4,3,2, stretch = "lin") # NIR
dev.off()

## Altre immagini: 2016-2024 ----
# Creazione di una lista cercando nella woking directory elementi in comune
rlist_2016 <- list.files(pattern = "T35TLL_20160713T092032_B")
rlist_2017 <- list.files(pattern = "T35TLL_20170802T092029_B")
rlist_2018 <- list.files(pattern = "T35TLL_20180814T090549_B")
rlist_2019 <- list.files(pattern = "T35TLL_20190814T090601_B")
rlist_2020 <- list.files(pattern = "T35TLL_20200831T092031_B")
rlist_2021 <- list.files(pattern = "T35TLL_20210808T090559_B")
rlist_2022 <- list.files(pattern = "T35TLL_20220826T091549_B")
rlist_2023 <- list.files(pattern = "T35TLL_20230828T090559_B")
rlist_2024 <- list.files(pattern = "T35TLL_20240921T090559_B")

# Applico la funzione raster() all'intera lista
import_2016 <- lapply(rlist_2016, raster)
import_2017 <- lapply(rlist_2017, raster)
import_2018 <- lapply(rlist_2018, raster)
import_2019 <- lapply(rlist_2019, raster)
import_2020 <- lapply(rlist_2020, raster)
import_2021 <- lapply(rlist_2021, raster)
import_2022 <- lapply(rlist_2022, raster)
import_2023 <- lapply(rlist_2023, raster)
import_2024 <- lapply(rlist_2024, raster)

# Unione di tutte le bande presenti nella lista in un solo oggetto
img_2016 <- stack(import_2016)
img_2017 <- stack(import_2017)
img_2018 <- stack(import_2018)
img_2019 <- stack(import_2019)
img_2020 <- stack(import_2020)
img_2021 <- stack(import_2021)
img_2022 <- stack(import_2022)
img_2023 <- stack(import_2023)
img_2024 <- stack(import_2024)

# Ritaglio l'area di interesse
Forest_2016 <- crop(img_2016, ext)
Forest_2017 <- crop(img_2017, ext)
Forest_2018 <- crop(img_2018, ext)
Forest_2019 <- crop(img_2019, ext)
Forest_2020 <- crop(img_2020, ext)
Forest_2021 <- crop(img_2021, ext)
Forest_2022 <- crop(img_2022, ext)
Forest_2023 <- crop(img_2023, ext)
Forest_2024 <- crop(img_2024, ext)


# Plot con RGB l'immagine ritagliata

# Forest_2016
pdf("Forest_2016.pdf")
par(mfrow = c(1,2))    
plotRGB(Forest_2016,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2016,4,3,2, stretch = "lin") # NIR
dev.off()

# Forest_2017
pdf("Forest_2017.pdf")
par(mfrow = c(1,2))
plotRGB(Forest_2017,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2017,4,3,2, stretch = "lin") # NIR
dev.off()

# Forest_2018
pdf("Forest_2018.pdf")
par(mfrow = c(1,2))
plotRGB(Forest_2018,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2018,4,3,2, stretch = "lin") # NIR
dev.off()

# Forest_2019
pdf("Forest_2019.pdf")
par(mfrow = c(1,2))
plotRGB(Forest_2019,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2019,4,3,2, stretch = "lin") # NIR
dev.off()

# Forest_2020
pdf("Forest_2020.pdf")
par(mfrow = c(1,2))
plotRGB(Forest_2020,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2020,4,3,2, stretch = "lin") # NIR
dev.off()

# Forest_2021
pdf("Forest_2021.pdf")
par(mfrow = c(1,2))
plotRGB(Forest_2021,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2021,4,3,2, stretch = "lin") # NIR
dev.off()

# Forest_2022
pdf("Forest_2022.pdf")
par(mfrow = c(1,2))
plotRGB(Forest_2022,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2022,4,3,2, stretch = "lin") # NIR
dev.off()

# Forest_2023
pdf("Forest_2023.pdf")
par(mfrow = c(1,2))
plotRGB(Forest_2023,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2023,4,3,2, stretch = "lin") # NIR
dev.off()

# Forest_2024
pdf("Forest_2024.pdf")
par(mfrow = c(1,2))
plotRGB(Forest_2024,3,2,1, stretch = "lin") # colori reali 
plotRGB(Forest_2024,4,3,2, stretch = "lin") # NIR
dev.off()

## Plot delle 10 immagini + esportazione in .pdf ----

# Colori reali
pdf("Forest_RGB.pdf")
par(mfrow = c(2,5))
plotRGB(Forest_2015,3,2,1, stretch = "lin", main = "2015_RGB")
plotRGB(Forest_2016,3,2,1, stretch = "lin", main = "2016_RGB")
plotRGB(Forest_2017,3,2,1, stretch = "lin", main = "2017_RGB")
plotRGB(Forest_2018,3,2,1, stretch = "lin", main = "2018_RGB")
plotRGB(Forest_2019,3,2,1, stretch = "lin", main = "2019_RGB")
plotRGB(Forest_2020,3,2,1, stretch = "lin", main = "2020_RGB")
plotRGB(Forest_2021,3,2,1, stretch = "lin", main = "2021_RGB")
plotRGB(Forest_2022,3,2,1, stretch = "lin", main = "2022_RGB")
plotRGB(Forest_2023,3,2,1, stretch = "lin", main = "2023_RGB")
plotRGB(Forest_2024,3,2,1, stretch = "lin", main = "2024_RGB")
dev.off()

# Colori NIR
pdf("Forest_NIR.pdf")
par(mfrow = c(2,5))
plotRGB(Forest_2015,4,3,2, stretch = "lin", main = "2015_NIR")
plotRGB(Forest_2016,4,3,2, stretch = "lin", main = "2016_NIR")
plotRGB(Forest_2017,4,3,2, stretch = "lin", main = "2017_NIR")
plotRGB(Forest_2018,4,3,2, stretch = "lin", main = "2018_NIR")
plotRGB(Forest_2019,4,3,2, stretch = "lin", main = "2019_NIR")
plotRGB(Forest_2020,4,3,2, stretch = "lin", main = "2020_NIR")
plotRGB(Forest_2021,4,3,2, stretch = "lin", main = "2021_NIR")
plotRGB(Forest_2022,4,3,2, stretch = "lin", main = "2022_NIR")
plotRGB(Forest_2023,4,3,2, stretch = "lin", main = "2023_NIR")
plotRGB(Forest_2024,4,3,2, stretch = "lin", main = "2024_NIR")
dev.off()

## NDVI (NORMALIZED DIFFERENCE VEGETATION INDEX) -----
# NDVI è un indice applicato per quantificare la salute e la densità della vegetazione
# range da -1 a +1

# DVI = NIR - rosso
DVI_2015 <- Forest_2015[[4]] - Forest_2015[[3]]
DVI_2016 <- Forest_2016[[4]] - Forest_2016[[3]]
DVI_2017 <- Forest_2017[[4]] - Forest_2017[[3]]
DVI_2018 <- Forest_2018[[4]] - Forest_2018[[3]]
DVI_2019 <- Forest_2019[[4]] - Forest_2019[[3]]
DVI_2020 <- Forest_2020[[4]] - Forest_2020[[3]]
DVI_2021 <- Forest_2021[[4]] - Forest_2021[[3]]
DVI_2022 <- Forest_2022[[4]] - Forest_2022[[3]]
DVI_2023 <- Forest_2023[[4]] - Forest_2023[[3]]
DVI_2024 <- Forest_2024[[4]] - Forest_2024[[3]]

# NDVI = (NIR - rosso) / (NIR + rosso) = DVI / (NIR + rosso)
NDVI_2015 <- DVI_2015 / (Forest_2015[[4]] + Forest_2015[[3]])
NDVI_2016 <- DVI_2016 / (Forest_2016[[4]] + Forest_2016[[3]])
NDVI_2017 <- DVI_2017 / (Forest_2017[[4]] + Forest_2017[[3]])
NDVI_2018 <- DVI_2018 / (Forest_2018[[4]] + Forest_2018[[3]])
NDVI_2019 <- DVI_2019 / (Forest_2019[[4]] + Forest_2019[[3]])
NDVI_2020 <- DVI_2020 / (Forest_2020[[4]] + Forest_2020[[3]])
NDVI_2021 <- DVI_2021 / (Forest_2021[[4]] + Forest_2021[[3]])
NDVI_2022 <- DVI_2022 / (Forest_2022[[4]] + Forest_2022[[3]])
NDVI_2023 <- DVI_2023 / (Forest_2023[[4]] + Forest_2023[[3]])
NDVI_2024 <- DVI_2024 / (Forest_2024[[4]] + Forest_2024[[3]])

# Plot dell' NDVI
pdf("NDVI.pdf")
par(mfrow = c(2, 5), oma = c(2, 1, 2, 1))    #oma (inf, sx, sup, dx))
cl1 <- magma(256)
plot(NDVI_2015, col = cl1, main = "NDVI_2015")
plot(NDVI_2016, col = cl1, main = "NDVI_2016")
plot(NDVI_2017, col = cl1, main = "NDVI_2017")
plot(NDVI_2018, col = cl1, main = "NDVI_2018")
plot(NDVI_2019, col = cl1, main = "NDVI_2019")
plot(NDVI_2020, col = cl1, main = "NDVI_2020")
plot(NDVI_2021, col = cl1, main = "NDVI_2021")
plot(NDVI_2022, col = cl1, main = "NDVI_2022")
plot(NDVI_2023, col = cl1, main = "NDVI_2023")
plot(NDVI_2024, col = cl1, main = "NDVI_2024")
dev.off()

# Differenza temporale 2015-2024
NDVI_2015_2024 <- NDVI_2015 - NDVI_2024   #osservo zone dove sono avvenute azioni di deforestazione

# Plot NDVI_2015_2024 che è il risultato dell'analisi temporale 
cl2 <- magma(100)
pdf("NDVI_2015_2024.pdf")
plot(NDVI_2015_2024, col = cl2, main = "NDVI difference 2015-2024")
dev.off()

#PCA ----
box <- stack(NDVI_2015, NDVI_2016, NDVI_2017, NDVI_2018, NDVI_2019, NDVI_2020, NDVI_2021, NDVI_2022, NDVI_2023, NDVI_2024)

sr <- sampleRandom(box, 20000)

# Effettuo la PCA (Principal Component Analysis)
PCA <- prcomp(sr)

# Visualizzazione delle informazioni relative alla PCA
summary(PCA)

# Plot della varianza spiegata da ciascuna delle componenti
plot(PCA)

# Proiezione dell'oggetto box nello spazio creato precedentemente usando le CP
PC1 <- predict(box, PCA, index = 1:2)
PC1

# Plot della PC1
plot(PC1[[1]], col = cl2,)
plot(PC1)

# Conversione di PC1 in un dataframe
PC_fin <- as.data.frame(PC1[[1]], xy = T)

# Plot + # Esportazione di  in .pdf
ggplot() + 
  geom_raster(PC_fin, mapping = aes(x = x, y = y, fill = PC1)) + 
  scale_fill_viridis(option = "turbo") +
  theme_bw() +
  labs(title = "PCA of NDVI yearly")
ggsave("PCAyearly.png")
dev.off()
# Il grafico ggplot aiuta a comprendere come la variazione, catturata dalla prima componente principale  
# è distribuita nell'area di studio, basandosi sulle differenze negli indici di input.


# LAND COVER ----
set.seed(123)
# LAND COVER 2015
single_nr_2015 <- getValues(Forest_2015)
kcluster_2015 <- kmeans(single_nr_2015, centers = 3)
Forest2015_class <- setValues(Forest_2015[[1]], kcluster_2015$cluster)

# LAND COVER 2016
single_nr_2016 <- getValues(Forest_2016)
kcluster_2016 <- kmeans(single_nr_2016, centers = 3)
Forest2016_class <- setValues(Forest_2016[[1]], kcluster_2016$cluster)

# LAND COVER 2017
single_nr_2017 <- getValues(Forest_2017)
kcluster_2017 <- kmeans(single_nr_2017, centers = 3)
Forest2017_class <- setValues(Forest_2017[[1]], kcluster_2017$cluster)

# LAND COVER 2018
single_nr_2018 <- getValues(Forest_2018)
kcluster_2018 <- kmeans(single_nr_2018, centers = 3)
Forest2018_class <- setValues(Forest_2018[[1]], kcluster_2018$cluster)

# LAND COVER 2019
single_nr_2019 <- getValues(Forest_2019)
kcluster_2019 <- kmeans(single_nr_2019, centers = 3)
Forest2019_class <- setValues(Forest_2019[[1]], kcluster_2019$cluster)

# LAND COVER 2020
single_nr_2020 <- getValues(Forest_2020)
kcluster_2020 <- kmeans(single_nr_2020, centers = 3)
Forest2020_class <- setValues(Forest_2020[[1]], kcluster_2020$cluster)

# LAND COVER 2021
single_nr_2021 <- getValues(Forest_2021)
kcluster_2021 <- kmeans(single_nr_2021, centers = 3)
Forest2021_class <- setValues(Forest_2021[[1]], kcluster_2021$cluster)

# LAND COVER 2022 
single_nr_2022 <- getValues(Forest_2022)
kcluster_2022 <- kmeans(single_nr_2022, centers = 3)
Forest2022_class <- setValues(Forest_2022[[1]], kcluster_2022$cluster)

# LAND COVER 2023
single_nr_2023 <- getValues(Forest_2023)
kcluster_2023 <- kmeans(single_nr_2023, centers = 3)
Forest2023_class <- setValues(Forest_2023[[1]], kcluster_2023$cluster)

# LAND COVER 2024
single_nr_2024 <- getValues(Forest_2024)
kcluster_2024 <- kmeans(single_nr_2024, centers = 3)
Forest2024_class <- setValues(Forest_2024[[1]], kcluster_2024$cluster)

## land cover plots ----
pdf("classes.pdf")
cl_class <- colorRampPalette(c("darkorange","darkgreen","brown"))(3)
par(mfrow = c(2, 5), oma = c(0.5, 1, 0.5, 1))

# Plotting per ogni anno
plot(Forest2015_class, col = cl_class, main = "2015")
plot(Forest2016_class, col = cl_class, main = "2016")
plot(Forest2017_class, col = cl_class, main = "2017")
plot(Forest2018_class, col = cl_class, main = "2018")
plot(Forest2019_class, col = cl_class, main = "2019")
plot(Forest2020_class, col = cl_class, main = "2020")
plot(Forest2021_class, col = cl_class, main = "2021")
plot(Forest2022_class, col = cl_class, main = "2022")
plot(Forest2023_class, col = cl_class, main = "2023")
plot(Forest2024_class, col = cl_class, main = "2024")

dev.off()
# class 1: suolo nudo, aree urbane, vegetazione rada
# class 2: bassa vegetatione, aree coltivate, vegetazione arbustiva
# class 3: foresta, terreno coperto da alberi

## Percentuali -----

# Creazione di un data frame vuoto per memorizzare i risultati
results <- data.frame(RasterName = character(0),
                      Class1_Frequency = numeric(0),
                      Class2_Frequency = numeric(0),
                      Class3_Frequency = numeric(0),
                      Class1_Percentage = numeric(0),
                      Class2_Percentage = numeric(0),
                      Class3_Percentage = numeric(0))

# Creazione di una lista che contenga i valori di ciascuna classe
classes <- list(Forest2015_class, Forest2016_class, Forest2017_class, 
                Forest2018_class, Forest2019_class, Forest2020_class, 
                Forest2021_class, Forest2022_class, Forest2023_class, 
                Forest2024_class)

# Per ogni oggetto raster nella lista 'classes', vengono eseguite le operazioni successive:
for (i in 1:length(classes)) {
  # Recupero dell'oggetto raster corrente dalla lista 'classes'
  raster_obj <- classes[[i]]
  
  # Estrazione dei valori dei pixel dell'oggetto raster corrente
  values <- getValues(raster_obj)
  
  # Calcolo della frequenza dei pixel per ciascuna classe
  class1_freq <- sum(values == 1)  # Assuming class 1 is represented by value 1
  class2_freq <- sum(values == 2)  # Assuming class 2 is represented by value 2
  class3_freq <- sum(values == 3)  # Assuming class 3 is represented by value 3
  
  # Calcolo della percentuale di ciascuna classe rispetto al numero totale di pixel
  total_pixels <- length(values)
  class1_percentage <- round((class1_freq / total_pixels) * 100, 1)
  class2_percentage <- round((class2_freq / total_pixels) * 100, 1)
  class3_percentage <- round((class3_freq / total_pixels) * 100, 1)
  
  # Salvataggio dei risultati calcolati in un data frame
  results <- rbind(results, data.frame(RasterName = names(raster_obj),
                                       Class1_Frequency = class1_freq,
                                       Class2_Frequency = class2_freq,
                                       Class3_Frequency = class3_freq,
                                       Class1_Percentage = class1_percentage,
                                       Class2_Percentage = class2_percentage,
                                       Class3_Percentage = class3_percentage))
}

# Print dei risultati
print(results)

# Guardando l'immagine assegno i valori alle classi corrette
# poi salvo in un dataframe per andare a creare dei grafici

# creo un dataframe con i risultati per ogni classe
classes <- data.frame(
  year = c(2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024),
  bare_soil = c(40.6, 2.2, 40.8, 42.2, 41.4, 41.4, 41.0, 41.0, 42.8, 45.4),
  low_vegetation = c(26.6, 55.1, 27.1, 23.6, 25.4, 22.4, 26.4, 23.2, 22.3, 18.4),
  forest = c(32.8, 42.7, 32.1, 34.2, 33.2, 36.2, 32.6, 35.8, 34.9, 36.1))

classes <- pivot_longer(classes, -year, names_to = "class", values_to = "percentage")
print(n=30,classes)

## Risultati -----

# Plot sulle classi
classes$class <- factor(classes$class, levels = c("bare_soil", "low_vegetation", "forest"))

# grafico a barre
classes %>%
  ggplot(aes(x = year, y = percentage, fill = class)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Land Cover in Fargas Forest by Year",
       x = "Year",
       y = "Percentage") +
  scale_fill_manual(values = c("brown", "darkorange", "darkgreen"),
                    name = "Class",
                    labels = c("bare soil", "low vegetation", "forest")) +
  scale_x_continuous(breaks = unique(classes$year)) +
  theme_classic()
ggsave("plot_bar.png", width = 2000, height = 1350, units = "px")

# grafico a linee
classes %>%
  ggplot(aes(x = year, y = percentage, color = class)) +
  geom_line(linewidth = 2) +
  labs(title = "Land Cover in Fargas Forest by Year",
       x = "Year",
       y = "Percentage") +
  scale_color_manual(values = c("brown", "darkorange", "darkgreen"),
                    name = "Class",
                    labels = c("bare soil", "low vegetation", "forest")) +
  scale_x_continuous(breaks = unique(classes$year)) +
  theme_classic()
ggsave("plot_line.png", width = 2000, height = 1350, units = "px")

# grafico a dispersione
classes %>%
  ggplot(aes(x = year, y = percentage, color = class)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", aes(fill = class), linewidth = 1.5) +
  labs(title = "Land Cover in fargas Forest by Year",
       x = "Year",
       y = "Percentage") +
  scale_color_manual(values = c("brown", "darkorange", "darkgreen"),
                      name = "Class",
                      labels = c("bare soil", "low vegetation", "forest")) +
 scale_fill_manual(values = c("brown", "darkorange", "darkgreen"),
                    name = "Class",
                    labels = c("bare soil", "low vegetation", "forest")) +
  scale_x_continuous(breaks = unique(classes$year)) +
  theme_classic()
ggsave("plot_scatter.png", width = 2000, height = 1350, units = "px")

# in questa area dei monti fagaras è possibile vedere come ci sia un continuo aumento della deforestazione
# e dell' urbanizzazione nel periodo analizzato, nonostante si tratti di aree protette.
# Purtroppo non è possibile notare le azioni di riforestazione, probabilmente perchè sono troppo recenti.
