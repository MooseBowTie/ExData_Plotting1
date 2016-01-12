## Make the first plot

# Import the required packages
library(readr) 

# Set the working directory
setwd("C:/Users/first/Documents/RProgramming/ExploratoryDataAnalysis")

# Download the data
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, "powerConsumption")

# Unzip the data
unzip("powerConsumption")

# Load the data using the readr package
fullData <- read_delim("household_power_consumption.txt", ";", col_types = "ccnnnnnnn")

# Isolate the data from February 1st and 2nd
data <- fullData[(fullData$Date == "1/2/2007") | (fullData$Date == "2/2/2007"), ]

# Copy the data
data2 <- data

# Remove the Date and Time columns, and replace with posix
data2 <- data[, -c(1,2)]
data2$DateAndTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")

# Construct plot1
hist(data2$Global_active_power,     col = "red", 
                                    xlab = "Global Active Power (kilowatts)", 
                                    main = "Global Active Power"
    )

# Set the graphics device to png
png("plot1.png")

# Reconstruct the plot
hist(data2$Global_active_power,     col = "red", 
                                    xlab = "Global Active Power (kilowatts)", 
                                    main = "Global Active Power"
    )
# Turn off the graphics device
dev.off()






















