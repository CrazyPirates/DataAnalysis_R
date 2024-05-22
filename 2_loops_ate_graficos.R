#LOOPS

#For

for (i in seq(13)) {
  print(i)
}

#While

i <- 0
while (i<=10) {
  print(i)
  i = i+1
}
#-----------------------------
#IF
x = -2
if(x>0){
  print("numero positivo")
}else if (x<0){
  print("numero negativo")
}

nota = 10
if(nota >= 7){
  print("APROVADO!")
}else if(nota > 5 && nota < 7){
  print("Recuperação.")
}else{
  print("Reprovado...")
}
#-----------------------------
#FUNÇÕES
par.impar <- function(num){
  if((num %% 2) == 0){
    print("PAR!")
  }else{
    print("IMPAR")
  }
}

num = 10
par.impar(num)
#-----------------------------
#FUNÇÕES APPLY
#apply
?apply

x <- seq(1:9)
matriz <- matrix(x, ncol = 3)
matriz

resultado1 <- apply(matriz, 1, sum)
resultado1

resultado2 <- apply(matriz, 2, sum)
resultado2

#lapply
numeros.p <- c(2,4,6,8,10,12)
numeros.i <- c(1,3,5,7,9,11)
numeros <- list(numeros.p,numeros.i)

numeros

?lapply
lapply(numeros, mean)

?sapply
sapply(numeros, mean)
#-----------------------------
#GRÁFICOS
?mtcars
carros <- mtcars[, c(1,2,9)]

hist(carros$mpg) #histograma (grafico de barras)
plot(carros$mpg, carros$cyl) #dispersão

#usando ggplo2
library(ggplot2)

?ggplot2

ggplot(carros,aes(am))+ #dataset e coluna
  geom_bar()


install.packages("dplyr")
install.packages("tidyr")








