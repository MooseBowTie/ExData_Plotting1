## Make the second plot


# Load the data using the readr package
fullData <- read_delim("household_power_consumption.txt", ";", col_types = "ccnnnnnnn")

# Isolate the data from February 1st and 2nd
data <- fullData[(fullData$Date == "1/2/2007") | (fullData$Date == "2/2/2007"), ]

# Copy the data
data2 <- data

# Remove the Date and Time columns, and replace with posix
data2 <- data[, -c(1,2)]
data2$DateAndTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")

# Construct plot2
plot(data2$Global_active_power,     type="l", 
                                    ylab = "Global Active Power (kilowatts)", 
                                    xlab = "",
                                    main = ""
)

# Set the graphics device to png
png("plot2.png")

# Reconstruct the plot
plot(data2$Global_active_power,     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     main = ""
)
# Turn off the graphics device
dev.off()


