#2

setwd("C:/Users/ertan.ornek/Desktop/coursera/exploratory")

myData<-read.csv(file = "household_power_consumption.txt" ,header = TRUE,sep=";")

mySub<-subset(myData,as.Date(myData$Date,format = "%d/%m/%Y")==as.Date("2007/2/1") | as.Date(myData$Date,format = "%d/%m/%Y")==as.Date("2007/2/2") )

dd<-as.POSIXct(strptime(paste(mySub$Date,mySub$Time), "%d/%m/%Y %H:%M:%S", tz="EST"))

png(filename="Plot3.png",width=480,height=480)
plot(dd,mySub$Sub_metering_1,xlab="", ylab="Energy sub metering", type= "n")
lines(dd, mySub$Sub_metering_1, type="l", col="black")
lines(dd, mySub$Sub_metering_2, type="l", col="red")
lines(dd, mySub$Sub_metering_3, type="l", col="blue")

legend("topright",lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="c")
dev.off()
#plot(as.POSIXct(strptime(paste(mySub$Date,mySub$Time), " %d/%m/%Y %H:%M:%S", tz="EST")), mySub$Global_active_power, type="l",xlab="", ylab ="Global Active Power (kilowatts)")
dev.off()