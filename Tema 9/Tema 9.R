library(dplyr)
library(ggplot2)
library(reshape)

#1. Cargar “trainmod”.
trainmod <- read.csv("~/Downloads/trainmod.csv")
View(trainmod)

#2. Agregar el Precio de Venta en función de la variable “MSZoning”. Calculando:
  #a. Importe total de las transacciones.
  #b. Número total de transacciones.
  #c. Valor medio de las transacciones.
  #d. Desviación típica de las transacciones.
precio_venta <- trainmod %>%
  group_by(MSZoning) %>%
  summarize(
    importe_total = sum(SalePrice),
    transacciones = n(),
    medio = mean(SalePrice),
    desviacion = sd(SalePrice)
  )
View(precio_venta)

#3. Agregar el Precio de venta en función de la variable “MSZoning” y la variable “Crisis”.Calculando:
  #a. Importe total de las transacciones.
  #b. Número total de transacciones.
  #c. Valor medio de las transacciones.
  #d. Desviación típica de las transacciones.
precio_venta2 <- trainmod %>%
  group_by(MSZoning, Crisis) %>%
  summarize(
    importe_total = sum(SalePrice),
    transacciones = n(),
    medio = mean(SalePrice),
    desviacion = sd(SalePrice)
  )
View(precio_venta2)

#4. Graficar de las agregaciones anteriores el Importe Total y el Número Total de transacciones, de la siguiente forma:
  #a. Valor en el eje de la Y.
  #b. MSZoning en el eje X.
  #c. Color en función de si se vendió en la crisis o fuera de ella.

ggplot(precio_venta2, aes(x=MSZoning)) +
         geom_point(aes(y=importe_total, color=Crisis)) +
         geom_point(aes(y=transacciones, color=Crisis)) +
         labs(x="MSZoning", y="Valor", color="Crisis") +
         scale_color_discrete(name="Crisis", labels=c("No", "Sí")) 

#5. Unir las tablas “Valor Medio” y “ Desviación Típica” calculadas en el punto dos.
    #Ya estan unidas
MedyDesviacion <- precio_venta[,-2:-3]
View(MedyDesviacion)

#6. Cambiar los nombres de las variables de la tabla anterior y poner “Media” y“Desviación”.
colnames(MedyDesviacion) <- c("MSZoning", "Media", "Desviacion")
View(MedyDesviacion)

#7. Calcular el cociente entre Media y Desviación.
MedyDesviacion$cociente <- MedyDesviacion$Media / MedyDesviacion$Desviacion

#8. Normalizar la tabla creadas en el ejercicio tres.
normalizado <- precio_venta2 %>%
  group_by(MSZoning) %>%
  mutate(
    importe_total_normalizado = (importe_total - min(importe_total)) / (max(importe_total) - min(importe_total)),
    transacciones_normalizado = (transacciones - min(transacciones)) / (max(transacciones) - min(transacciones))
  )
View(normalizado)

#9. Verticalizar los datos originales por la Id.
trainmod_verticalizado <- melt(trainmod, id.vars = "Id")
