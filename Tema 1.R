
library(dplyr)

# 1 - Realizar las siguientes operaciones
  #Sumar 25,3 y 35,1
  a <- sum(25.3,35.1)
  a
  #Restar 15 menos 8,2
  b <- (15-8.2)
  b
  #Multiplicar 12 por 4
  c <- (12*4)
  c
  #Dividir 15 entre 3
  d <- (15/3)
  d
  #Calcular la raiz cuadrada de 125
  e <- sqrt(125)
  e
  # Elevar 2 a la 8
  f <- (2^8)
  f
#2 Las variables creadas ya estan con el ejercicio 1
#3 Crear los siguientes vectores
  #Un vector que vaya del 20 al 127
  v1 <- c(20:127)
  v1
  #Un vector que incluya los numeros 5,12,25,8,46,52
  v2 <- c(5,12,25,8,46,52)
  v2
  #Un vector que vaya del 35 al 80 e incluya a continuacion el 10 y el 100
  v3 <- c(35:80, 10, 100)
  v3
  #Crear un vector con las 5 primeras letras del abecedario y los 5 primeros numeros entero
  v4 <- c("a","b","c","d","e", 1:5)
  v4
#4 Realizar las siguientes tareas con vectores
  #Determinar el numero de elementos de cada vector creado en el punto 3
  v1_length<-length(v1)
  v1_length
  v2_length<-length(v2)
  v2_length
  v3_length<-length(v3)
  v3_length
  v4_length<-length(v4)
  v4_length
  #Crear otro vector seleccionando los primeros 5 elementos del primer vector
  v1.1 <- v1[1:5]
  v1.1
  #Crear otro vector excluyendo los primeros 100 elementos del primer vector
  v1.2 <- v1[-(1:100)]
  v1.2
  #Crear un nuevo vector con los datos del primer vector mayores o iguales que 99
  v1.3 <- v1[v1>=99]
  v1.3
  #Determinar la clase del primer vector creado en el ejercicio 3 y del cuarto
  v1.4 <- class(v1)
  v1.4
  v1.41 <- class(v4)
  v1.41
  #Transformar la clase del segundo vector a texto
  v1.21 <- as.character(v2)
  v1.21
  
#5 Crear las siguientes listas y realizar las siguiente tareas
  #Crear una lista con los nombres de 5 personas, edad y su altura
  Personas <-list(
    Juanes = list(nombre="Juanes", edad= 19, altura = "165cm"),
    Coco = list(nombre ="Coco", edad= 19, altura = "172cm"),
    Pablo = list(nombre ="Pablo", edad= 20, altura = "177cm"),
    Miguel = list(nombre ="Miguel", edad= 20, altura = "177cm"),
    Dante = list(nombre ="Dante", edad= 19, altura = "184cm")
  )
  Personas
  #Mostrar de dos formas diferentes los atributos de la lista
  M1 <- matrix(unlist(Personas), ncol=5, byrow=FALSE)
  M1
  personas3height <- matrix(Personas$Pablo$altura)
  personas3height
  #Mostrar el segundo elemento de la lista
  personas_2_element <- print(Personas[2])
  #Mostrar el cuarto valor de ese elemento
  personas_4_element <- print(Personas[[2]][[4]]) 
  #Mostrar el ultimo elemento de la primera variable
  personas_last_element<- print(Personas[[1]][[3]])
  
#6 Crear una matriz de 4x4 y realizar las siguientes tareas:
  #Mostrar la matriz en la consola
  matrix.1 <- matrix(10:30, nrow=4, ncol=4, byrow=TRUE)
  matrix.1
  #Extraer los atributos
  atributos.1 <-attributes(matrix.1)
  atributos.1
  #Crear una nueva matriz con las dos primeras filas
  matrix.2 <- matrix.1[1:2,]
  matrix.2
  #Crear una nueva matriz con las dos primeras columnas
  matrix.2.1<- matrix.1[,1:2]
  matrix.2.1
  #Crear una nueva matriz con las dos primeras filas y las tres primeras columnas
  matrix.2.3 <- matrix.1[1:2,1:3]
  matrix.2.3
  #Añadir una nueva columna
  matrix.new <- cbind(matrix.1, "coca")
  matrix.new
  #Añadir una nueva fila
  matrix.new.1 <- rbind(matrix.new, "cola")
  matrix.new.1

