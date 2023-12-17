library(dplyr)

#1. Cargar los datos “SalePrice1”, “SalePrice2”, “SalePrice3”.
SalePrice1 <- read.csv("~/Downloads/SalePrice1.csv")
SalePrice2 <- read.csv("~/Downloads/SalePrice2.csv")
SalePrice3 <- read.csv("~/Downloads/SalePrice3.csv")
View(SalePrice1)
View(SalePrice2)
View(SalePrice3)

#2. Unir las tres tablas “pegando” una a continuación de la otra.
SalesPegado = cbind(SalePrice1, SalePrice2, SalePrice3)

#3. Cargar los datos de “CasasCaras”.
CasasCaras <- read.csv("~/Downloads/CasasCaras (1).csv", sep="")

#4. Enriquecer la tabla “CasasCaras” con las variables incluidas en datos1, datos2 y datos3, utilizando dos fórmulas diferentes.
CasasCaras1 = merge(CasasCaras, SalePrice1, all.x=TRUE, all.y=FALSE)
CasasCaras1 = merge(CasasCaras1, SalePrice2, all.x=TRUE, all.y=FALSE)
CasasCaras1 = merge(CasasCaras1, SalePrice3, all.x=TRUE, all.y=FALSE)

#5. Cargar datosH.
datosH <- read.csv("~/Downloads/datosH.csv")
View(datosH)

#6. Realizar las siguientes uniones con dos funciones:
  #a. Enriquecer datos H con la información de “SalePrice1”, “SalePrice2”,“SalePrice3”.
datosH1 = merge(SalePrice1, datosH, all.x=FALSE, all.y=TRUE)
datosH1 = merge(datosH1, SalePrice2, all.x=FALSE, all.y=TRUE)
datosH1 = merge(datosH1, SalePrice3, all.x=FALSE, all.y=TRUE)

datosH2 = join(SalePrice1, datosH, type = "right")
datosH2 = join(SalePrice2, datosH2, type = "right")
datosH2 = join(SalePrice3, datosH2, type = "right")

  #b. Recogiendo toda la información recogida en todas las tablas
datosH3 = merge(SalePrice1, datosH, all.x=TRUE, all.y=TRUE)
datosH3 = merge(SalePrice2, datosH3, all.x=TRUE, all.y=TRUE)
datosH3 = merge(SalePrice2, datosH3, all.x=TRUE, all.y=TRUE)

datosH4 = join(SalePrice1, datosH, type = "right")
datosH4 = join(SalePrice2, datosH4, type = "right")
datosH4 = join(SalePrice3, datosH4, type = "right")

  #c. Recogiendo los elementos comunes.
datosH5 = merge(SalePrice1, datosH, all.x=FALSE, all.y=FALSE)
datosH5 = merge(SalePrice2, datosH5, all.x=FALSE, all.y=FALSE)
datosH5 = merge(SalePrice2, datosH5, all.x=FALSE, all.y=FALSE)

datosH6 = join(SalePrice1, datosH, type = "right")
datosH6 = join(SalePrice2, datosH6, type = "right")
datosH6 = join(SalePrice3, datosH6, type = "right")

#7. Seleccionar:
  #a. Los elementos comunes entre datosH y Casascaras.
Intersecciona = merge(CasasCaras, datosH, all.x = FALSE, all.y =FALSE)
Interseccionb = join(CasasCaras, datosH, type="inner")

  #b. Enriquecer datosH con Casascaras.
CasasCaras2a = merge(CasasCaras, datosH, all.x =TRUE, all.y=FALSE)
CasasCaras2b = join(CasasCaras, datosH, type = "left")

  #c. Enriquecer Casascaras con datos H.
CasasCaras2a = merge(CasasCaras, datosH, all.x =FALSE, all.y=TRUE)
CasasCaras2b = join(CasasCaras, datosH, type = "right")

  #d. Todos los elementos
TodoA = merge(CasasCaras,datosH,all.x = TRUE, all.y = TRUE)
TodoB = join(CasasCaras,datosH,type="full")


