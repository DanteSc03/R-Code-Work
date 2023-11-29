#Cargar los datos de Train.
train <- read.csv("~/Downloads/train.csv", header=TRUE)
View(train)

#Para la variable “MSZoning” eliminar de la variable “C (all)” el “ (all)” (sustituirlo por“”)
train$MSZoning <- gsub("\\(all\\)","", train$MSZoning)

#Comprobar que se ha realizado correctamente el cambio.
View(train)

#Crear una nueva variable que se llame Crisis.
crisis <- ifelse(train$YrSold >= 2008, "no", "si")
crisis

#Transformar la variable anterior para determinar (Debe tomar los valores Sí y No),basándose en la variable “YrSold”, si la casa se vendió en el periodo precrisis (antesde 2008) o durante la crisis (a partir de 2008)
crisis <- ifelse(train$YrSold >= 2008, "no", "si")
crisis

#Crear un nuevo grupo de datos con las 10 casas más caras, en función de la variable “SalePrice”.
diezcaras<- train[order(train$SalePrice, decreasing=TRUE)[1:10],]
View(diezcaras)

#Determinar la calle en la que se encuentra la casa más cara.
CalleCara <- as.data.frame(train$Street[which.max(train$SalePrice)])
CalleCara

#Crear una variable llamada “Reforma” y que muestre los años que pasaron entre la última reforma y la venta (YrSold-YearRemodAdd).
reforma <- train$YrSold-train$YearRemodAdd
reforma

#Guardar los datos, write.csv(datos, “trainmod.csv”, row.names=FALSE)
write.csv(datos, "trainmod.csv", row.names=FALSE)
