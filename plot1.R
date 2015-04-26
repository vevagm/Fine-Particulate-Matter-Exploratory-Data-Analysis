# read the data, the files need to be in your current working directory 
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# total emissions by year
tepy <- tapply(NEI$Emissions, NEI$year,sum)

# plot
barplot(tepy, main = "total PM2.5 emission from all sources", xlab="year", ylab = "Amount of PM2.5 emitted, in tons", col="blue")

# 4. save to png. 
dev.copy(png, filename = "plot1.png", width = 480, height = 480, units = "px")
dev.off()