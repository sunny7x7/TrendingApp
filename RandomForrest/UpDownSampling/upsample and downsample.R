setwd("C:/Users/ishan/Documents")
getwd()
fvm3 <- read.csv("fvm3.csv")
str(fvm3)

# downsample
fambam <- fvm3[fvm3$Category == "FAMILY",]
set.seed(2102000)
remfam <- sample(as.numeric(rownames(fambam)), nrow(fambam)*1/3) # remfam = the rows you eliminating in the original dataframe
# nrow(fambam) * 1/3 = number of rows you want in remfam
newdf <- fvm3[-remfam, ] # removing rows remfam from the original dataframe. if you want to add do rbind(fvm3, fvm3[rowstoadd, ]). 
nrow(newdf[newdf$Category == "FAMILY",]) # now the # of rows for family is 1165

fambam2 <- newdf[newdf$Category == "GAME",]
remfam2 <- sample(as.numeric(rownames(fambam2)), nrow(fambam2)*1/3) 
newdf2 <- newdf[-remfam2, ]  
nrow(newdf2[newdf2$Category == "GAME",]) #960

nrow(newdf2[newdf2$Category == "FAMILY",])

# upsample
# need to use rbind instead. be careful about adding duplicate row #s to the dataframe. X will therefore have multiple rows with the same value.
# if you want to avoid this, rename the rows. or don't give a fuck.

###PARENITNG 181
parent <- newdf2[newdf2$Category == "PARENTING",]
addpar <- sample(rownames(parent), nrow(parent)*199/200)
tobind <- newdf2[addpar,]
rownames(tobind) <- (nrow(newdf2)+1):(nrow(newdf2)+nrow(tobind))
newdf3 <- rbind(newdf2, tobind)
nrow(newdf3[newdf3$Category == "PARENTING",]) # now the # of rows for parenting = 97

parent <- newdf3[newdf3$Category == "PARENTING",]
addpar <- sample(rownames(parent), nrow(parent)*5/6)
tobind <- newdf3[addpar,]
rownames(tobind) <- (nrow(newdf3)+1):(nrow(newdf3)+nrow(tobind))
newdf4 <- rbind(newdf3, tobind)
nrow(newdf4[newdf4$Category == "PARENTING",]) # now the # of rows for parenting = 97


###ART AND DESIGN 235
parent <- newdf4[newdf4$Category == "ART_AND_DESIGN",]
addpar <- sample(rownames(parent), nrow(parent)*199/200)
tobind <- newdf4[addpar,]
rownames(tobind) <- (nrow(newdf4)+1):(nrow(newdf4)+nrow(tobind))
newdf5 <- rbind(newdf4, tobind)
nrow(newdf5[newdf5$Category == "ART_AND_DESIGN",]) 

