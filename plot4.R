household <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
householdSubsetIndex = (as.Date(household$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y")) & (as.Date(household$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"))
household <- household[householdSubsetIndex,]
power <- as.numeric(household$Global_active_power)
days <- paste(household$Date,household$Time)
subMeter1 <- as.numeric(household$Sub_metering_1)
subMeter2 <- as.numeric(household$Sub_metering_2)
subMeter3 <- as.numeric(household$Sub_metering_3)
volt <- as.numeric(household$Voltage)
reactivePower <- as.numeric(household$Global_reactive_power)

png(filename="plot4.png")
par(mfrow = c(2, 2))
plot(strptime(days,format = "%d/%m/%Y %H:%M:%S") ,power ,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(strptime(days,format = "%d/%m/%Y %H:%M:%S") ,volt ,type="l",ylab="Voltage",xlab="")
plot(strptime(days,format = "%d/%m/%Y %H:%M:%S") ,subMeter1 ,type="l",ylab="Energy sub metering",xlab="")
lines(strptime(days,format = "%d/%m/%Y %H:%M:%S"), subMeter2, type="l", col="red") 
lines(strptime(days,format = "%d/%m/%Y %H:%M:%S"), subMeter3, type="l", col="blue")
legend("topright",lty=1,cex=0.6,col = c("black", "blue", "red"),xjust=0, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(strptime(days,format = "%d/%m/%Y %H:%M:%S") ,reactivePower ,type="l",ylab="Global_reactive_power",xlab="")
dev.off()
