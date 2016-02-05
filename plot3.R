#Set the working directory to the location of the file "household_power_consumption."

#load the file
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

#rename the file in case you need to go back to the original hpc object
hpcData <- hpc

#subset the data to the two days in February
hpcSubData <- subset(hpcData, hpcData$Date %in% c("1/2/2007","2/2/2007"))

#create a new column with the date and time for use in creating the plots
hpcSubData$DateTime <- strptime(paste(hpcSubData$Date, hpcSubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot3
png("plot3.png", width=480, height=480)
plot(hpcSubData$DateTime, hpcSubData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hpcSubData$DateTime, hpcSubData$Sub_metering_2, col = "red")
lines(hpcSubData$DateTime, hpcSubData$Sub_metering_3, col = "blue")
legend("topright", lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
