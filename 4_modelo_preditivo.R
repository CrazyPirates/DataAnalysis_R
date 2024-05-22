#PREVENDO DIABETES
#OBETENÇÃO DE DADOS
diabetes <- read.csv(file = "C:/Users/HOME/Downloads/diabetes.csv")
View(diabetes)

#PREPARANDO OS DADOS
str(diabetes)
colSums(is.na(diabetes))
table(diabetes$Outcome)

?as.factor
diabetes$Outcome <- as.factor(diabetes$Outcome)

summary(diabetes$Insulin)
boxplot(diabetes$Insulin)
hist(diabetes$Insulin)

diabetes2 <- diabetes %>% 
  filter(Insulin <= 250)

#ANÁLISE EXPLORATÓRIA
library(dplyr)
boxplot(diabetes2)

summary(diabetes2$Insulin)
boxplot(diabetes2$Insulin)

hist(diabetes2$Pregnancies)
hist(diabetes2$Age)
hist(diabetes2$BMI)

#CRIANDO MODELO PREDITIVO
install.packages("caTools")
library(caTools)

?set.seed
set.seed(123)
index = sample.split(diabetes2$Pregnancies, SplitRatio = .70)
index

train = subset(diabetes2, index == TRUE)
test = subset(diabetes2, index == FALSE)

dim(diabetes2)
dim(train)
dim(test)

install.packages("caret")
install.packages("e1071")
library(caret)
library(e1071)

?caret::train

caret::train

modelo <- train(Outcome ~., data = train, method = "knn")

modelo$results
modelo$bestTune

modelo2 <- train(Outcome ~., data = train, method = "knn",
                 tuneGrid = expand.grid(k = c(1:20)))

modelo2$results
modelo2$bestTune

plot(modelo2)

modelo3 <- train(Outcome ~., data = train, method = "naive_bayes")

modelo3$results
modelo3$bestTune


set.seed(100)
modelo4 <- train(Outcome ~., data = train, method = "svmRadialSigma",
                 preProcess = c("center"))
modelo4$results
modelo4$bestTune

?predict
previsao <- predict(modelo3, test)
previsao1 <- predict(modelo4, test)
previsao

caret::confusionMatrix
confusionMatrix(previsao, test$Outcome)
confusionMatrix(previsao1, test$Outcome)

novos.dados <- data.frame(
  Pregnancies = c(2),
  Glucose = c(111.50),
  BloodPressure = c(70),
  SkinThickness = c(20),
  Insulin = c(47.49),
  BMI = c(30.80),
  DiabetesPedigreeFunction = c(0.34),
  Age = c(50)
)

novos.dados

previsao <- predict(modelo4, novos.dados)
resultado <- ifelse(previsao == 1, "Positivo", "Negativo")
print(resultado)










