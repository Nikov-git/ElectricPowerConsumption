data <- read.csv2("dataset.txt")
subsetData = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007") 

subsetData$Global_active_power <- as.numeric(as.character(subsetData$Global_active_power))

subsetData$datatime <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(x = subsetData$datatime, y = subsetData$Global_active_power,
            xlab= " ", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()