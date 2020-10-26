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

## Declare library
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
set.seed(1234)

## Input file
source("process_input.R")
source("format_output.R")

# Grow the decision tree, first. 
print("Tree with Sex Age Pclass and Fare, and gradually prune tree")

#dtree <- rpart(Survived ~ Sex + Original_Age + Pclass + Fare , data=train)
dtree <- rpart(Survived ~ Sex + Original_Age + First + Second + Third , data=train)
seq <- seq(0,0.1,0.01)
rec_test <- rep(0,length(seq))
rec_train <- rep(0, length(seq))
i = 1
for (i in 1:length(seq)){
  dtree.prune <- prune(dtree, cp = seq[i])
  dtree.pred <- predict(dtree.prune, test)
  #print(range(dtree.pred))
  pred <- ifelse(dtree.pred < 0.5, 0, 1)
  rec_test[i] = error_rate(pred, test$GroundTruth)
  
  dtree.pred <- predict(dtree.prune, train)
  pred <- ifelse(dtree.pred < 0.5, 0, 1)
  rec_train[i] = error_rate(pred, train$Survived)
  
}
plot(seq, rec_test, ylim = c(0.15,0.25), pch = 16, col= "red", type = "b", xlab = "Prune Threshold", ylab ="Error Rate", main ="Error Rate for test and train(Decision Tree)")
points(seq, rec_train, pch = 15, col ="black", type = "b" )
legend("top",c("test","train"), pch =c(16,15), col=c("red","black"))
prp(dtree ,type=2, fallen.leaves = T, main ="Decision Tree without Purne")