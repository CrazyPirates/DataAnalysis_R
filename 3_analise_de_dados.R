#OBTENÇÃO DOS DADOS
viagens <-  read.csv(file = "C:/Users/HOME/Downloads/2019_Viagem.csv",
                     sep = ";",
                     dec = ",") #lembrar de salvar o csv como UTF-8
head(viagens)
View(viagens) #melhor jeito

summary(viagens)
summary(viagens$Valor.passagens)

library(dplyr)
glimpse(viagens)

#TRANSFORMAÇÃO DOS DADOS
?as.Date
viagens$data.inicio <- as.Date(viagens$Período...Data.de.início, "%d/%m/%y")
glimpse(viagens)

?format
viagens$data.inicio.formatada <- format(viagens$data.inicio, "%Y-%m")
viagens$data.inicio.formatada

#ANALISE EXPLORATORIA
hist(viagens$Valor.passagens)

summary(viagens$Valor.passagens) #mts outliers (dados fora do normal)

boxplot(viagens$Valor.passagens) # da para ver os outliers

sd(viagens$Valor.passagens)

?is.na
?colSums
?prop.table

colSums(is.na(viagens))

str(viagens$Situação) #tipos de dados
table(viagens$Situação) #verificar as qtds de ocorrencias
prop.table(table(viagens$Situação))*100

prop.table(table(viagens$Situação))

#VISUALIZAÇAO DE DADOS 1

#Qual orgao gastou mais em viagens?

p1 <- viagens %>% 
  group_by(Nome.do.órgão.superior) %>% #agrupar pelas colunas dos orgaos
  summarise(n = sum(Valor.passagens)) %>% #somar o valor gasto por orgao
  arrange(desc(n)) %>% #arranjar os dados em forma descrescente
  top_n(15) #mostrar os 15 orgaos que gastam mais

#alterando nome das colunas
names(p1) <- c("orgão", "valor")
p1

#plotando com ggplot
library(ggplot2)
ggplot(p1, aes(x = reorder(orgão, valor), y = valor))+
  geom_bar(stat = "identity")+
  coord_flip()+
  labs(x="valor", y="orgãos")

#Valores gastos por cidade
p2 <- viagens %>%
  group_by(Destinos) %>%
  summarise(n = sum(Valor.passagens)) %>%
  arrange(desc(n)) %>%
  top_n(15)

#Alterando o nome das colunas
names(p2) <- c("destino", "valor")
p2

#Criando o gráfico
ggplot(p2, aes(x = reorder(destino, valor), y = valor))+
  geom_bar(stat = "identity", fill = "#FFD700")+
  geom_text(aes(label = valor), vjust = 0.3, size = 3)+
  coord_flip()+
  labs(x = "Valor", y = "Destino")

#viagens realizadas por mes
p3 <- viagens %>% 
  group_by(data.inicio.formatada) %>% 
  summarise(qtd = n_distinct(Identificador.do.processo.de.viagem))

head(p3)

ggplot(p3, aes(x = data.inicio.formatada, y = qtd, group = 1))+
  geom_line()+
  geom_point()

#VISUALIZAÇAO DE DADOS II

install.packages("rmarkdown")
install.packages("tinytex")

tinytex::install_tinytex()














