household <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
householdSubsetIndex = (as.Date(household$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y")) & (as.Date(household$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"))
household <- household[householdSubsetIndex,]
power1 <- as.numeric(household$Global_active_power)
png(filename="plot1.png")
hist(power1,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()