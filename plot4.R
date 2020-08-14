data <- read.csv2("dataset.txt")
subsetData = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
subsetData$Global_reactive_power <- as.numeric(subsetData$Global_reactive_power)
subsetData$Voltage <- as.numeric(subsetData$Voltage)
subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)

subsetData$datatime <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow = c(2,2))

#PLOT1
plot(x = subsetData$datatime, y = subsetData$Global_active_power,
     xlab= " ", ylab = "Global Active Power (kilowatts)", 
     type = "l")

#PLOT2
plot(subsetData$datatime, subsetData$Voltage, 
     type = "l",
     xlab = "Datatime", ylab = "Voltage")

#PLOT3
plot(subsetData$datatime, subsetData$Sub_metering_1, 
     type = "l", 
     xlab = " ", ylab = "Energy submetering")
lines(subsetData$datatime, subsetData$Sub_metering_2, 
      col = "red", 
      type = "l")
lines(subsetData$datatime, subsetData$Sub_metering_3, 
      col= "blue", 
      type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = 1, lwd=2.5)

#PLOT4 
plot(subsetData$datatime, subsetData$Global_reactive_power, 
     xlab = "Datatime", ylab = "Global_reactive_power", 
     type= "l" )

dev.off()