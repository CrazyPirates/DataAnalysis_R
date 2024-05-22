# VETORES
cidades <- c("Paranavaí",
             "Maringá",
             "São Carlos do Ivaí")
cidades

temperatura <- c(27, 36, 19, 0)
regiao <- c(1, 2, 3, 4)

?c()

#Acessando o primeiro elemento
cidades[1]

#Acessando um Intervalo
temperatura[1:3]

#Copiando uma variavel
cidades2 <- cidades
cidades2

temperatura2 <- temperatura 
temperatura2

#Excluindo uma variável
temperatura2[-2]

#Alterando um vetor
cidades2[3] <- "Guairaça"
cidades2

#Adicionar um elemento
cidades2[4] <- "Loanda"
cidades2

#Deletar um vetor

letras <- c("a", "b", "c", "d")
letras = NULL
letras
#--------------------------------------
#FATORES
?factor
UF <- factor(c("PR","SP", "MT", "SC"))
UF

#fatores ordenados
grau.instrucao <- factor(c("Fundamental", "Fundamental II", 
                           "Ensino Medio", "Superior"),
                  levels = c("Fundamental", "Fundamental II", 
                             "Ensino Medio", "Superior"),
                  ordered = TRUE)
grau.instrucao

estados = factor(c("Rio Grande do Sul", "Santa Catarina", "Paraná"), 
                 levels = c("Rio Grande do Sul", "Santa Catarina", "Paraná"), 
                 ordered = TRUE)
estados
#--------------------------------------
#LISTAS
?list
pessoa <- list(sexo = "M", idade = 17, altura = 1.71)
pessoa

#editando uma lista
pessoa[["sexo"]] <- "F"
pessoa

#deletando um elemento
pessoa[["altura"]] <- NULL
pessoa

#filtrar uma lista
pessoa[c("sexo", "idade")]

#lista de listas
cidades[4] <- "Cornélio Procópio"
lista <- list(UF = UF,
              cidades = cidades,
              regiao = regiao)
lista

#--------------------------------------
#DATA FRAME
#com vetores
cidades[4] <- "Cornélio Procópio"
df <- data.frame(cidades, temperatura)
df

#com listas
df2 <- data.frame(lista)
df2

#filtrando
#valor 1 da 2 coluna
df2[1,2]

#qualquer valor da 3 coluna
df2[,3]

#valor 3 de qualquer coluna
df2[3,]


#selecionando as 3 primeiras linhas
#da 1 e 3 coluna
df2[c(1:3), c(1,3)]

#nome das colunas
names(df2)
#linhas x colunas (dimensões)
dim(df2)
#tipos de dados
str(df2)
#acessar uma coluna (2 jeitos)
df2$cidades
df2["cidades"]

#------------------------------------
#MATRIZES
?matrix
m <- matrix(seq(1:9), nrow = 3)
m

m2 <- matrix(seq(1:25), 
             ncol = 5, 
             byrow = TRUE, 
             dimnames = list(c(seq(1:5)), 
                             c('A', 'B', 'C', 'D', 'E')))
m2

#filtrando
#duas primeiras linhas das colunas B e C
m2[c(1:2), c('B','C')]





