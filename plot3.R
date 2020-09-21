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

###PLOT3
png(filename="plot3.png", bg="white")
plot(power$DateTime, power$Sub_metering_1, type="l", col="black", ylab="Energy Sub Metering", xlab="")
lines(power$DateTime, power$Sub_metering_2, type="l", col="red")
lines(power$DateTime, power$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue" ), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()