library(openair)
#
mary <- importAURN(site = "MY1", year = 2016:2017) # London Marylebone Road 
tyb <- importAURN(site = "BIR1", year = 2007:2017) # Birmingham Tyburn 
ken <- importAURN(site = "KC1", year = 2007:2017) # London N. Kensington
har <- importAURN(site = "HAR", year = 2007:2017) # Harwell
gla_k <- importAURN(site = "GLA4", year = 2007:2017) # Glasgow Kerbside
gla_c <- importAURN(site = "GLA3", year = 2007:2017) # Glasgow Centre
harl <- importAURN(site = "HRL", year = 2007:2017) # London Harlington 
tyb_r <- importAURN(site = "BIRT", year = 2007:2017) # Birmingham Tyburn Roadside 
ted <- importAURN(site = "TED", year = 2007:2017) # London Teddington  
elth <- importAURN(site = "LON6", year = 2007:2017) # London Eltham  
leed <- importAURN(site = "LEED", year = 2007:2017) # Leeds Centre   
sout <- importAURN(site = "sOUT", year = 2007:2017) # Southampton Centre
#
plot(mary$no, type="l")
plot(mary$no2, type="l")
plot(mary$co, type="l")
plot(mary$pm10, type="l")
plot(mary$pm2.5, type="l")
#
plot(tyb$no, type="l")
plot(tyb$no2, type="l")
plot(tyb$co, type="l")
plot(tyb$pm10, type="l")
plot(tyb$pm2.5, type="l")
#
plot(ken$no, type="l")
plot(ken$no2, type="l")
plot(ken$co, type="l")
plot(ken$pm10, type="l")
plot(ken$pm2.5, type="l")
#
plot(har$no, type="l")
plot(har$no2, type="l")
plot(har$co, type="l")
plot(har$pm10, type="l")
plot(har$pm2.5, type="l")
#
plot(gla_k$no, type="l")
plot(gla_k$no2, type="l")
plot(gla_k$co, type="l")
plot(gla_k$pm10, type="l")
plot(gla_k$pm2.5, type="l")
#
plot(gla_c$no, type="l")
plot(gla_c$no2, type="l")
plot(gla_c$co, type="l")
plot(gla_c$pm10, type="l")
plot(gla_c$pm2.5, type="l")
#
plot(harl$no, type="l")
plot(harl$no2, type="l")
plot(harl$co, type="l")
plot(harl$pm10, type="l")
plot(harl$pm2.5, type="l")
#
plot(tyb_r$no, type="l")
plot(tyb_r$no2, type="l")
plot(tyb_r$co, type="l")
plot(tyb_r$pm10, type="l")
plot(tyb_r$pm2.5, type="l")
#
plot(ted$no, type="l")
plot(ted$no2, type="l")
plot(ted$co, type="l")
plot(ted$pm10, type="l")
plot(ted$pm2.5, type="l")
#
plot(elth$no, type="l")
plot(elth$no2, type="l")
plot(elth$co, type="l")
plot(elth$pm10, type="l")
plot(elth$pm2.5, type="l")
#
plot(leed$no, type="l")
plot(leed$no2, type="l")
plot(leed$co, type="l")
plot(leed$pm10, type="l")
plot(leed$pm2.5, type="l")
#
plot(sout$no, type="l")
plot(sout$no2, type="l")
plot(sout$co, type="l")
plot(sout$pm10, type="l")
plot(sout$pm2.5, type="l")
#
pollutionRose(sout, pollutant = "no")
polarPlot(sout, pollutant = "no")
polarPlot(sout, pollutant = "no2")
polarPlot(sout, pollutant = "co")
polarPlot(sout, pollutant = "pm10")
polarPlot(sout, pollutant = "pm2.5")
