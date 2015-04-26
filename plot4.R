# read the data, the files need to be in your current working directory 
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# load ggplot
library(ggplot2)

# subset to only data for coal combustion
coalSCC <- SCC[grep("^fuel comb -(.*)- coal$", SCC$EI.Sector, ignore.case=T),1]
coal <- NEI[is.element(NEI$SCC, coalSCC), ]

# plot using ggplot
g <- qplot(factor(year), data = coal, geom="bar", weight= Emissions, fill=factor(year))
g + labs(x = "year", y = "Amount of PM2.5 emitted, in tons", title = "total PM2.5 emission from coal combustion-related sources") + guides(fill=FALSE)

# 4. save to png. 
dev.copy(png, filename = "plot4.png", width = 480, height = 480, units = "px")
dev.off()