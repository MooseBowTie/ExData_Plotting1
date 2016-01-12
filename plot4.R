## Make the fourth plot


# Load the data using the readr package
fullData <- read_delim("household_power_consumption.txt", ";", col_types = "ccnnnnnnn")

# Isolate the data from February 1st and 2nd
data <- fullData[(fullData$Date == "1/2/2007") | (fullData$Date == "2/2/2007"), ]

# Copy the data
data2 <- data

# Remove the Date and Time columns, and replace with posix
data2 <- data[, -c(1,2)]
data2$DateAndTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")

# Set the format - a grid of 4 graphs
op <- par(mfrow=c(2,2))

# Construct the 1st graph
plot(data2$Global_active_power,     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     main = ""
)

# Construct the second graph
plot(data2$Global_reactive_power,     type="l", 
     ylab = "Global_reactive_power (kilowatts)", 
     xlab = "datetime",
     main = ""
)

# Construct the third graph
plot(data2$Sub_metering_1,          type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     main = ""
)
# Add the other two lines
lines(data2$Sub_metering_2, col = "red")
lines(data2$Sub_metering_3, col = "blue")
# Add the legend
legend("topright", bty="n", col = c("black", "red", "blue"), lty = 1, lwd=1, legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

# Construct the fourth graph
# Construct the second graph
plot(data2$Voltage,     type="l", 
     ylab = "Voltage", 
     xlab = "datetime",
     main = ""
)

# Reset the default graphics options
par(op)








# Set the graphics device to png
png("plot4.png")

# Reconstruct the plot
op <- par(mfrow=c(2,2))

# Construct the 1st graph
plot(data2$Global_active_power,     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     main = ""
)

# Construct the second graph
plot(data2$Global_reactive_power,     type="l", 
     ylab = "Global_reactive_power (kilowatts)", 
     xlab = "datetime",
     main = ""
)

# Construct the third graph
plot(data2$Sub_metering_1,          type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     main = ""
)
# Add the other two lines
lines(data2$Sub_metering_2, col = "red")
lines(data2$Sub_metering_3, col = "blue")
# Add the legend
legend("topright", bty="n", col = c("black", "red", "blue"), lty = 1, lwd=1, legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

# Construct the fourth graph
# Construct the second graph
plot(data2$Voltage,     type="l", 
     ylab = "Voltage", 
     xlab = "datetime",
     main = ""
)

# Reset the default graphics options
par(op)

# Turn off the graphics device
dev.off()