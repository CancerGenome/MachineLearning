# This is the script used for processing raw input. 
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

# Read input.
train <- read.csv("train.csv")
test <- read.csv("test.csv")

# Remove unusful information first, as they have no contribution to the prediction 
remove.attribute <- c("Cabin", "Name", "Ticket","X","PassengerId")
train <- train[,!(names(train) %in% remove.attribute)]
test <- test[,!(names(test) %in% remove.attribute)]

# First remove NA, 
train <- train[!is.na(train$Age),]
test <- test[!is.na(test$Age),]

#apply(train,2,function(x) sum(is.na(x)))
#apply(test,2,function(x) sum(is.na(x)))

# Binary vector, and re-scale the input for train
train$First <- ifelse(train$Pclass ==1,1,0)
train$Second <- ifelse(train$Pclass ==2,1,0)
train$Third <- ifelse(train$Pclass ==3,1,0)
train$Male <- ifelse(train$Sex =="male",1,0)
train$Female <- ifelse(train$Sex =="male",1,0)
train$Original_Age <- train$Age
train$Age <- (train$Age - min(train$Age))/(max(train$Age)- min(train$Age))
train$Fare <- (train$Fare - min(train$Fare))/(max(train$Fare)- min(train$Age))
train$EmbarkedC <- ifelse(train$Embarked =="C",1,0)
train$EmbarkedQ <- ifelse(train$Embarked =="Q",1,0)
train$EmbarkedS <- ifelse(train$Embarked =="S",1,0)

# Binary vector, and re-scale the input for test. 
test$First <- ifelse(test$Pclass ==1,1,0)
test$Second <- ifelse(test$Pclass ==2,1,0)
test$Third <- ifelse(test$Pclass ==3,1,0)
test$Male <- ifelse(test$Sex =="male",1,0)
test$Female <- ifelse(test$Sex =="male",1,0)
test$Original_Age <- test$Age
test$Age <- (test$Age - min(test$Age))/(max(test$Age)- min(test$Age))
test$Fare <- (test$Fare - min(test$Fare))/(max(test$Fare)- min(test$Age))
test$EmbarkedC <- ifelse(test$Embarked =="C",1,0)
test$EmbarkedQ <- ifelse(test$Embarked =="Q",1,0)
test$EmbarkedS <- ifelse(test$Embarked =="S",1,0)
