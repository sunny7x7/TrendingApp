updownfvm <- read.csv("updownfvm.csv", strip.white = TRUE)
library("randomForest")
require("randomForest")

###RANDOM FOREST PREDICTING RATINGS
dat1 <- data.frame(updownfvm$Rating, updownfvm$Reviews, updownfvm$Size, updownfvm$Installs,updownfvm$Type, updownfvm$Price, updownfvm$Content.Rating, updownfvm$Last.Updated, updownfvm$Android.Ver)
set.seed(02102000)
train <- sample(rownames(dat1), nrow(dat1)*4/5)
rating.rf <- randomForest(dat1$updownfvm.Rating ~ ., data=dat1, subset = train, ntree = 500)

###PREDICTING RATINGS
set.seed(20)
sample1 <- sample(rownames(dat1), nrow(dat1)*1/5)
table(sample1)
prediction <- predict(rating.rf, newdata = sample1)
table(prediction, sample1$Rating)

table(sample1) ###i think i have to convert from dataframe to normal data
colnames(sample1)

###RANDOM FOREST PREDICTING INSTALLS
dat3 <- data.frame(updownfvm$Rating, updownfvm$Reviews, updownfvm$Size, updownfvm$Installs,updownfvm$Type, updownfvm$Price, updownfvm$Content.Rating, updownfvm$Last.Updated, updownfvm$Android.Ver)
set.seed(02102000)
train <- sample(rownames(dat3), nrow(dat3)*4/5)
rating2.rf <- randomForest(dat3$updownfvm.Installs ~ ., data=dat3, subset = train, ntree = 500)

###PREDICTING INSTALLS
set.seed(20)
sample2 <- sample(rownames(dat3), nrow(dat3)*1/5)
prediction <- predict(rating.rf, newdata = sample2)
table(prediction, sample2$Rating)
