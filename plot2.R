household <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
householdSubsetIndex = (as.Date(household$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y")) & (as.Date(household$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"))
household <- household[householdSubsetIndex,]
days <- paste(household$Date,household$Time)
power <- as.numeric(household$Global_active_power)
png(filename="plot2.png")
plot(strptime(days,format = "%d/%m/%Y %H:%M:%S") ,power ,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
