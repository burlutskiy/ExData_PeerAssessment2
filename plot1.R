NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
NEI_Total_Emission <- with(NEI, tapply(Emissions, year, sum))

plot(y = NEI_Total_Emission, x = names(NEI_Total_Emission), xlab = "Years", 
     ylab = "Total PM2.5 emission", pch=17, type="o")

dev.copy(png, filename="plot1.png", width=480, height=480);
dev.off()
