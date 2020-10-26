# 02/09/2019, by Yu Wang
# Used for titanic kaggle competetions.

# Data Dictionary
# Variable      Definition      Key
# survival      Survival        0 = No, 1 = Yes
# pclass        Ticket class    1 = 1st, 2 = 2nd, 3 = 3rd
# sex   Sex
# Age   Age in years
# sibsp # of siblings / spouses aboard the Titanic
# parch # of parents / children aboard the Titanic
# ticket        Ticket number
# fare  Passenger fare
# cabin Cabin number
# embarked      Port of Embarkation     C = Cherbourg, Q = Queenstown, S = Southampton
#install.packages("caret")
#install.packages("e1071")
#library(caret)
#library(e1071)
library(class)
source("process_input.R")
source("format_output.R")

# All factors on both test and train data 
subset <- c("Age","SibSp","Parch","Fare","First","Second","Third","Male","Female","EmbarkedC","EmbarkedQ","EmbarkedS")
i = 1
rec_test <- rep(0,10)
rec_train <- rep(0,10)
for(i in 1:10 ){
  knn <- knn(train[,subset], test[,subset], train$Survived, k = i)  
  rec_test[i] <- error_rate(knn, test$GroundTruth)
  knn <- knn(train[,subset], train[,subset], train$Survived, k = i)  
  rec_train[i] <- error_rate(knn,train$Survived)
}
plot(rec_test, main = "KNN Error Rate on Train/Test Data", xlab ="K", ylab = "Error Rate", ylim=c(0,0.5), pch = 16, type ="b")
points(cbind(1:10, rec_train), col ="red",pch = 15, type="b")
legend("top",c("Test","Train"),col=c("black","red"),pch = c(16,15))

# Use fewer factors.
subset <- c("Age","Fare","First","Second","Third","Male","Female","EmbarkedC","EmbarkedQ","EmbarkedS")
subset <- c("Age","Fare","First","Second","Third","Male","Female")
i = 1
rec_test <- rep(0,10)
rec_train <- rep(0,10)
for(i in 1:10 ){
  knn <- knn(train[,subset], test[,subset], train$Survived, k = i)  
  rec_test[i] <- error_rate(knn, test$GroundTruth)
  knn <- knn(train[,subset], train[,subset], train$Survived, k = i)  
  rec_train[i] <- error_rate(knn,train$Survived)
}
plot(rec_test, main = "KNN Error Rate on Train/Test Data", xlab ="K", ylab = "Error Rate", ylim=c(0,0.5), pch = 16, type ="b")
points(cbind(1:10, rec_train), col ="red",pch = 15, type="b")
legend("top",c("Test","Train"),col=c("black","red"),pch = c(16,15))
