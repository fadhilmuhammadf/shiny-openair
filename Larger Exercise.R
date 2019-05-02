rm(list = ls(all=TRUE)) 
library(openair)
library(lattice)
library(latticeExtra)
#############################################################################################
mydata <- importAURN(site = "KC1", year = 2016:2017) # London N. Kensington
mydata$NO <- mydata$no
mydata$no <- NULL
mydata$o3 <- NULL
mydata$so2 <- NULL
mydata$nv2.5 <- NULL
mydata$nv10 <- NULL
mydata$v2.5 <- NULL
mydata$v10 <- NULL
#############################################################################################
windRose(mydata, type = "year")
#############################################################################################
summaryPlot(mydata[,c(1,2,11,4,3,8,9,10)], main = "Summary Plot")
# Long Term Decadal SmoothTrend
a <- timePlot(mydata, pollutant=c("co", "NO", "no2", "pm10", "pm2.5"), xlab="Year", ylab="NO, NO2, PM2.5, PM10 (ug/m3) & CO (mg/m3)", 
         col=c("black", "red", "blue", "green", "orange"), 
         avg.time = "hour", lwd = 2, y.relation = "free", main = "Hourly Pollutants Plot", key = FALSE)

b <- timePlot(mydata, pollutant=c("co", "NO", "no2", "pm10", "pm2.5"), xlab="Year", ylab="NO, NO2, PM2.5, PM10 (ug/m3) & CO (mg/m3)", 
         col=c("black", "red", "blue", "green", "orange"), 
         avg.time = "month", lwd = 2, y.relation = "free", main = "Monthly Pollutants Plot", key = FALSE)

c <- timePlot(mydata, pollutant=c("co", "NO", "no2", "pm10", "pm2.5"), xlab="Year", ylab="NO, NO2, PM2.5, PM10 (ug/m3) & CO (mg/m3)", 
         col=c("black", "red", "blue", "green", "orange"), 
         avg.time = "year", lwd = 2, y.relation = "free", main = "Yearly Pollutants Plot" , key = FALSE)

print (a, split= c(1,1,3,1), more = TRUE)
print (b, split= c(2,1,3,1), more = TRUE)
print (c, split= c(3,1,3,1))
##############################################################################################
# Seasonal Trend 
d <- smoothTrend(mydata, pollutant = c("co","NO", "no2"), type = "season", ylab=" NO,NO2 (ug/m3) & CO (mg/m3)", col = c("red","blue", "green"))
e <- smoothTrend(mydata, pollutant = c("pm10", "pm2.5"), type = "season", ylab="PM10, PM2.5 (ug/m3)", col = c("black", "orange"))

print (d, split= c(1,1,2,1), more = TRUE)
print (e, split= c(2,1,2,1))

f <- timePlot(mydata, pollutant=c("co", "NO", "no2", "pm10", "pm2.5"), xlab="Year", ylab="NO, NO2, PM2.5, PM10 (ug/m3) & CO (mg/m3)", 
              col=c("black", "red", "blue", "green", "orange"), 
              avg.time = "season", lwd = 2, y.relation = "free", main = "Seasonal Pollutants Plot" , key = TRUE, pch = c(1,1,1,1,1))
##############################################################################################
# Day of The Week timeVariation plots 
g <- timeVariation(mydata, pollutant=c("pm10","pm2.5" ), statistic = "mean")
h <- timeVariation(mydata, pollutant=c("NO","no2", "co" ), statistic = "mean")

print (g, split= c(1,1,2,1), more = TRUE)
print (h, split= c(2,1,2,1))
###############################################################################################
# Variation of Air Pollutant with Wind Speed and Wind Direction Polar Plot
i <- polarPlot(mydata, pollutant=c("co"), col = "jet", key.header = "Mean CO (mg/m3)", key.footer = NULL, key.position = "bottom")
j <- polarPlot(mydata, pollutant=c("NO"), col = "jet", key.header = "Mean NO (ug/m3)", key.footer = NULL, key.position = "bottom")
k <- polarPlot(mydata, pollutant=c("no2"), col = "jet", key.header = "Mean NO2 (ug/m3)", key.footer = NULL, key.position = "bottom")
l <- polarPlot(mydata, pollutant=c("pm10"), col = "jet", key.header = "Mean pm10 (ug/m3)", key.footer = NULL, key.position = "bottom")
m <- polarPlot(mydata, pollutant=c("pm2.5"), col = "jet", key.header = "Mean pm2.5 (ug/m3)", key.footer = NULL, key.position = "bottom")

