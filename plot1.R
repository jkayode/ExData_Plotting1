# Set working directory
setwd("C:/Users/user/datasciencecoursera/Exploratory Data Analysis")
if(!file.exists("Data")){
        dir.create("Data")
}
# Download and extract zipped data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./Data/data.zip")
unzip(zipfile="./Data/data.zip", exdir="./Data")

# File unzipped as "household_power_consumption.txt" textfile
# Read subset of the datafile
filePath <- "./Data/household_power_consumption.txt"
dataFile <- read.table(filePath, header=TRUE, sep=";", dec=".")
data <- transform(dataFile, Date=as.Date(Date, "%d/%m/%Y"), Global_active_power=as.numeric(Global_active_power))
dataSubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataFile, data)

## Generate Plot 1
hist(dataSubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving "Plot1.png" to file
dev.copy(png, file="./ExData_Plotting1/plot1.png", height=480, width=480)
dev.off()