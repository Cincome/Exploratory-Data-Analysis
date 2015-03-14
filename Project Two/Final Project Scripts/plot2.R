## Creates a plot of all PM2.5 Emissions in Blatimore between 1999 and 2008
## Reads Data
summary <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

##Subsets data in summary for Baltimore City
baltimore <- summary[which(summary$fips=="24510"), ]

## sums up the total emmisions for the year 1999-2008
one <- with(baltimore, sum(Emissions[year==1999]))
two <- with(baltimore, sum(Emissions[year==2002]))
three <- with(baltimore, sum(Emissions[year==2005]))
four <- with(baltimore, sum(Emissions[year==2008]))

## Create vector of 1999,2002,2005,2008
x <- c(1999,2002,2005,2008)
## Create vector of sums of Emissions
y <- c(one,two,three,four)
## Create Data Frame with sums
data <- data.frame(x,y)

##Opens PNG device, creates 'plot2.png'
png(filename = "plot2.png", width=480, height=480, bg="white")

## Creates plot and sends to file (Won't show on the screen)
plot(y=data$y, x=data$x, type="l", axes=FALSE, xlab=NA, ylab=NA, main="Total Emissions for Baltimore City from All Sources")
box()
axis(side=1, at=c(1999,2002,2005,2008))
axis(side=2, at=c(0,2e+3,3e+3,4e+3), las=1, labels=1:4 )
mtext(side=1, "Years", line=2)
mtext(side=2, 'Total Emissions (in Thousands of Tons)', line=2)
dev.off()