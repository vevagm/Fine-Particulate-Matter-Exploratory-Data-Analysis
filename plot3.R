# read the data, the files need to be in your current working directory 
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# load ggplot
library(ggplot2)

# subset to only data for Baltimore City, Maryland (fips == 24510)
baltimore <- NEI[NEI$fips == 24510, ]


# plot using ggplot
g <- qplot(factor(year), data = baltimore, geom="bar", weight= Emissions, fill=factor(year))
g + facet_grid(. ~ type) + labs(x = "year", y = "Amount of PM2.5 emitted, in tons", title = "total PM2.5 emission from all sources in Baltimore City by type") + guides(fill=guide_legend(title=NULL))

# 4. save to png. 
dev.copy(png, filename = "plot3.png", width = 580, height = 580, units = "px")
dev.off()