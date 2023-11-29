library(dplyr)
library(tidyr)
library(ggplot2)
library(GGally)

#Cargar los datos de trainmod (Los creados en el apartado anterior).
trainmod <- read.csv("~/Downloads/trainmod.csv")

#Mostrar los datos.
View(trainmod)

#Realizar un resumen estadístico de los datos y realizar una interpretación.
summary(trainmod)

#Determinar los niveles existentes para la variable “Crisis”
levels(trainmod$Crisis)

#Sustituir los “Si” por “Crisis” y los “No” por “Burbuja”
trainmod$Crisis <- ifelse(trainmod$Crisis== "Si", "Crisis","Burbuja")
  
#Determinar la clase de cada uno de los datos.
class(trainmod)

#Realizar un gráfico del precio de venta.
plot(trainmod$SalePrice)

#Realizar un histograma del precio de venta.
hist(trainmod$SalePrice)

#Graficar el precio de venta en función de la variable MSZoning..
ggplot(trainmod, aes(x=MSZoning, y= SalePrice))
  geom_point()
  
#Mostrar, gráficamente la relación entre el precio de venta y “GrLivArea”. 
  #¿Como es?.¿Y la relación con “LotArea”?
ggplot(trainmod, aes(x=GrLivArea, y=SalePrice))+
  geom_point()
  
#Realizar un gráfico de la variable “MSZoning”.
plot(table(trainmod$MSZoning))

# Seleccionar los datos numéricos.
trainmod_numeric <- trainmod[sapply(trainmod, is.numeric)]
View(trainmod_numeric)

#Graficar todas las relaciones entre las variables.
pairs(trainmod_numeric[,1:20])

#Crear un nuevo Data Frame con las 10 últimas variables.
NewTrain <- trainmod_numeric[, (ncol(trainmod_numeric) - 9):ncol(trainmod_numeric)]
View(NewTrain)

#Analizar la relación de estas variables con dos gráficos diferentes.
plot(NewTrain)
scatmat(NewTrain)

#Analizar la correlación entre las variables numéricas.
cor(trainmod_numeric)

#Eliminar los valores perdidos.
omit <- na.omit(NewTrain)

#Volver a analizar la correlación realizando tres tipos de dibujos diferentes.
plot(omit)
cor(omit)
View(omit)

# Guardar los datos.
write.csv(omit, "omit.csv")


