# Load data
rm(list=ls())
df <- read.delim('./exdata_data_household_power_consumption/household_power_consumption.txt',sep=';')
df <- df[(df$Date == "1/2/2007") | (df$Date == "2/2/2007"),]
df$Global_active_power <- as.numeric(df$Global_active_power)
png(filename='plot1.png')
hist(df$Global_active_power,col='orangered',
     main='Global Active Power',
     ylab='Frequency',
     xlab='Global Active Power (kilowatts)')
dev.off()