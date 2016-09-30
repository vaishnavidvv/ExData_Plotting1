#read source data as a table
PowerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#type casting the date 
PowerConsumption$Date <- as.Date(PowerConsumption$Date,format="%d/%m/%Y")

#Subsetting the required data
ReqPowerConsumption <- subset(PowerConsumption, PowerConsumption$Date >= "2007-02-01" & PowerConsumption$Date <= "2007-02-02")

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
ReqPowerConsumption$Datetime <- as.POSIXct(datetime)

with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy Sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()




