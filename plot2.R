# Load data
rm(list=ls())
library(dplyr)
df <- read.delim('./exdata_data_household_power_consumption/household_power_consumption.txt',sep=';')
df <- df[(df$Date == "1/2/2007") | (df$Date == "2/2/2007"),]
df$Global_active_power <- as.numeric(df$Global_active_power)
df <- mutate(df,dateandtime = as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S"))
png(filename='plot2.png')
plot(df$dateandtime,df$Global_active_power,type='l',
     xlab='',
     ylab='Global Active Power (kilowatts)')
dev.off()