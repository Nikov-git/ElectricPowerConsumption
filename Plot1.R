data <- read.csv2("dataset.txt")

subsetData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power) #Numeric data is needed.

png("Plot1.png")

hist(subsetData$Global_active_power,
              main = "Global Active Power",
              col = "red",
              xlab = "Global Active Power (kilowatts)")
axis(side= 2, c(0, 200, 400, 600, 800, 1000, 1200), labels = F)
axis(side = 1, c(0, 2, 4, 6), labels = F)

dev.off()
