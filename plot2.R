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

#PLOT2
png(filename="plot2.png", bg="white")
plot(power$DateTime, power$Global_active_power, type = "l", col = "black", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()