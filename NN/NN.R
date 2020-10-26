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
install.packages("neuralnet")
library(neuralnet)
source("process_input.R")
source("format_output.R")

#nn <- neuralnet(Survived ~ Age + SibSp + Parch + Fare + First + Second + Third + Male + Female + EmbarkedC + EmbarkedQ + EmbarkedS ,data=train,hidden=c(5,3),linear.output=T)
nn <- neuralnet(Survived ~ Age + Fare + First + Second + Third + Male + Female ,data = train,hidden=c(5,3),linear.output=F)
pred <- predict(nn, test)
pred <- ifelse(pred>=0.5,1,0)
format_output(pred, test$GroundTruth)

pred <- predict(nn, train)
pred <- ifelse(pred>=0.5,1,0)
format_output(pred, train$Survived)
