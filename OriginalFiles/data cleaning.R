#used "dataforregression" file from github
#this file already had category 1.9 deleted 

google <- read.csv("android app data.csv")

#STEP 1: Remove "+" sign from Installs column
library(stringr)
google$Installs <- as.character(google$Installs)
### split the variable by "M"
google$Installs = substr(google$Installs,1,nchar(google$Installs)-1)
head(google)
google$Installs <- as.factor(google$Installs)

#STEP 2: Remove "M" and "k" from Size column & NA values replaced with mean sorted by category
google$Size <- as.character(google$Size)

### splitting the variable by "M"
numz <- unlist(strsplit(google$Size, "M"))

### create temp df so that you can keep track of if it is "M" or "k"
###creating a temporary dataframe
temp_df <- as.data.frame(cbind(as.character(numz), 1000000))

### changing types so we can work with the vectors
temp_df$V1 <- as.character(temp_df$V1)
temp_df$V2 <- as.numeric(as.character(temp_df$V2))

### if the first column has a "k" in it make the second column = 1000
temp_df$V2[grepl("k", temp_df$V1)] <- 1000

### remove the "k" from the first column
temp_df$V1 <- unlist(strsplit(temp_df$V1, "k"))

### multiply two columns together so you get new numeric value!!!
### change "Varies with device" to NA
temp_df$V1[temp_df$V1 == "Varies with device"] <- NA

### change first column to numeric
temp_df$V1 <- as.numeric(as.character(temp_df$V1))

### multiply two columns
newvals <- temp_df$V1*temp_df$V2

### change NAs to mean value for category
library(dplyr)
google$Size <- newvals
google$Category <- as.character(google$Category)
unique(google$Category)

### temporary dataframe so that the original is unchanged
yo <- google

### table of means per category
meanz <- google %>% group_by(Category) %>% summarize(Mean = mean(Size, na.rm=TRUE))
meanz$Category <- as.character(meanz$Category)

### iterate through each category and replace NA for that category with the mean value for that category
for(i in 2:nrow(meanz)) {
  temp <- yo[yo$Category == meanz[2,1],]
  temp$Size[is.na(temp$Size)] <- meanz[2,2]
  temp$Size <- unlist(temp$Size)
  yo$Size <- temp$Size
}

#STEP 3: Change Type Column from ordinal data type to numeric
### FREE = 0 AND PAID = 1
levels(google$Type) 

### prices
levels(google$Price) # decimal point, changing it to fraction 
google$Price<- as.numeric(gsub("\\$","",google$Price))

### installs
google$Installs <- as.numeric(gsub(",","",google$Installs))

### checking
my_data = subset(google, google$Category== "LIBRARIES_AND_DEMO")
as.numeric(google$Installs)

google$Type<-gsub("Free", "0", google$Type)
google$Type<- gsub("Paid", "1", google$Type)
as.numeric(google$Type)

#STEP 4: CONTENT RATING
###change from categorical to numeric (scale 1-5)

levels(google$Content.Rating)

google$Content.Rating <- gsub( "Everyone 10+", "2" ,google$Content.Rating)
google$Content.Rating <- gsub( "+", "" ,google$Content.Rating)
google$Content.Rating <- gsub( "Everyone", "1" ,google$Content.Rating)
google$Content.Rating <- gsub( "Teen", "3" ,google$Content.Rating)
google$Content.Rating <- gsub( "Mature 17+", "4" ,google$Content.Rating)
google$Content.Rating <- gsub( "Adults only 18+", "5" ,google$Content.Rating)
google$Content.Rating <- gsub( "\\+", "" ,google$Content.Rating) 

### deleting "unrated" and ""
google <- google[!(google$Content.Rating=="Unrated"),]
google <- google[!(google$Content.Rating==""),]
unique(google$Content.Rating)
##########################
###COULD NOT DELETE UNRATED FOR SOME REASON
##########################

#STEP 5: Making Android Version Numeric Value
google$Android.Ver <- as.character(google$Android.Ver)

unique(google$Android.Ver)

