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

install.packages("e1071")
library(e1071)
set.seed(1234)
source("process_input.R")
source("format_output.R")

#fit.svm <- svm(Survived ~ Age + SibSp + Parch + Fare + First + Second + Third + Male + Female + EmbarkedC + EmbarkedQ + EmbarkedS, data= train)
#pred.svm <- predict(fit.svm, test)
#out <- ifelse(pred.svm >= 0.5, 1, 0)
#format_output(out, test$GroundTruth)
#format_output(out, train$Survived)

fit.svm <- svm(Survived ~ Age + SibSp + Parch + Fare + First + Second + Third + Male + Female, data= train, kernel="radial")
pred.svm <- predict(fit.svm, test)
out <- ifelse(pred.svm >= 0.5, 1, 0)
format_output(out, test$GroundTruth)

pred.svm <- predict(fit.svm, train)
out <- ifelse(pred.svm >= 0.5, 1, 0)
format_output(out,train$Survived)
