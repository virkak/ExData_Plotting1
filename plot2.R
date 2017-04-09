# Code to create plot2.png
consumdata <- read.delim("household_power_consumption.txt",sep=";",colClasses = "character")
consumdata$timestmp <- strptime(paste(consumdata$Date,consumdata$Time),"%d/%m/%Y %H:%M:%S")

# Use subsetting to limit data to be between 1/2/2007 and 2/2/2007.
twodaydata <- subset(consumdata, strptime("1/2/2007 00:00:00","%d/%m/%Y %H:%M:%S") <= timestmp)
twodaydata <- subset(twodaydata, timestmp < strptime("3/2/2007 00:00:00","%d/%m/%Y %H:%M:%S"))

png("plot2.png",width = 480, height = 480)
plot(twodaydata$timestmp,as.numeric(twodaydata$Global_active_power),type="l",main="Global Active Power",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()