NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
NEI_Baltimore <- NEI[NEI$fips=="24510",]

library(ggplot2)
baltimoreAggregate <- aggregate(Emissions ~ year + type, NEI_Baltimore, sum)
baltimoreAggregate <- transform(baltimoreAggregate, type = factor(type))
gg <- ggplot(baltimoreAggregate, aes(year, Emissions))
gg <- gg + geom_point(color = "red", size=3) + geom_line(col="blue", linetype="dashed") 
gg + facet_wrap(~ type)

dev.copy(png, filename="plot3.png", width=480, height=480);
dev.off()

