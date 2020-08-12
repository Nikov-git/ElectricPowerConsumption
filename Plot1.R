#Reading data
data <- read.csv2("dataset.txt")
#Creating a histogram unidimensional with "Global Active Power"

GAPower <- as.numeric(data$Global_active_power)
png("Plot1.png")
graph <- hist(GAPower, main = "Global Active Power", col = "blue", xlab = "Global Active Power (kilowatts")
dev.off()