## Make the third plot


# Load the data using the readr package
fullData <- read_delim("household_power_consumption.txt", ";", col_types = "ccnnnnnnn")

# Isolate the data from February 1st and 2nd
data <- fullData[(fullData$Date == "1/2/2007") | (fullData$Date == "2/2/2007"), ]

# Copy the data
data2 <- data

# Remove the Date and Time columns, and replace with posix
data2 <- data[, -c(1,2)]
data2$DateAndTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")

# Construct the first line of plot3
plot(data2$DateAndTime, data2$Sub_metering_1,          type="l", 
                                    ylab = "Global Active Power (kilowatts)", 
                                    xlab = "",
                                    main = ""
    )
# Add the other two lines
lines(data2$DateAndTime, data2$Sub_metering_2, col = "red")
lines(data2$DateAndTime, data2$Sub_metering_3, col = "blue")
# Add the legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd=1, legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

# Set the graphics device to png
png("plot3.png")

# Reconstruct the plot
plot(data2$DateAndTime, data2$Sub_metering_1,          type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     main = ""
)
# Add the other two lines
lines(data2$DateAndTime, data2$Sub_metering_2, col = "red")
lines(data2$DateAndTime, data2$Sub_metering_3, col = "blue")
# Add the legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd=1, legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

# Turn off the graphics device
dev.off()