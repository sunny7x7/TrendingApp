updownfvm <- read.csv("updownfvm.csv", strip.white = TRUE)
library("randomForest")
require("randomForest")

ish <- data.frame(updownfvm$Rating, updownfvm$Reviews, updownfvm$Size, updownfvm$Installs,updownfvm$Type, updownfvm$Price, updownfvm$Content.Rating, updownfvm$Last.Updated, updownfvm$Android.Ver)
set.seed(02102000)
train <- sample(rownames(ish), nrow(ish)*4/5)
rating.rf=randomForest(ish$updownfvm.Rating ~ ., data=ish, subset = train)
rating.rf

plot(rating.rf)

library("party")
cforest(updownfvm.Rating ~ ., data=ish, controls=cforest_control(mtry=2, mincriterion=0))

library("tree")
tr <- tree(ish$updownfvm.Rating ~ ., data = ish)
tr

tr2 <- getTree(rating.rf, 1, labelVar=TRUE)
plot(tr2)

install.packages("rpart")
library("rpart")

ishh <- rpart(Rating ~ Reviews+Size+Installs+Type+Price+Content.Rating+Last.Updated+Android.Ver, method = "class", data=updownfvm)
printcp(ishh)
plotcp(ishh)
summary(ishh)

plot(ishh, uniform=TRUE, 
     main="Random Forest")
text(ishh, use.n=TRUE, all=TRUE, cex=.8)