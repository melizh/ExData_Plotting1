# Load data
rm(list=ls())
library(dplyr)
df <- read.delim('./exdata_data_household_power_consumption/household_power_consumption.txt',sep=';')
df <- df[(df$Date == "1/2/2007") | (df$Date == "2/2/2007"),]
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df <- mutate(df,dateandtime = as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"))

png(filename='plot4.png')
par(mfrow=c(2,2))

plot(df$dateandtime,df$Global_active_power,type='l',
     xlab='',
     ylab='Global Active Power')

plot(df$dateandtime,df$Voltage,type='l',xlab='datetime',ylab='Voltage')

plot(df$dateandtime,df$Sub_metering_1,type='l',
     xlab='',
     ylab='Energy sub metering')
points(df$dateandtime,df$Sub_metering_2,type='l',col='orangered')
points(df$dateandtime,df$Sub_metering_3,type='l',col='royalblue')
legend("topright",lty=c(1,1,1), col=c('black','orangered','royalblue'), legend=names(df)[7:9])

plot(df$dateandtime,df$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')
dev.off()