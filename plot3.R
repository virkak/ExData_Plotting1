# Code to create plot3.png
consumdata <- read.delim("household_power_consumption.txt",sep=";",colClasses = "character")
consumdata$timestmp <- strptime(paste(consumdata$Date,consumdata$Time),"%d/%m/%Y %H:%M:%S")

# Use subsetting to limit data to be between 1/2/2007 and 2/2/2007.
twodaydata <- subset(consumdata, strptime("1/2/2007 00:00:00","%d/%m/%Y %H:%M:%S") <= timestmp)
twodaydata <- subset(twodaydata, timestmp < strptime("3/2/2007 00:00:00","%d/%m/%Y %H:%M:%S"))

png("plot3.png",width = 480, height = 480)
plot(twodaydata$timestmp,as.numeric(twodaydata$Sub_metering_1),type="l",main="",ylab = "Energy sub metering",xlab="")
lines(twodaydata$timestmp,as.numeric(twodaydata$Sub_metering_2),col = "red",type = "l")
lines(twodaydata$timestmp,as.numeric(twodaydata$Sub_metering_3),col = "blue",type = "l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),col = c("black","red","blue"))
dev.off()