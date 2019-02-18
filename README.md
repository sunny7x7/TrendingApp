




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

![image](visualization/more.png)

## Methodology: Machine Learning ##

***Radom Forest ***

***Multiple Linear Regression***
The StepWise function selects variables sequentially that best fits the model from all possible subset models. 
```js
mod0 = lm(yRatings~1)
mod.upper = lm(yRatings ~ x1Reviews + x2Size + x3Installs + x4Type + x5Price + x6ContentRating + x7LastUpdate + x8AndroidVersion )
step(mod0, scope = list (lower = mod0, upper = mod.upper))

fit= lm(formula = yRatings ~ x7Lu + x4Ty + x1Re + x2Si + x5Pr)
e = yRatings - yhat
plot(yhat, e, xlab = 'Fitted Values', ylab = 'Residual', main = 'Residual vs Fit PREDICTOR RATINGS ')abline(h = 0, lty = 2)
```
Upload a residue plot here


***Final Model: Reduced Rank Forest***


## *Future Work* ##

