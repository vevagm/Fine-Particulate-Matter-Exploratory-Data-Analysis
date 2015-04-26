# read the data, the files need to be in your current working directory 
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# load ggplot
library(ggplot2)

# subset to only data from motor vehicle sources in Baltimore (fips == 24510) and LA (fips == 06037)
motorSCC <- SCC[SCC$Data.Category == "Onroad",1]
motor <- NEI[is.element(NEI$SCC, motorSCC), ]
baltimoreLA <- motor[(motor$fips == "24510" | motor$fips == "06037"), ]
baltimoreLA$fips <- gsub("24510","Baltimore",baltimoreLA$fips)
baltimoreLA$fips <- gsub("06037","Los Angeles",baltimoreLA$fips)

# plot using ggplot
g <- qplot(factor(year), data = baltimoreLA, geom="bar", weight= Emissions, fill=factor(year))
g + facet_grid(. ~ fips) + labs(x = "year", y = "Amount of PM2.5 emitted, in tons", title = "total PM2.5 emission from motor vehicle sources, Baltimore vs LA") + guides(fill=FALSE)

# 4. save to png. 
dev.copy(png, filename = "plot6.png", width = 480, height = 480, units = "px")
dev.off()