#Set the working directory to the location of the file "household_power_consumption."

#load the file
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

#rename the file in case you need to go back to the original dataframe "hpc"
hpcData <- hpc

#subset the data to the two days in February
hpcSubData <- subset(hpcData, hpcData$Date %in% c("1/2/2007","2/2/2007"))

#create a new column with the date and time for use in creating the plots
hpcSubData$DateTime <- strptime(paste(hpcSubData$Date, hpcSubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot 1
png("plot1.png", width=480, height=480)
hist(hpcSubData$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col = "red" )
dev.off()
