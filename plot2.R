#read source data as a table
PowerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#type casting the date 
PowerConsumption$Date <- as.Date(PowerConsumption$Date,format="%d/%m/%Y")

#Subsetting the required data
ReqPowerConsumption <- subset(PowerConsumption, PowerConsumption$Date >= "2007-02-01" & PowerConsumption$Date <= "2007-02-02")

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
ReqPowerConsumption$Datetime <- as.POSIXct(datetime)

plot(ReqPowerConsumption$Datetime, ReqPowerConsumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()




