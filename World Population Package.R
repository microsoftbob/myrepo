##### Intro#####
#The underlying datasets are based on estimates and projections of 
#the United Nations, Department of Economic and Social Affairs, 
#Population Division (2011, 2013, 2015, 2017, 2019). The 
#probabilistic projections were produced with the method of 
#Raftery et al. (2012).
#https://cran.r-project.org/web/packages/wppExplorer/wppExplorer.pdf
################

library(wppExplorer)

#Set Package year#
set.wpp.year(2019)
data("iso3166")
#Pull in Country and Code convention#
countrykey<-iso3166
rm(iso3166)
rm(iso3166ud)

#Pull in world population and merge with country name#
worldpop <- wpp.indicator("tpop")
worldpop <- as.data.frame(worldpop)
worldpop$Joinkey = paste(worldpop$charcode,"_",worldpop$Year)
worldpop <- merge(x = worldpop, y = countrykey, 
                by = "charcode", 
                all.x = TRUE)
worldpop$'Population' <- worldpop$value
worldpop <- subset(worldpop, select = -c(value)) 

#Pull in Median age by country and year#
medage<- wpp.indicator("medage")
medage<- as.data.frame(medage)
medage$Joinkey = paste(medage$charcode, "_", medage$Year)
worldpop <- merge(x = worldpop, y = medage, 
                  by = "Joinkey", 
                  all.x = TRUE)
worldpop$'Median Age' <- worldpop$value
worldpop <- subset(worldpop, select = -c(charcode.y, Year.y, value))

#Last Steps to clean up table#
worldpop$charcode <- worldpop$charcode.x
worldpop$Year <- worldpop$Year.x
worldpop$Country <- worldpop$name
worldpop <- subset(worldpop, select = -c(charcode.x, Year.x, name))
worldpop[order(worldpop$Country, worldpop$Year), ]
