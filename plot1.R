#read source data as a table
PowerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#type casting the date 
PowerConsumption$Date <- as.Date(PowerConsumption$Date,format="%d/%m/%Y")

#Subsetting the required data
ReqPowerConsumption <- subset(PowerConsumption, PowerConsumption$Date >= "2007-02-01" & PowerConsumption$Date <= "2007-02-02")

#Histogram command
hist(ReqPowerConsumption$Global_active_power,main = paste("Global Active Power"),col="red",xlab="Global Active Power (kilowatts)")


dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()