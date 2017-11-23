## datafile to read
dfname <- "./household_power_consumption.txt"

## read data file
rawdata <- read.csv(dfname,header = TRUE, sep = ";",stringsAsFactors = FALSE)

##get only data from 1/2/2007 to 2/2/2007
subdata <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))

##convcert to nmumeric
#subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

##create the png file
png("plot1.png", width=480, height=480)

##histogram
hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##close the PNG file
dev.off()