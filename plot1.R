##read data
data_full <- read.csv("/power_consumption/household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="",
                      quote='\"')

##format dates
data_full$Date = as.Date(data_full$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")

##subset based on dates specified
data_full= data_full[data_full$Date >= startDate & data_full$Date <= endDate, ]

##plot
hist(data_full$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


##save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