google$Android.Ver <- gsub("4.0.3 and up", "403", google$Android.Ver)
google$Android.Ver <- gsub("4.4 and up", "440", google$Android.Ver)
google$Android.Ver <- gsub("4.2 and up", "420", google$Android.Ver)
google$Android.Ver <- gsub("2.3 and up", "230", google$Android.Ver)
google$Android.Ver <- gsub("4.1 and up", "410", google$Android.Ver)
google$Android.Ver <- gsub("2.0 and up", "200", google$Android.Ver)
google$Android.Ver <- gsub("5.0 and up", "500", google$Android.Ver)
google$Android.Ver <- gsub("4.0 and up", "400", google$Android.Ver)
google$Android.Ver <- gsub("3.2 and up", "302", google$Android.Ver)
google$Android.Ver <- gsub("3.0 and up", "300", google$Android.Ver)
google$Android.Ver <- gsub("2.1 and up", "210", google$Android.Ver)
google$Android.Ver <- gsub("1.6 and up", "160", google$Android.Ver)
google$Android.Ver <- gsub("7.1 and up", "710", google$Android.Ver)
google$Android.Ver <- gsub("8.0 and up", "800", google$Android.Ver)
google$Android.Ver <- gsub("3.1 and up", "310", google$Android.Ver)
google$Android.Ver <- gsub("4.1 - 7.1.1", "410", google$Android.Ver)
google$Android.Ver <- gsub("5.0 - 6.0", "500", google$Android.Ver)
google$Android.Ver <- gsub("2.3.3 and up", "233", google$Android.Ver)
google$Android.Ver <- gsub("4.3 and up", "430", google$Android.Ver)
google$Android.Ver <- gsub("2.2 and up", "220", google$Android.Ver)
google$Android.Ver <- gsub("6.0 and up", "600", google$Android.Ver)
google$Android.Ver <- gsub("1.5 and up", "150", google$Android.Ver)
google$Android.Ver <- gsub("7.0 and up", "700", google$Android.Ver)
google$Android.Ver <- gsub("5.1 and up", "510", google$Android.Ver)
google$Android.Ver <- gsub("2.0.1 and up", "210", google$Android.Ver)
google$Android.Ver <- gsub("1.0 and up", "100", google$Android.Ver)
google$Android.Ver <- gsub("4.0.3 - 7.1.1", "403", google$Android.Ver)
google$Android.Ver <- gsub("7.0 - 7.1.1", "700", google$Android.Ver)
google$Android.Ver <- gsub("5.0 - 8.0", "500", google$Android.Ver)
google$Android.Ver <- gsub("4.4W and up", "440", google$Android.Ver)

###replacing with mean sorted by category

google$Android.Ver[google$Android.Ver == "Varies with device"] <- NA
google$Android.Ver <- as.numeric(as.character(google$Android.Ver))

google$Category <- as.character(google$Category)
unique(google$Category)

yo2 <- google
library(dplyr)

### table of means per category
meanz2 <- google %>% group_by(Category) %>% summarize(Mean = mean(Android.Ver, na.rm=TRUE))
meanz2$Category <- as.character(meanz2$Category)

### iterate through each category and replace NA for that category with the mean value for that category
for(i in unique(google$Category)){
  google$Android.Ver[google$Category==i] <- ifelse(is.na(google$Android.Ver[google$Category==i]), mean(google$Android.Ver[google$Category==i],na.rm=T), google$Android.Ver)
}

google$Android.Ver<-round(as.numeric(google$Android.Ver), 0)

#STEP 6: DELETING ANY REMAINING NA VALUES AND THEIR CORRESPONDING ROWS
google <- google[!is.na(google$Rating),]
NROW(google)

#STEP 7: LAST UPDATE COLUMN TO NUMERIC VALUE

google$Last.Updated <- gsub("-", "", google$Last.Updated)
google$Last.Updated <- gsub("Jan", "01", google$Last.Updated)
google$Last.Updated <- gsub("Feb", "02", google$Last.Updated)
google$Last.Updated <- gsub("Mar", "03", google$Last.Updated)
google$Last.Updated <- gsub("Apr", "04", google$Last.Updated)
google$Last.Updated <- gsub("May", "05", google$Last.Updated)
google$Last.Updated <- gsub("Jun", "06", google$Last.Updated)
google$Last.Updated <- gsub("Jul", "07", google$Last.Updated)
google$Last.Updated <- gsub("Aug", "08", google$Last.Updated)
google$Last.Updated <- gsub("Sep", "09", google$Last.Updated)
google$Last.Updated <- gsub("Oct", "10", google$Last.Updated)
google$Last.Updated <- gsub("Nov", "11", google$Last.Updated)
google$Last.Updated <- gsub("Dec", "12", google$Last.Updated)

write.csv(google, "app_data_cleaned.csv", row.names = FALSE)
