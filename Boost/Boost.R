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
install.packages("gbm")
library(gbm)
source("format_output.R")
source("process_input.R")

# Prediction
gbm1 <- gbm(Survived ~Sex + Original_Age + First + Second + Third ,data = train, n.trees = 10000, distribution = "multinomial")
summary(gbm1)
n.trees = seq(from = 1 ,to=10001, by=100) #no of trees-a vector of 100 values 
i = 1
rec_test <- rep(0,length(n.trees))
rec_train <- rep(0,length(n.trees))
for(i in 1:length(n.trees)){
  predmatrix <- predict(gbm1,test,n.trees = n.trees[i])
  out <- ifelse(predmatrix[,1,]> predmatrix[,2,], 0, 1)
  rec_test[i] <- error_rate(out, test$GroundTruth)
  
  predmatrix <- predict(gbm1,train,n.trees = n.trees[i])
  out <- ifelse(predmatrix[,1,]> predmatrix[,2,], 0, 1)
  rec_train[i] <- error_rate(out, train$Survived)
}
plot(n.trees, rec_test, ylim = c(0.1,0.25), pch = 16, col= "red", type = "b", xlab = "Tree #", ylab ="Error Rate", main ="Error Rate for test and train(Boosting DT)")
points(n.trees, rec_train, pch = 15, col ="black", type = "b" )
legend("top",c("test","train"), pch =c(16,15), col=c("red","black"))
