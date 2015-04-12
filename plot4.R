#2

setwd("C:/Users/ertan.ornek/Desktop/coursera/exploratory")

myData<-read.csv(file = "household_power_consumption.txt" ,header = TRUE,sep=";")

mySub<-subset(myData,as.Date(myData$Date,format = "%d/%m/%Y")==as.Date("2007/2/1") | as.Date(myData$Date,format = "%d/%m/%Y")==as.Date("2007/2/2") )

dd<-as.POSIXct(strptime(paste(mySub$Date,mySub$Time),"%d/%m/%Y %H:%M:%S", tz="EST"))
# this expression sets up a plot with 2 rows 2 columns, sets the margin and outer margins
png(filename="Plot4.png",width=480,height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))


plot(dd, mySub$Global_active_power,  ylab ="Global Active Power(kilowatts)",type="l")


plot(dd, mySub$Voltage, type="l",xlab="datetime", ylab ="Voltage")

plot(dd,mySub$Sub_metering_1,xlab="", ylab="Energy sub metering", type= "n")
lines(dd, mySub$Sub_metering_1, type="l", col="black")
lines(dd, mySub$Sub_metering_2, type="l", col="red")
lines(dd, mySub$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="c")

plot(dd,mySub$Global_reactive_power,xlab="", ylab="Global Reactive Power", type= "n")
lines(dd, mySub$Global_reactive_power, type="l", col="black")



dev.off()
