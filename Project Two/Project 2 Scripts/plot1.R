## creates a plot of all PM2.5 emissions for the years: 1999, 2002, 2005, 2008
## Read files in current working directory
summary <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

## sums up the total emmisions for the year 1999-2008
one <- with(summary, sum(Emissions[year==1999]))
two <- with(summary, sum(Emissions[year==2002]))
three <- with(summary, sum(Emissions[year==2005]))
four <- with(summary, sum(Emissions[year==2008]))

## Create vector of 1999,2002,2005,2008
x <- c(1999,2002,2005,2008)
## Create vector of sums of Emissions
y <- c(one,two,three,four)
## Create Data Frame with sums
data <- data.frame(x,y)


##Opens PNG device, creates 'plot1.png'
png(filename = "plot1.png", width=480, height=480, bg="white")

## Creates plot and sends to file (Won't show on the screen)
plot(y=data$y, x=data$x, type="l", axes=FALSE, xlab=NA, ylab=NA, main="Total Emissions in US from All Sources")
box()
axis(side=1, at=c(1999,2002,2005,2008))
axis(side=2, at=c(3e+6,4e+6,5e+6,6e+6,7e+6,8e+6), las=1, labels=3:8 )
mtext(side=1, "Years", line=2)
mtext(side=2, 'Total Emissions (in Millions of Tons)', line=2)
dev.off()