parent <- newdf5[newdf5$Category == "ART_AND_DESIGN",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf5[addpar,]
rownames(tobind) <- (nrow(newdf5)+1):(nrow(newdf5)+nrow(tobind))
newdf6 <- rbind(newdf5, tobind)
nrow(newdf6[newdf6$Category == "ART_AND_DESIGN",]) 

###AUTO AND VEHICLES 265
parent <- newdf6[newdf6$Category == "AUTO_AND_VEHICLES",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf6[addpar,]
rownames(tobind) <- (nrow(newdf6)+1):(nrow(newdf6)+nrow(tobind))
newdf7 <- rbind(newdf6, tobind)
nrow(newdf7[newdf7$Category == "AUTO_AND_VEHICLES",]) 

parent <- newdf7[newdf7$Category == "AUTO_AND_VEHICLES",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf7[addpar,]
rownames(tobind) <- (nrow(newdf7)+1):(nrow(newdf7)+nrow(tobind))
newdf8 <- rbind(newdf7, tobind)
nrow(newdf8[newdf8$Category == "AUTO_AND_VEHICLES",]) 

nrow(newdf8[newdf8$Category == "FAMILY", ])

###BEAUTY 188
parent <- newdf[newdf$Category == "BEAUTY",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf[addpar,]
rownames(tobind) <- (nrow(newdf)+1):(nrow(newdf)+nrow(tobind))
newdf2 <- rbind(newdf, tobind)
nrow(newdf2[newdf2$Category == "BEAUTY",]) 
parent <- newdf2[newdf2$Category == "BEAUTY",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf2[addpar,]
rownames(tobind) <- (nrow(newdf2)+1):(nrow(newdf2)+nrow(tobind))
newdf3 <- rbind(newdf2, tobind)
nrow(newdf3[newdf3$Category == "BEAUTY",]) 
parent <- newdf3[newdf3$Category == "BEAUTY",]
addpar <- sample(rownames(parent), nrow(parent)*1/5)
tobind <- newdf3[addpar,]
rownames(tobind) <- (nrow(newdf3)+1):(nrow(newdf3)+nrow(tobind))
newdf4 <- rbind(newdf3, tobind)
nrow(newdf4[newdf4$Category == "BEAUTY",]) 

###COMICS 220
parent <- newdf[newdf$Category == "COMICS",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf[addpar,]
rownames(tobind) <- (nrow(newdf)+1):(nrow(newdf)+nrow(tobind))
newdf2 <- rbind(newdf, tobind)
nrow(newdf2[newdf2$Category == "COMICS",]) 
parent <- newdf2[newdf2$Category == "COMICS",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf2[addpar,]
rownames(tobind) <- (nrow(newdf2)+1):(nrow(newdf2)+nrow(tobind))
newdf3 <- rbind(newdf2, tobind)
nrow(newdf3[newdf3$Category == "COMICS",]) 

###EVENTS 169
parent <- newdf[newdf$Category == "EVENTS",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf[addpar,]
rownames(tobind) <- (nrow(newdf)+1):(nrow(newdf)+nrow(tobind))
newdf2 <- rbind(newdf, tobind)
nrow(newdf2[newdf2$Category == "EVENTS",]) 
parent <- newdf2[newdf2$Category == "EVENTS",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf2[addpar,]
rownames(tobind) <- (nrow(newdf2)+1):(nrow(newdf2)+nrow(tobind))
newdf3 <- rbind(newdf2, tobind)
nrow(newdf3[newdf3$Category == "EVENTS",]) 

###HOUSE AND HOME 288
parent <- newdf[newdf$Category == "HOUSE_AND_HOME",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf[addpar,]
rownames(tobind) <- (nrow(newdf)+1):(nrow(newdf)+nrow(tobind))
newdf2 <- rbind(newdf, tobind)
nrow(newdf2[newdf2$Category == "HOUSE_AND_HOME",]) 
parent <- newdf2[newdf2$Category == "HOUSE_AND_HOME",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf2[addpar,]
rownames(tobind) <- (nrow(newdf2)+1):(nrow(newdf2)+nrow(tobind))
newdf3 <- rbind(newdf2, tobind)
nrow(newdf3[newdf3$Category == "HOUSE_AND_HOME",]) 

###LIBRARIES AND DEMO 245
parent <- newdf[newdf$Category == "LIBRARIES_AND_DEMO",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf[addpar,]
rownames(tobind) <- (nrow(newdf)+1):(nrow(newdf)+nrow(tobind))
newdf2 <- rbind(newdf, tobind)
nrow(newdf2[newdf2$Category == "LIBRARIES_AND_DEMO",]) 
parent <- newdf2[newdf2$Category == "LIBRARIES_AND_DEMO",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf2[addpar,]
rownames(tobind) <- (nrow(newdf2)+1):(nrow(newdf2)+nrow(tobind))
newdf3 <- rbind(newdf2, tobind)
nrow(newdf3[newdf3$Category == "LIBRARIES_AND_DEMO",]) 

###WEATHER 284
parent <- newdf[newdf$Category == "WEATHER",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf[addpar,]
rownames(tobind) <- (nrow(newdf)+1):(nrow(newdf)+nrow(tobind))
newdf2 <- rbind(newdf, tobind)
nrow(newdf2[newdf2$Category == "WEATHER",]) 
parent <- newdf2[newdf2$Category == "WEATHER",]
addpar <- sample(rownames(parent), nrow(parent)*19/20)
tobind <- newdf2[addpar,]
rownames(tobind) <- (nrow(newdf2)+1):(nrow(newdf2)+nrow(tobind))
newdf3 <- rbind(newdf2, tobind)
nrow(newdf3[newdf3$Category == "WEATHER",]) 


