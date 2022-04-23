setwd("C:\\Users\\kirk\\Desktop\\Machine Learning\\project")
data <- read.csv("72417520_T_ONTIME_MARKETING.csv")
mydata <- data[,c(1,2,3,4,6,7,8,9,10,12,14)]
unique(mydata$ORIGIN)
