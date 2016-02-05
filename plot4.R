#Set the working directory to the location of the file "household_power_consumption."

#load the file
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

#rename the file in case you need to go back to the original hpc
hpcData <- hpc

#subset the data to the two days in February
hpcSubData <- subset(hpcData, hpcData$Date %in% c("1/2/2007","2/2/2007"))

#create a new column with the date and time for use in creating the plots
hpcSubData$DateTime <- strptime(paste(hpcSubData$Date, hpcSubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot#4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(hpcSubData$DateTime, hpcSubData$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
plot(hpcSubData$DateTime, hpcSubData$Voltage, type="l", xlab = "datetime", ylab="Voltage")
plot(hpcSubData$DateTime, hpcSubData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hpcSubData$DateTime, hpcSubData$Sub_metering_2, col = "red")
lines(hpcSubData$DateTime, hpcSubData$Sub_metering_3, col = "blue")
legend("topright", bty="n", lty=1, lwd=2, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(hpcSubData$DateTime, hpcSubData$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
dev.off()
