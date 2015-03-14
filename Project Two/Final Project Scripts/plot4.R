## Creates a plot of total US Coal-combustion related sources from 1999-2008
## I chose to interpret Coal-combustion as any row that had coal in the 'Short.Name' column
## Assumes files are in the working directory
## Load 'ggplot2' library
library(ggplot2)
## Read Data
summary <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

##Merges the data files together
merged <- merge(summary, src, by.x="SCC", by.y="SCC")

##Subsets to only Coal-combustion related sources
coalComb <- subset(merged, grepl("Coal", merged[[8]]), drop=TRUE)

##Creates basic ggplot of Coal Emissions over Time, from the Coal-combustion subset data
g <- ggplot(coalComb, aes(year,Emissions))
## Creates Point Plot of Coal-combustion Emissions over Time
g+geom_point(color="steelblue", alpha=1/3, size=3)+scale_x_continuous(breaks=c(1999,2002,2005,2008))+
  xlab("Years")+ylab("Emissions (in Tons)")+ggtitle("Total Coal Combustion Emissions in the US (1999-2008)")

##Saves ggplot as png
ggsave(file="plot4.png", height=3, width=6)