
library(stringdist)

# Cargar los datos de “train2”.
train2 <- read.csv("~/Downloads/train2.csv")

# Mostrar los niveles de la variable “LotConfig”.
train2$LotConfig <- as.factor(train2$LotConfig)
levels(train2$LotConfig)

# Mostrar el número de elementos de cada nivel.
num_elements <- table(train2$LotConfig)
View(num_elements)

# Crear un diccionario con los términos correctos:
Dic_Correct <- c("Corner", "CulDSac", "FR2", "FR3", "Inside")

# Crear una variable que corrija los errores topográficos existentes, permitirle unmáximo de 4 cambios de letras
corrections <- function(value, Dic_Correct) {
  best_coincidence <- amatch(value, Dic_Correct, maxDist= 4)
  return(Dic_Correct[best_coincidence])
}

# Corregir los errores en la tabla train2.
train2$LotConfig <- sapply(train2$LotConfig, corrections, Dic_Correct = Dic_Correct)
train2$LotConfig <- as.factor(train2$LotConfig)
levels(train2$LotConfig)
table(train2$LotConfig)

#Comprobar que se ha realizado correctamente.
View(train2)
