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


##create the png file
png("plot3.png", width=480, height=480)

##line
with(subdata, plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

lines(subdata$Sub_metering_2~subdata$Datetime,col='Red')

lines(subdata$Sub_metering_3~subdata$Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##close the PNG file
dev.off()