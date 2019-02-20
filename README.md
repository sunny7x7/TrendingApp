
![Alt Text](https://thumbs.gfycat.com/UntimelyFrankFattaileddunnart-small.gif)
# TrendingApp #



_**Abstract**_

This project focuses on studying the different methods of machine learning to determine the best possible way to predict the indicator point to a successful Google App. Our main objective of the research is to understand the construction and functionality of Google application to help applications hit the market as a “trendy app”.We executed Machine Learning/Modeling procedures through Rstudio packages such as Reduced Rank Regression ([RRR package](https://github.com/chrisaddy/rrr)) and Random Forest ( [Random Forest package](https://github.com/cran/randomForest) ) and Mass([Stepwise Function](https://github.com/cran/MASS/blob/master/R/stepAIC.R)) . For analytical purposes, we used packages like ([ggplot2](link here)) to create the best informative and colorfully stimulating graphs that can be understood in one setting. 


***Contributors***

*  Sung Hee (Sunny) Hong
 
* Ishana Narayanan


***Motivation***


## Methodology: Data Cleaning ##

***Removing "NA" (Missing Values)***

***Change size Column***

***Converting Categorical data***

***Adding Extra column for analysis***


## Methodology: Analysis & Research ##
- maybe what makes an app successful 

## Methodology: Visualization ##
All of our data visualization were proceeded with numerical variables (Reviews,Type,Price, Content Rating, Last Updated, Android Ver) to help us recognize patterns and derive meanings from it. 

**1. Number of Data Entries per Category** 

**Findings:** Game and Family category have the most number of the applications in the store. 



Ishana has the graphs

 
**2. Matrix Scatter Plot**

**Findings:** 
The level of correlation is color coordinated from highest to lowest.
(Red, Yellow, Blue) We also added more columns such as Ratings x Installs to observe the analyze the relation. 




Ishana has the graphs 




**3. Ratings vs. Installs** 

**Findings:** Where the intensity of most points are located in. 

![pic](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/more.png) 







## Methodology: Machine Learning ##
**Introduction**




***Random Forest***














***Multiple Linear Regression***
Multiple linear regression is a technique to explain the relationship between one Y value (response value or installs) and two or more X values (predictor value). The StepWise function helps select variables sequentially that best fits the model from all possible subset models. 


 We are using Ratings as our predictor value here.
```js
mod0 = lm(yRatings~1)
mod.upper = lm(yRatings ~ x1Reviews + x2Size + x3Installs + x4Type + x5Price + x6ContentRating + x7LastUpdate + x8AndroidVersion )
step(mod0, scope = list (lower = mod0, upper = mod.upper))

fit= lm(formula = yRatings ~ x7Lu + x4Ty + x1Re + x2Si + x5Pr)
e = yRatings - yhat
plot(yhat, e, xlab = 'Fitted Values', ylab = 'Residual', main = 'Residual vs Fit PREDICTOR RATINGS ')+ abline(h = 0, lty = 2)
```

![pic](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/MultiResidual.png)


 We are using Installs as our predictor value here.
The second residual plot is done after log transformation method. 
 
```js
mod0 = lm(x3In~1)
mod.upper = lm( x3In~ yRatings + x1Re + x2Si + x4Ty + x5Pr + x6Cr + x7Lu + x8Av )
step(mod0, scope = list (lower = mod0, upper = mod.upper))

fit= lm(formula = x3In ~ x1Re)

yhat=fitted(fit)
e = yRatings - yhat
plot(yhat, e, xlab = 'Fitted Values', ylab = 'Residual', main = 'Residual vs Fit. PREDICTOR INSTALLS ') + abline(h = 0, lty = 2)
summary(fit)
```

![pic](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/INSTALLSVS.png)









***Final Model: Reduced Rank Regression***

Reduced Rank Regression is a method in multivariate regression that uses the method of reduced rank restriction on the coefficient matrix. Reduced Rank Regression work with model where there are multiple Y outcome and multiple X inputs. 


This model is useful in helping us predict multiple Y values by shrinking the variations created by the functional relationship between the Y values. Therefore, we will be using this model to predict the Y values (Ratings and Installs) with the rest of numerical x values. 






```js
#install.packages("rrr")
dat7<- read.csv("fvm2.csv")

#Data extracted with just numerical values 
datY<-data.frame(dat7$Rating,dat7$Installs)
datX<-data.frame(dat7$Reviews, dat7$Size,dat7$Type, dat7$Price, dat7$Content.Rating, dat7$Last.Updated, dat7$Android.Ver)


datyy<-datY[,1:2]
datxx<- datX[,3:7]
rrr<-rrr::rrr( datxx , datyy ,rank=1)
rrr
```

 








## *Future Work* ##

In conclusion, our reduced rank regression model needs further improvement. Due to the limited information online about this modeling method, we are in the process of researching. We will also be working on performance metrics for random forest, multilinear regression, and reduced rank models to present summaries and key results. To persuade that our project outcome is significant,  we are planning to learn how to analyze our numerical summaries and model to communicate our key results and analysis to our audience.  



