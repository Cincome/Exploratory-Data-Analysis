## Assumes that you have the raw data unzipped and in working directory
myData<- "./household_power_consumption.txt"

## Selects data for 1/2/2007 to 2/2/2007
## and Reads data
mySql<- "SELECT * FROM file WHERE Date= '1/2/2007' OR Date= '2/2/2007'"
filtData<- read.csv2.sql(myData,mySql)

##Opens PNG device, Creates 'plot1.png'
png(filename = "plot1.png", width=480, height=480, bg="white")

## Creates histogram and sends to file (Won't show on the screen)
hist(filtData$Global_active_power, main= "Global Active Power",
        xlab= "Global Active Power (kilowatts)", ylab= "Frequency",
        cex.lab= 0.75, cex.axis= 0.75, border= "Black", col= "Red")
dev.off()