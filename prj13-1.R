library(readr)
A <- read.csv("C:/Users/이보나/Downloads/wk13_birthdata.csv")
str(A)

A$low <- ifelse(A$birthweight < 3.2, 1, 0)
A$low <- as.factor(A$low)
A$gender <- as.factor(A$gender)

set.seed(100)

id_test <-sample(1:nrow(A), round(nrow(A)*0.1))
data_test <- A[id_test,]
data_train <- A[setdiff(1:nrow(A), y=id_test), ]

library(randomForest)

RF_model <- randomForest(data=data_train,
                         low ~ gender + father_age + mother_age + together_year,
                         ntree=25)
print(RF_model)

varImpPlot(RF_model)

pred=predict(RF_model, data_test)

library("caret")
confusionMatrix(pred, data_test$low)

RF_model2 <- randomForest(data=data_test,
                         low ~ gender + father_age + mother_age + together_year,
                         ntree=25)
print(RF_model2)