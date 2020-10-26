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

train <- read.csv("train.csv")
test <- read.csv("test.csv")
# Remove unusful information first, as they have no contribution to the prediction 
remove.attribute <- c("Cabin", "Name", "Ticket")
train <- train[,!(names(train) %in% remove.attribute)]

library(randomForest)
set.seed(1234)
fit.forest <- randomForest(Survived ~ ., data=train,
                           #na.action=na.roughfix,
                           importance=TRUE)
# Handle NA problem