getwd()
setwd("/Users/heshiqi/Desktop/Coursera-R/Exploratory Data Analysis/Week1")
library(data.table)
fileurl = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if (!file.exists('Electric power consumption.zip')){
    download.file(fileurl,'Electric power consumption.zip', method = "curl")
    unzip("Electric power consumption.zip", exdir = getwd())
}

## Read data
consumption <- read.table('household_power_consumption.txt', header=TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
consumption <- consumption[complete.cases(consumption),] ##remove any incomplete data
head(consumption)

## subset data from the dates 2007-02-01 and 2007-02-02
consumption <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007"),]
dim(consumption)


## Plot 2
dev.copy(png, file="plot2.png", height=480, width=480)
date <- strptime(paste(consumption$Date, consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(date, consumption$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
dev.off()
