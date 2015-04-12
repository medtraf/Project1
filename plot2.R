#2

setwd("C:/Users/ertan.ornek/Desktop/coursera/exploratory")

myData<-read.csv(file = "household_power_consumption.txt" ,header = TRUE,sep=";")

mySub<-subset(myData,as.Date(myData$Date,format = "%d/%m/%Y")==as.Date("2007/2/1") | as.Date(myData$Date,format = "%d/%m/%Y")==as.Date("2007/2/2") )
png(filename="Plot2.png",width=480,height=480)
plot(as.POSIXct(strptime(paste(mySub$Date,mySub$Time), " %d/%m/%Y %H:%M:%S", tz="EST")), mySub$Global_active_power, type="l",xlab="", ylab ="Global Active Power (kilowatts)")
dev.off()