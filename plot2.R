# read the data, the files need to be in your current working directory 
# This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# subset to only data for Baltimore City, Maryland (fips == 24510)
baltimore <- NEI[NEI$fips == 24510, ]

# total emissions by year
tepy <- tapply(baltimore$Emissions, baltimore$year,sum)

# plot
barplot(tepy, main = "total PM2.5 emission from all sources in Baltimore City, Maryland", xlab="year", ylab = "Amount of PM2.5 emitted, in tons", col="red", cex.main = 0.75)

# 4. save to png. 
dev.copy(png, filename = "plot2.png", width = 480, height = 480, units = "px")
dev.off()