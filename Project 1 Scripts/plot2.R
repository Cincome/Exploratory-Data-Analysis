## Assumes that you have the raw data unzipped and in working directory
##Read data into a Table
## read.csv2.sql used in plot1 wasn't working so used read.table for plots2-4
data <- read.table("household_power_consumption.txt", header=T, quote="\"", sep=";", na.strings="?")

## Converts date from factor to date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsets data to 1/2/2007-2/2/2007 (d/m/y)
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

## Combines Date and Time columns
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S", tz="EST")


##Opens PNG device, Creates 'plot2.png'
png(filename = "plot2.png", width=480, height=480, bg="white")

## Creates plot and sends to file (Won't show on the screen)
plot(y=data$Global_active_power, x=data$DateTime, ylab="Global Active Power (killowatts)", xlab="",type="l")
dev.off()