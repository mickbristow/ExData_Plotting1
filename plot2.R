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
png("plot2.png", width=480, height=480)

##line
#plot(subdata$globalActivePower~subdata$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
with(subdata, plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

##close the PNG file
dev.off()