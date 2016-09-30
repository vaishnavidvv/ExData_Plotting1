#read source data as a table
PowerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#type casting the date 
PowerConsumption$Date <- as.Date(PowerConsumption$Date,format="%d/%m/%Y")

#Subsetting the required data
ReqPowerConsumption <- subset(PowerConsumption, PowerConsumption$Date >= "2007-02-01" & PowerConsumption$Date <= "2007-02-02")

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
ReqPowerConsumption$Datetime <- as.POSIXct(datetime)

par(mfcol = c(2,2))

plot(ReqPowerConsumption$Datetime, ReqPowerConsumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy Sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(ReqPowerConsumption$Datetime, ReqPowerConsumption$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(ReqPowerConsumption$Datetime, ReqPowerConsumption$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()




