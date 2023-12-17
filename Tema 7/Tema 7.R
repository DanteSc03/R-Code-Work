library(httr)
library(XML)
library(rvest)


#1. Extraer una tabla de una URL.
url = "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60073/"
url <- GET(url)
datos = readHTMLTable(rawToChar(url$content), header=TRUE, which=8, stringsAsFactors=F)
View(datos)

url = "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60073/"
url <- GET(url)
datos = readHTMLTable(rawToChar(url$content), header=TRUE, stringsAsFactors=F)
cali= datos[[8]]
View(cali)



#2. Extraer todas las tablas de una URL (es necesario que exista más de una).
url = "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60073/"
url <- GET(url)
datos = readHTMLTable(rawToChar(url$content), header=TRUE, stringsAsFactors=F)
View(datos)


#3. Extraer en un bucle varias tablas de URLs distintas.
urls <- c("https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60073/",
         "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60065/",
         "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60025/",
         "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60049/",
         "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60035/",
         "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60075/",
         "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60027/",
         "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60077/",
         "https://california.reaproject.org/analysis/comparative-trends-analysis/population/tools/60000/60089/")

for (url in urls) {
  print(url)
  page <- read_html(url)
  tables <- page %>% html_table()
    for (i in 1:length(tables)) {
      print(tables[[i]])
    }
  }




