![Alt Text](https://thumbs.gfycat.com/UntimelyFrankFattaileddunnart-small.gif)

# Trendy Apps #

***Contributors***

*  **Sung Hee (Sunny) Hong**
*  **Ishana Narayanan**


_**Abstract**_

This project focuses on studying the different methods of machine learning to determine the best possible way to predict the indicator point to a successful Google App. Our main objective of the research is to understand the construction and functionality of Google application to help applications hit the market as a “trendy app”. We executed Machine Learning/Modeling procedures through Rstudio packages such as Reduced Rank Regression ([RRR package](https://github.com/chrisaddy/rrr)) and Random Forest ([Random Forest package](https://github.com/cran/randomForest)) and Mass ([Stepwise Function](https://github.com/cran/MASS/blob/master/R/stepAIC.R)). For analytical purposes, we used packages like ([ggplot2](https://github.com/tidyverse/ggplot2)) to create the best informative and colorfully stimulating graphs that can be understood in one setting.
For simpler graphs, we used Tableau. 


***Motivation***

An average of 6,140 apps are created and uploaded to Google Play Store daily. With this rapidly growing industry, it would be helpful for the developer to understand what features of an app make it successful, specifically what features will return high ratings and high number of installs. Thus, we want to construct a model to help both individuals and companies make better choices when it comes to developing apps to maximize revenues and user experience. 




## Methodology: Collecting Data ##

***Kaggle***

To begin, we searched Kaggle for a data set which has a variety of features regarding popular apps. We found the data set “Google Play Store Apps,” which contains 10,841 rows and 13 columns. Details about the information within each column is listed below.

![](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/Screen%20Shot%202019-02-19%20at%209.25.13%20PM.png)
![](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/Screen%20Shot%202019-02-19%20at%209.26.24%20PM.png)

* **List of Category**- Category which the app belongs to
  * _Art and Design, Auto and Vehicles, Beauty, Books and Reference, Business, Comics, Communication, Dating, Education, Entertainment, Events, Finance, Food and Drink, Health and Fitness, House and Home, Libraries and Demo, Lifestyle, Game, Family, Medical, Social, Shopping, Photography, Sports, Travel and Local, Tools, Personalization, Productivity, Parenting, Weather, Video Players, News and Magazines, Maps and Navigation_



## Methodology: Data Cleaning ##

***Removing "NA" (Missing Values)***

After downloading the csv file, we removed 44 rows of data which contained NA values that could not have otherwise been replaced.

***Removing "+" Sign in Installs Column***

The installs column originally had a plus sign at the end of each value, so we can use strsplit to remove this symbol. 

***Converting Columns to Numerical Data***

 * **Size Column**
 
 Here, “M” or “k” following the numeric values were removed, and the numbers were scaled to their actual size. For example, data entry 5.6M was converted to 5,600,000. Lastly, NA values were also replaced with the mean size sorted by category.

 We changed each category’s Size column missing value to the mean of that category size. 

 * **Content Rating**
 
 Change content rating column to numerical values. 
    
    * Everyone =1
    * Everyone+10 =2
    * Teen =3
    * Mature 17+ =4
    * Adults Only 18+ =5

 * **Last Update**

Converted month to its corresponding numeric value and removed the dash between the day, month, and year. 
 
 * **Android Version**
 
Deleted the period between the version numbers and replaced NA values with the average Android Version sorted by category. 



## Methodology: Analysis & Research ##
Through research, we found out that the best indicator point of a successful app from our data set was either Installs or Rating column.
We started off with having two different models for cases when the response value was Rating or Installs. We used this method for Random Forest and Multilinear regression line. We've also tried multiplying Installs and Ratings to be our indicator point, but departed from that idea due to complexity when communicating to our audience. Therefore, as one of our choice for the final model, we have decided to try out Reduced Rank Regression. Reduced Rank Regression line allows us to keep both Installs and Rating as our response value (dependent value). 

... more to come 

## Methodology: Visualization ##
All of our data visualization were proceeded with numerical variables (Reviews,Type,Price, Content Rating, Last Updated, Android Ver) to help us recognize patterns and derive meanings from it. 



**1. Number of Data Entries per Category** 

**Findings:** Game and Family category have the most number of the applications in the store. 

![](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/number%20of%20data%20entries%20per%20category.png)
 
**2. Matrix Scatter Plot**

**Findings:** 
To get a better indication about relationship between Rating and Installs, we created a new column in our data set called RatInst which multiplies the values in Rating by that of Installs. This way, we can compare this new value to that of others in our data set. We did the same for Rating and Reviews (RR) as well as Installs and Reviews (InstRev). Below is a colored correlation matrix where red, yellow, and blue is the order of correlation from highest to lowest. 

![](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/colorful%20scatterplot%20fvm.png)




**3. Ratings vs. Installs** 

**Findings:** Where the intensity of most points are located in. 
![pic](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/more.png) 




## Methodology: Machine Learning ##


***Random Forest***

Random Forest model for regression uses the concept of a decision tree to make predictions about an output given certain inputs. This model works by constructing hundreds of trees, each with their own specific output, and averages these outputs to given a finalized prediction value. In general, a higher number of trees results in a more accurate prediction. 

Before building our random forest model, we implemented upsampling and downsampling techniques to balance the amount of data in each category. 

With this modified data set, we constructed two random forest models, one to predict the rating and another to predict the number of installs.


As the number of trees in the forest increases, the predicted value for rating and number of installs becomes more accurate.

![](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/Rplot%20side%20by%20side%20final.png)

...more to come


***Multiple Linear Regression***

Multiple linear regression is a technique to explain the relationship between one Y value (response value or installs) and two or more X values (predictor value). The StepWise function helps select variables sequentially that best fits the model from all possible subset models. 


 We are using Ratings as our predictor value here.
 
![pic](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/MultiResidual.png)


 We are using Installs as our predictor value here.
The second residual plot is done after log transformation method. The transformation method did not show a good result.  

![pic](https://raw.githubusercontent.com/sunny7x7/TrendingApp/master/Visualization/INSTALLSVS.png)







***Final Model: Reduced Rank Regression***

Reduced Rank Regression is a method in multivariate regression that uses the method of reduced rank restriction on the coefficient matrix. Reduced Rank Regression work with model where there are multiple Y outcome and multiple X inputs. 


This model is useful in helping us predict multiple Y values by shrinking the variations created by the functional relationship between the Y values. Therefore, we will be using this model to predict the Y values (Ratings and Installs) with the rest of numerical x values. 


... more to come 

 


## *Future Work* ##

In conclusion, our reduced rank regression model needs further improvement. Due to the limited information online about this modeling method, we are in the process of researching. There also needs to be future work done normalizing our response values (Ratings and Installs) to have more valuable graphs that can be easily used to compare the outcomes. We will also be working on performance metrics for random forest, multilinear regression, and reduced rank models to present summaries and key results. To persuade that our project outcome is significant,  we are planning to learn how to analyze our numerical summaries and model to communicate our key results and analysis to our audience.  





