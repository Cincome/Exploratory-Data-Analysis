##Creates a plot of emissions of Motor Vehicles in Baltimore City from 199-2008
## I chose to subset the Baltimore & Los Angeles County Emissions data by 'On-Road' b/c it seems to contain all the vehicle data for the area
## Assumes data is in the working directory
## Load 'ggplot2' library
library(ggplot2)

## Read Data
summary <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

##Merges the data files together
merged <- merge(summary, src, by.x="SCC", by.y="SCC")

##Subsets Baltimore City and Los Angeles County by fips column
baltLA <- subset(merged, fips=="24510"|fips=="06037")
## Subsets Baltimore City and Los Angeles County data to On-Road
motorBaltLA <- baltLA[which(baltLA$Data.Category=="Onroad"), ]

##Changes Facet Labels
mf_labeller <- function(var, value){
  value <- as.character(value)
  if (var=="fips") { 
    value[value=="06037"] <- "Los Angeles County"
    value[value=="24510"]   <- "Baltimore City"
  }
  return(value)}
## Creates basic plot of Motor Vehicle Emissions in LA County and Baltimore City
g <- ggplot(baltLA, aes(year, Emissions))
g+geom_point(aes(color=fips), alpha=1/2, size=3)+facet_grid(.~fips, labeller=mf_labeller)+scale_x_continuous(breaks=c(1999,2002,2005,2008))+
  xlab("Years")+ylab("Emissions (in Tons)")+theme(legend.position="none")+
  ggtitle("Motor Vehicle Emissions")

##Saves ggplot as png
ggsave(file="plot6.png", height=3, width=6)