NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
NEI_Baltimore <- NEI[NEI$fips=="24510",]
NEI_LosAngelos <- NEI[NEI$fips=="06037",]

f <- factor(SCC$SCC[grep("Vehicle", SCC$SCC.Level.Two)])
NEI_Baltimore_Filtered <- NEI_Baltimore[NEI_Baltimore$SCC %in% f, ]
NEI_Baltimore_Filtered$Place  <- "Baltimor"
NEI_LosAngelos_Filtered <- NEI_LosAngelos[NEI_LosAngelos$SCC %in% f, ]
NEI_LosAngelos_Filtered$Place <- "LosAngelos"
NEI_Both <- rbind(NEI_LosAngelos_Filtered, NEI_Baltimore_Filtered)
aggr <- aggregate(Emissions ~ year + Place, NEI_Both, sum)
aggr[aggr$Place=="LosAngelos",]$Emissions <-scale(aggr[aggr$Place=="LosAngelos",]$Emissions, center = 1)
aggr[aggr$Place=="Baltimor",]$Emissions <-scale(aggr[aggr$Place=="Baltimor",]$Emissions, center = 1)
gg <- ggplot(aggr, aes(year, Emissions))
gg <- gg + geom_point(color = "red", size=3) + geom_line(col="blue", linetype="dashed") 
gg + facet_grid(.~ Place) + ylab("Emissions xTimes (Scaled)")
dev.copy(png, filename="plot6.png", width=480, height=480);
dev.off()
