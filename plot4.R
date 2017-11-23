## datafile to read
dfname <- "./household_power_consumption.txt"

## read data file
rawdata <- read.csv(dfname,header = TRUE, sep = ";",stringsAsFactors = FALSE)

##get only data from 1/2/2007 to 2/2/2007
subdata <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))

##convcert to date
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)


##create the png file
png("plot4.png", width=480, height=480)

##setup rows + cols
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#create each plot -> do by row
plot(subdata$Global_active_power~subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(subdata$Voltage~subdata$Datetime, type="l", ylab="Voltage (volt)", xlab="")

plot(subdata$Sub_metering_1~subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

lines(subdata$Sub_metering_2~subdata$Datetime,col='Red')

lines(subdata$Sub_metering_3~subdata$Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subdata$Global_reactive_power~subdata$Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
    

##close the PNG file
dev.off()