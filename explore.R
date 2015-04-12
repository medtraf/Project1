setwd("C:/Users/ertan.ornek/Desktop/coursera/exploratory")

myData<-read.csv(file = "household_power_consumption.txt" ,header = TRUE,sep=";")

mySub<-subset(myData,as.Date(myData$Date,format = "%d/%m/%Y")==as.Date("2007/2/1") | as.Date(myData$Date,format = "%d/%m/%Y")==as.Date("2007/2/2") )