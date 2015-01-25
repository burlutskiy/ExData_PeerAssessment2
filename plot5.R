NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
NEI_Baltimore <- NEI[NEI$fips=="24510",]

f <- factor(SCC$SCC[grep("Vehicle", SCC$SCC.Level.Two)])
NEI_Baltimore_Filtered <- NEI_Baltimore[NEI_Baltimore$SCC %in% f, ]
baltimoreAggregate <- aggregate(Emissions ~ year, NEI_Baltimore_Filtered, sum)
gg <- ggplot(baltimoreAggregate, aes(year, Emissions))
gg + geom_point(color = "red", size=3) + geom_line(col="blue", linetype="dashed") 

dev.copy(png, filename="plot5.png", width=480, height=480);
dev.off()
