# Code to create plot1.png
consumdata <- read.delim("household_power_consumption.txt",sep=";",colClasses = "character")
consumdata$timestmp <- strptime(paste(consumdata$Date,consumdata$Time),"%d/%m/%Y %H:%M:%S")

# Use subsetting to limit data to be between 1/2/2007 and 2/2/2007.
twodaydata <- subset(consumdata, strptime("1/2/2007 00:00:00","%d/%m/%Y %H:%M:%S") <= timestmp)
twodaydata <- subset(twodaydata, timestmp < strptime("3/2/2007 00:00:00","%d/%m/%Y %H:%M:%S"))

png("plot1.png",width = 480, height = 480)
hist(as.numeric(twodaydata$Global_active_power),col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()