## Creates a plot of the four sources of emissions in Baltimore City
## Load 'ggplot2' library
library(ggplot2)
## Read Data
summary <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

##Merges the data files together
merged <- merge(summary, src, by.x="SCC", by.y="SCC")

## Subsets data for Baltimore City
baltimore <- merged[which(merged$fips=="24510"), ]
##Creates basic ggplot of Emissions over Time, from the Baltimore subset data
g <- ggplot(baltimore, aes(year,Emissions))
##Creates a plot of Emissions over Time, broken down by Type
g+geom_point(alpha=1/3)+facet_grid(.~type)+scale_x_continuous(breaks=c(1999,2002,2005,2008))+xlab("Years")+ylab("Emissions (in Tons)")+
  ggtitle("Emissions by Type in Baltimore City")+
  theme(text = element_text(size=20), axis.text.x = element_text(angle=90, vjust=1))

## Saves ggplot as a png
ggsave(file="plot3.png", height=4, width=6.5)