#7- Crear un factor con las notas qu se pueden sacar en la universidad(SS, AP, NT,SB, y MH
  #y realizar las siguientes tareas
  #calcular el numero de opciones existentes
  calificaciones<- factor(c("SS", "AP","NT","SB","MH"))
  options<- length(levels(calificaciones))
  options
  #Mostrar los distintos niveles
  calevels<- levels(calificaciones)
  calevels
  #mostrar el tercer nivel
  calevel3<-levels(calificaciones)[3]
  calevel3
  #Sustituir "NT" por "Notable"
  calificaciones_Notable <- gsub("NT","Notable", calificaciones)
  calificaciones_Notable
#8 Crear un DataFrame de 4 variables (Nombre del Jugador, Equipo, Posición y Edad) y 8observaciones (Jugadores) y realizar las siguientes tareas:
  #Visualizarlo por consola
    Jugadores <- data.frame(
      Nombre = c("Ronaldo", "Messi", "Ronaldinho", "Neymar", "Mbappe","Casillas", "Lloris", "Lewandowski"),
      Equipo = c("Madrid", "Barça","Barça","Paris Saint-Germain", "Paris Saint-Germain", "Madrid","Tottenham", "Barça"),
      Posición = c("Delantero", "Mediocampista", "Delantero", "Delantero", "Delantero", "Portero","Portero", "Delantero"),
      Edad = c(38, 36, 43, 31, 24, 42, 36, 35)
    )
  Jugadores
  #contar el numero de filas
  filas <- nrow(Jugadores)
  filas
  #contar el numero de columnas
  columnas <- ncol(Jugadores)
  columnas
  #calcular las dimensiones
  dimensiones <- dim.data.frame(Jugadores)
  dimensiones
  #cambiar el nombre de las variables a (Nombre, Team, Especialidad y Años)
  colnames(Jugadores) <- new_col_names <- c("Nombre", "Team", "Especialidad", "Años")
  Jugadores
  #Seleccionar aquellos jugadores mayores de 25 años
  Jugadores[Jugadores$Años>25,] 
  #Seleccionar aquellos jugadores de menos de 25 años y mayores de 20
  entre20y25 <- subset(Jugadores, Años <25 & Años>20)
  entre20y25
  #Seleccionar aquellos jugadores de menos de 25 años y que sean delanteros
  delantero25 <- subset(Jugadores, Años <25 & Especialidad == "Delantero")
  delantero25
  #Seleccionar aquellos jugadores de menos de 25 o que sean porteros
  portero25 <- subset(Jugadores, Años <25 | Especialidad == "Portero")
  portero25

#9 Crear las siguiented funciones:
  #Determine el area de un circulo 
  Circulo <- function(radius) {
    if (radius<0) {
      return("Usa numeros no negativos")}
    area <- pi*radius^2
    return(area)
  }
  
  area<- Circulo(5)
  area
  area<- Circulo(-1)
  area
  #Determine el area de un rectangulo
  Rectangulo <- function(lado){
    if(lado<0){
      return("Usa numeros no negativos")}
    area2 <- lado^2
    return(area2)
  }
 
  area2<- Rectangulo(-4)
  area2
  area2<- Rectangulo(5)
  area2
  #Resuelva una ecuacion de segundo grado
  Segundo <- function(x){
    resultado <- (x^2+5*x-7)
    return(resultado)
  }
  
  resultado<- Segundo(10)
  resultado
  resultado<- Segundo(-4)
  resultado
  #Determine el perimetro de una circunferencia
  Perimetro <- function(r){
    if(r<0){
      return("Usa numeros no negativos")}
    result <- 2*pi*r
    return(result)
  }
  
  result<- Perimetro(4)
  result
  result<- Perimetro(-100)
  result
#10 Crear una condicion que determine si una letra es vocal o consonante o si se trata de la Y griega
  
  Tipo_de_letra <- function(letra){
    letra<- tolower(letra)
    if (letra %in% c("a","e","i","o","u")){
      result3<- "Es una vocal"
    }else if(letra == "y"){
      result3<- "Es una y griega"
    }else if(letra %in% letters){
      result3<- "Es una consonante"
    }else{
      result3 <- "Verifica que la entrada sea una letra"
    }
    return(result3)
  }
 
  result3<- Tipo_de_letra(1)
  result3
  result3<- Tipo_de_letra("Y")
  result3
  result3 <- Tipo_de_letra("a")
  result3
  result3 <- Tipo_de_letra("b")
  result3
  

  
  
