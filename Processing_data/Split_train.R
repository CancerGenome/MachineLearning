# Split the traint dataset as two part.

train <- read.csv("Original_train.csv")

random <- runif(nrow(train))
new.train <- train[random>=0.50,]
new.test <- train[random<0.50,]
colnames(new.test)[2] = "GroundTruth"
write.csv(file="train.csv",new.train)
write.csv(file="test.csv",new.test)
