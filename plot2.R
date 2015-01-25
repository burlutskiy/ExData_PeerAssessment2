NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
NEI_Baltimore <- NEI[NEI$fips=="24510",]
NEI_Total_Emission_Baltimor <- with(NEI_Baltimore, tapply(Emissions, year, sum))

plot(y = NEI_Total_Emission_Baltimor, x = names(NEI_Total_Emission_Baltimor), 
     ylab = "Baltimor PM2.5 emission", xlab = "Years", pch=17, type="o")

dev.copy(png, filename="plot2.png", width=480, height=480);
dev.off()
