## Assumes that you have the raw data unzipped and in working directory
##Read data into a Table
data <- read.table("household_power_consumption.txt", header=T, quote="\"", sep=";", na.strings="?")

## Converts date from factor to date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsets data to 1/2/2007-2/2/2007 (d/m/y)
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

## Combines Date and Time columns 
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S", tz="EST")

##Opens PNG device, Creates 'plot4.png'
png(filename = "plot4.png", width=480, height=480, bg="white")

## Creates plot and sends to file (Won't show on the screen)
##Makes plots show up 2 by 2
par(mfrow = c(2, 2),ps=12)

## Plot for Upper Left Corner
plot(x=data$DateTime, y=data$Global_active_power, xlab="", ylab="Global Active Power", type="l")

## Plot for Upper Right Corner
plot( x=data$DateTime,y=data$Voltage, ylab="Voltage", xlab="datetime", type="l")

## Plot for Lower Left Corner
plot(x=data$DateTime, y=data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l",col="black")
lines(x=data$DateTime, y=data$Sub_metering_2, ylab="Energy sub metering", xlab="", type="l", col="red")
lines(x=data$DateTime, y=data$Sub_metering_3, ylab="Energy sub metering", xlab="", type="l", col="blue")
##Creates Graph Legend for Lower Left Corner Plot 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1), bty="n")

## Plot for Lower Right Corner
plot(x=data$DateTime, y=data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()