print (i, split= c(1,1,3,2), more = TRUE)
print (j, split= c(2,1,3,2), more = TRUE)
print (k, split= c(3,1,3,2), more = TRUE)
print (l, split= c(1,2,3,2), more = TRUE)
print (m, split= c(2,2,3,2))

###############################################################################################
#Compliance use timeAverage
onehour <- timeAverage(mydata, avg.time = "1 hour")
eighthour <- timeAverage(mydata, avg.time = "8 hour")
twentyfourhour <- timeAverage(mydata, avg.time = "1 day")
oneyear <- timeAverage(mydata, avg.time = "1 year")

#Annual
timePlot(mydata, pollutant=c("no2", "pm10", "pm2.5"), xlab="Year", ylab="NO2, PM2.5, PM10 (ug/m3)", 
         col=c("red", "blue", "green", "orange"), 
         avg.time = "year", lwd = 2, main = "Annual Pollutants Compliance Plot", ylim = c(0, 50))

trellis.last.object() + layer(panel.abline(h = 40, lty = 5), rows = 1)
trellis.last.object() + layer(panel.abline(h = 40, lty = 5), rows = 2)
trellis.last.object() + layer(panel.abline(h = 25, lty = 5), rows = 3)

trellis.last.object() + layer(ltext(x = as.POSIXct("2009-10-10"), y = 42, labels = "Air Quality Standard", srt = 0, cex = 0.75), rows = 1)
trellis.last.object() + layer(ltext(x = as.POSIXct("2009-10-10"), y = 42, labels = "Air Quality Standard", srt = 0, cex = 0.75), rows = 2)
trellis.last.object() + layer(ltext(x = as.POSIXct("2009-10-10"), y = 27, labels = "Air Quality Standard", srt = 0, cex = 0.75), rows = 3)

#Daily
z1 <- timePlot(mydata, pollutant=c("pm10"), xlab="Year", ylab="PM10 (ug/m3)",
         col="darkorange", 
         avg.time = "day", lwd = 1, main = "Daily Pollutant Compliance Plot", ylim = c(0, 120))
z2 <- trellis.last.object() + layer(panel.abline(h = 50, lty = 5), rows = 1)
z3 <- trellis.last.object() + layer(ltext(x = as.POSIXct("2009-10-10"), y = 52, labels = "Air Quality Standard", srt = 0, cex = 0.75), rows = 1)

#Hourly
y1 <- timePlot(mydata, pollutant=c("no2"), xlab="Year", ylab="NO2 (ug/m3)", 
         col=c("blue"), lwd = 0.75, main = "Hourly Pollutant Compliance Plot", ylim = c(0, 350))
y2 <- trellis.last.object() + layer(panel.abline(h = 200, lty = 5), rows = 1)
y3 <- trellis.last.object() + layer(ltext(x = as.POSIXct("2009-10-10"), y = 207, labels = "Air Quality Standard", srt = 0, cex = 0.75), rows = 1)

#8 Hour Mean
setwd("D:/Google Drive/Air Pollution/Term 2/Air Quality Data Analysis and Interpretation/Larger Exercise/")
mydata2 = read.csv("CO_8_Hour.csv", header=TRUE, sep=",", row.names=NULL)
mydata$comean <- mydata2$Carbon.monoxide[1:96432]
x1 <- timePlot(mydata, pollutant=c("comean"), xlab="Year", ylab="CO (mg/m3)", 
         col=c("darkgreen"), lwd = 2, main = "8-Hour Running Mean Pollutant Compliance Plot", ylim = c(0,11))
x2 <- trellis.last.object() + layer(panel.abline(h = 10, lty = 5), rows = 1)
x3 <- trellis.last.object() + layer(ltext(x = as.POSIXct("2009-10-10"), y = 10.2, labels = "Air Quality Standard", srt = 0, cex = 0.75), rows = 1)

print (z1, split= c(1,1,3,1), more = TRUE)
print (z2, split= c(1,1,3,1), more = TRUE)
print (z3, split= c(1,1,3,1), more = TRUE)
print (y1, split= c(2,1,3,1), more = TRUE)
print (y2, split= c(2,1,3,1), more = TRUE)
print (y3, split= c(2,1,3,1), more = TRUE)
print (x1, split= c(3,1,3,1), more = TRUE)
print (x2, split= c(3,1,3,1), more = TRUE)
print (x3, split= c(3,1,3,1))
