NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

f <- factor(SCC$SCC[grep("Coal", SCC$EI.Sector)])
NEI_US_FILTERED <- NEI[NEI$SCC %in% f, ]
usAggregate <- aggregate(Emissions ~ year, NEI_US_FILTERED, sum)
gg <- ggplot(usAggregate, aes(year, Emissions))
gg + geom_point(color = "red", size=3) + geom_line(col="blue", linetype="dashed") 

dev.copy(png, filename="plot4.png", width=480, height=480);
dev.off()
