# Set working directory
setwd("C:/Users/Solape/Desktop/Coursera/Exploratory Data Analysis")

# Check if file as been previously downloaded, otherwise download and unzip
if(!file.exists("./Data/data.zip")){
        dir.create("Data")
        # Download and extract zipped data file
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile="./Data/data.zip")
        unzip(zipfile="./Data/data.zip", exdir="./Data")
}

# File unzipped as "household_power_consumption.txt" textfile
# Read a subset of the datafile
filePath <- "./Data/household_power_consumption.txt"
data <- read.csv(filePath, skip=66637, nrows=2880, na.strings = "?", header=FALSE, sep=";")

# Read the variable names
names(data) <- names(read.csv(filePath, nrows=1, sep=";"))

#Add a new column that combines and converts data$Date and data$Time as follows: 
#data$Date <- as.Date(data$Date, format="%d/%m/%y") and
#data$Time <- strptime(data$Time, format="%H:%M:%S")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## Generate Plot 1
# Specify graphic parameters to resize character proportionately in respect to default
par(cex=0.5)

# Generate plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving "Plot1.png" to file
dev.copy(png, file="./ExData_Plotting1/plot1.png", height=480, width=480)
dev.off()