library(dplyr)


setwd("C:\\Users\\kirk\\Desktop\\Machine Learning\\project\\ML-prject")
data <- read.csv("72417520_T_ONTIME_MARKETING.csv")
mydata <- data[,c(1,2,3,4,5,6,7,8,9,10,12,14)]
unique(mydata$ORIGIN)
top5 <- mydata[mydata$ORIGIN==c("JFK","MCO","LAX","ORD","DFW"),]
summary(top5)
unique(top5$MKT_UNIQUE_CARRIER)
min(data$FL_DATE)


Weatherdata <- read.csv("2953503.csv")
Weatherdata$Rain <- ifelse(Weatherdata$PRCP>0,1,0)
Weatherdata$Windy <- ifelse(Weatherdata$AWND>8.9,1,0)
summary(Weatherdata$Rain)
summary(Weatherdata$Snowday)
Weatherdata$Snowday <- ifelse(Weatherdata$SNOW>5,1,0)
weathersub <- Weatherdata[,c("NAME","DATE","Rain","Windy","Snowday")]
weathersub[is.na(weathersub)] = 0

names(top5)[names(top5)=="FL_DATE"] <- "DATE"
weathersub["NAME"][weathersub["NAME"] == "LOS ANGELES INTERNATIONAL AIRPORT, CA US"] <- "LAX"
weathersub["NAME"][weathersub["NAME"] == "ORLANDO INTERNATIONAL AIRPORT, FL US"] <- "MCO"
weathersub["NAME"][weathersub["NAME"] == "DAL FTW WSCMO AIRPORT, TX US"] <- "DFW"
weathersub["NAME"][weathersub["NAME"] == "JFK INTERNATIONAL AIRPORT, NY US"] <- "JFK"
weathersub["NAME"][weathersub["NAME"] == "CHICAGO OHARE INTERNATIONAL AIRPORT, IL US"] <- "ORD"

weathersub <- weathersub[weathersub$NAME != "BUENA VENTURA LAKES 6.0 ENE, FL US",]
names(weathersub)[names(weathersub)=="NAME"] <- "ORIGIN"
total <- merge(top5,weathersub,by=c("ORIGIN","DATE"))
