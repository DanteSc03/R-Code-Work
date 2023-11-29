library(dplyr)




#1. Cargar los datos de trainmod.
trainmod <- read.csv("~/Downloads/trainmod.csv")
View(trainmod)

#2. Seleccionar los datos en los que la variable “MSZoning” tome el valor “RM”.
RM <- trainmod[trainmod$MSZoning == "RM",]
View(RM)

#3.Seleccionar los datos en los que la variable “MSZoning” tome el valor “RM” o “C”
RMoC <- trainmod[trainmod$MSZoning %in% c("RM", "C"),]
View(RMoC)

#4. Seleccionar los datos en los que el precio de venta sea menor de 100.000$
menor <- trainmod[trainmod$SalePrice < 100000,]
View(menor)

#5. Seleccionar los datos en los que el precio de venta sea menor de 100.000$ o lavariable “MSZoning” tome el valor “RM”.
menor0Ms <- trainmod[trainmod$SalePrice < 100000 | trainmod$MSZoning == "RM",]
View(menorMs)

#6. Seleccionar los datos en los que el precio de venta sea menor de 100.000$ y lavariable “MSZoning” tome el valor “RM”.
menoryMs <- trainmod[trainmod$SalePrice < 100000 & trainmod$MSZoning == "RM",]
View(menoryMs)

#7. Seleccionar los datos de la variable “MSZoning” que no tomen el valor “RL”.
noRL <- trainmod[trainmod$MSZoning != "RL",]
View(noRL)

#8. Seleccionar los datos de la variable “MSZoning” que no tomen el valor “RL” y valgan menos de 120.000 dolares.
noRLmenos <- trainmod[trainmod$SalePrice < 120000 & trainmod$MSZoning != "RL",]
View(noRLmenos)

#9. Seleccionar las variables que sean factores.
factores <- trainmod[sapply(trainmod, is.factor)]
View(factores)

#10. Eliminar aquellas variables que tomen solo un valor.
trainmod1 <- trainmod[, sapply(trainmod, function(x) length(unique(x))) > 1]
View(trainmod1)

#11. Eliminar los duplicados.
trainodups <- trainmod[!duplicated(trainmod),]
View(trainodups)

#12. De los datos seleccionar las variables que aparecen en datosImp.
datosImp <- read.csv("~/Downloads/datosImp.csv")
View(datosImp)

condensed <- trainmod[, colnames(trainmod) %in% colnames(datosImp)]
condensed

#13. De los datos seleccionar aquellos que aparecen en casas caras
CasasCaras <- read.csv("~/Downloads/CasasCaras.csv", sep="")
View(CasasCaras)

caras <-trainmod[rownames(trainmod) %in% rownames(CasasCaras),]
View(caras)

