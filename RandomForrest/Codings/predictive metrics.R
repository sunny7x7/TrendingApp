updownfvm <- read.csv("updownfvm.csv", strip.white = TRUE)
library("randomForest")

##########
####SPLITTING DATA INTO TRAIN AND VALID SET
##########
dat1 <- data.frame(updownfvm$Rating, updownfvm$Reviews, updownfvm$Size, updownfvm$Installs,updownfvm$Type, updownfvm$Price, updownfvm$Content.Rating, updownfvm$Last.Updated, updownfvm$Android.Ver)
set.seed(20)
train <- sample(nrow(dat1), nrow(dat1)*4/5, replace= FALSE)
TrainSet <- dat1[train,]
ValidSet <- dat1[-train,]

###RANDOM FOREST PREDICTING RATINGS
model1 <- randomForest(updownfvm.Rating ~ ., data=TrainSet, importance = TRUE)
rating.rf <- randomForest(updownfvm.Rating ~ ., data=TrainSet, mtry = 4, ntree = 500, importance = TRUE) #mse = .19144

which.min(rating.rf$mse)
sqrt(rating.rf$mse[which.min(rating.rf$mse)])

rating.rf
plot(rating.rf)

#### FINDING BEST MTRY VALUE FOR RF ####
# Compare the Out of Bad Sample Error and Error on Test Set
oob.err = double(8)
test.err = double(8)

for(mtry in 1:8)
{
  rf = randomForest(updownfvm.Rating~., data = TrainSet, mtry=mtry, ntree = 500)
  oob.err[mtry] = rf$mse[500] #error of all trees fitted
  
  pred <- predict(rf,ValidSet)
  test.err[mtry] = with(ValidSet, mean((updownfvm.Rating - pred)^2)) #mean squared error test
  
  cat(mtry," ") #printing the output to the console
}

test.err
oob.err

matplot(1:mtry, cbind(oob.err,test.err),pch=19, col = c("red","blue"),type = "b", ylab = "Mean Squared Error", xlab = "Number of Predictors Considered at each Split")
legend("topright",legend=c("Out of Bag Error","Test Error"),pch=19,col=c("red","blue"))
### error seems to be minimized at mtry = 4


###PREDICTING RATINGS###
predTrain <- predict(rating.rf, TrainSet, type = "class")
# Checking regression accuracy
table(predTrain, TrainSet$updownfvm.Rating)
# Predicting on Validation Set
predValid <- predict(rating.rf, ValidSet, type = "class")
# checking regression accuracy 
abs(mean(((ValidSet$updownfvm.Rating-predValid)/ValidSet$updownfvm.Rating))) #model is 98.33% accurate
table(predValid,ValidSet$updownfvm.Rating)

####OPTIONAL COMPARING WITH DECISION TREE######
#Compare with Decision Tree
install.packages("rpart")
install.packages("caret")
install.packages("e1071")

library(rpart)
library(caret)
library(e1071)

# We will compare model1 of RF with Decision Tree
model_dt = train(updownfvm.Rating ~ ., data = TrainSet, method = "rpart")
model_dt_1 = predict(model_dt, data = TrainSet)
table(model_dt_1, TrainSet$updownfvm.Rating)
abs(mean(((TrainSet$updownfvm.Rating-model_dt_1)/TrainSet$updownfvm.Rating)))  #about 97% accuracy

# Running on Validation Set
model_dt_vs = predict(model_dt, newdata = ValidSet)
table(model_dt_vs, ValidSet$updownfvm.Rating)
abs(mean(((ValidSet$updownfvm.Rating-model_dt_vs)/ValidSet$updownfvm.Rating)))   #about 97% accuracy


#### shows that RF is more powerful than using decision tree ####

########################
########################
########################

library("randomForest")

###RANDOM FOREST PREDICTING INSTALLS
installs.rf <- randomForest(updownfvm.Installs ~ ., data=TrainSet, mtry = 4, ntree = 500, importance = TRUE) #mse value = 1.09599e+15

which.min(installs.rf$mse)
sqrt(installs.rf$mse[which.min(installs.rf$mse)])

#### FINDING BEST MTRY VALUE FOR RF ####
# Compare the Out of Bad Sample Error and Error on Test Set
oob.err2 = double(8)
test.err2 = double(8)

for(mtry in 1:8)
{
  rf2 = randomForest(updownfvm.Installs~., data = TrainSet, mtry=mtry, ntree = 500)
  oob.err2[mtry] = rf2$mse[500] #error of all trees fitted
  
  pred2 <- predict(rf2,ValidSet)
  test.err2[mtry] = with(ValidSet, mean((updownfvm.Installs - pred2)^2)) #mean squared error test
  
  cat(mtry," ") #printing the output to the console
}

test.err2
oob.err2

matplot(1:mtry, cbind(oob.err2,test.err2),pch=19, col = c("red","blue"),type = "b", ylab = "Mean Squared Error", xlab = "Number of Predictors Considered at each Split")
legend("topright",legend=c("Out of Bag Error","Test Error"),pch=19,col=c("red","blue"))
### error seems to be minimized at mtry = 4

###PREDICTING INSTALLS###
predTrain2 <- predict(installs.rf, TrainSet, type = "class")
# Checking regression accuracy
table(predTrain2, TrainSet$updownfvm.Installs)
# Predicting on Validation Set
predValid2 <- predict(installs.rf, ValidSet, type = "class")
# checking regression accuracy 
mean((abs(predValid2-ValidSet$updownfvm.Installs)/ValidSet$updownfvm.Installs)) #model has 138105% error yikers 
table(predValid2,ValidSet$updownfvm.Installs)

diff <- ValidSet$updownfvm.Installs-predValid2
avg <- diff/ValidSet$updownfvm.Installs
mean(avg)