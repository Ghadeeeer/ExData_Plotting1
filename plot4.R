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


###plot
# Setting the canvas for 4 plots
par(mfcol=c(2,2))

# First plot
plot(data_full$timestamp, data_full$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Second plot
plot(data_full$timestamp, data_full$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(data_full$timestamp, data_full$Sub_metering_2, col="red")
lines(data_full$timestamp, data_full$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# Third Plot
plot(data_full$timestamp, data_full$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Fourth plot
plot(data_full$timestamp, data_full$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

############################
#save

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
