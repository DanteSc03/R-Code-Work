library(dplyr)
library(lubridate)
library(ggplot2)

#Cargar y mostrar los datos
Info <- read.csv("~/Downloads/Ejemplo_4.csv", sep=";")
View(Ejemplo_4)

#Realizar un resumen estadistico de los datos
stats <- summary(Info)
View(stats)

#Comprobar si las fechas estan en un formato correcto
class(Info$CET)

#Correccion de formato 
Info$Date <- as.POSIXct(as.character(Info$CET), format = "%d/%m/%Y")
View(Info)

#Nueva columna con la primera columna y borrar columna CET
Info <- Info %>%
  select(Date, everything(), -CET)
View(Info)

#Crear nuevas variables de año, mes y dia 
Info$Month <- month(Info$Date)
Info$Year <- year(Info$Date)
Info$Day <- day(Info$Date)
View(Info)

#Grafico de temperatura maxima por año
plot(Info$Year, Info$Max.TemperatureC)

#Grafico de temperatura maxima por mes
plot(Info$Month, Info$Max.TemperatureC)

#Grafico de temperatura maxima por dia
plot(Info$Day, Info$Max.TemperatureC)

#Extraer dia de semana
Info$Days <- weekdays(Info$Date)
View(Info)

#Crear variable que determine si es fin de semana o no
str(Info$Days)
Checker <- function(x){
  if (x %in% c("Saturday", "Sunday")){
    return("Weekend")
  }else{
    return("Weekday")
  }}

Info$Weeks <- sapply(Info$Days, Checker)
View(Info)

#Realizar un gráfico en de la temperatura máxima en función de si se está en fin de semana o no
ggplot(Info, aes(x=Date, y= Max.TemperatureC, color = Weeks))+
  geom_point()

#Calcular la media de si es fin de semana o no
as.numeric(Info$Max.TemperatureC)
MeanWeekend <- mean(Info[Info$Weeks== "Weekend", 'Max.TemperatureC'], na.rm = TRUE)
print(MeanWeekend)

MeanWeekday <- mean(Info[Info$Weeks== "Weekday", "Max.TemperatureC"], na.rm=TRUE)
print(MeanWeekday)


