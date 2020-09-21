rm(list = ls())
library(tidyverse)
library(lubridate)
set.seed(1)
power <- read.csv("household_power_consumption.txt", sep=';', header=TRUE,  stringsAsFactors = FALSE, na.strings=c('?'))
power$DT <- paste(power$Date, power$Time, sep=" ")
power$DateTime <- as.POSIXlt(power$DT, format='%d/%m/%Y %H:%M:%S')
power$Date <- as.Date(power$Date, format='%d/%m/%Y')
head(power)
power <- power[(power$Date >= '2007-02-01' & power$Date <= '2007-02-02'),]
#PLOT1
png(filename="plot1.png", bg="white")
with(power, hist(Global_active_power, col="red", main="Global Active Power", xlab='Global Active Power (kilowatts)', ylab='Frequency'))
dev.off()

table(wday(power$Date, label = TRUE))
table(weekdays(power$Date))