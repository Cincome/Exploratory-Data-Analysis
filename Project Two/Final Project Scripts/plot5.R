##Creates a plot of emissions of Motor Vehicles in Baltimore City from 199-2008
## I chose to subset the Baltimore Emissions data by 'On-Road' b/c it seems to contain all the vehicle data for the area
## Assumes that the files are in the working directory 
## Load 'ggplot2' library
library(ggplot2)
## Read Data
summary <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

##Merges the data files together
merged <- merge(summary, src, by.x="SCC", by.y="SCC")

## Subsets data for Baltimore City
baltimore <- merged[which(merged$fips=="24510"), ]
## Subsets data for Onroad
motorBalt <- baltimore[which(baltimore$Data.Category=="Onroad"), ]

## Creates basic ggplot of Motor Vehicle Emissions in Baltimore City over 1999-2008
g <- ggplot(motorBalt, aes(year,Emissions))
## Creates point plot of Motor Vehicle Emissions in Baltimore over Time
g+geom_point(color="steelblue", alpha=1/3, size=3)+scale_x_continuous(breaks=c(1999,2002,2005,2008))+
  xlab("Years")+ylab("Emissions (in Tons)")+ggtitle("Total Motor Vehicle Emissions in Baltimore City (1999-2008)")

##Saves ggplot as png
ggsave(file="plot5.png", height=3, width=6)