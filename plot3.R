data <- read.csv2("dataset.txt")
subsetData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)

subsetData$datatime <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png")

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
       lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))

dev.off()