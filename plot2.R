##read data
data_full <- read.csv("power_consumption/household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="",
                      quote='\"')

##format dates and time
data_full$timestamp = strptime(paste(data_full$Date, data_full$Time),
                               format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
data_full = data_full[data_full$timestamp >= startDate & data_full$timestamp <= endDate, ]


##subset based on dates specified
data_full= data_full[data_full$Date >= startDate & data_full$Date <= endDate, ]


#plot
plot(data_full$timestamp, data_full$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

#save

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
