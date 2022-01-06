#####This file pulls together economic data in one run####

library(wppExplorer)

#Set Package year#
set.wpp.year(2019)
data("iso3166")
#Pull in Country and Code convention#
countrykey<-iso3166
rm(iso3166)
rm(iso3166ud)
countrylist <- as.vector(countrykey$charcode) 

library(rdbnomics)

source("Global GDP.R")
source("GDP Per Capita.R")
source("Business Friendliness Rank.R")
source("Global Broadband.R")
source("Cell Phone.R")
source("Internet Users.R")

#####Following Code merges sources above into 1 big table##### 
Globalecon <- merge(x = GlobalGDP, y = GlobalGDP_PC, 
                   by = "Joinkey", 
                   all.x = TRUE, 
                   no.dups = TRUE)

Globalecon <- merge(x = Globalecon, y = Bus_Friendly_Laws_Ind, 
                    by = "Joinkey", 
                    all.x = TRUE, 
                    no.dups = TRUE)

Globalecon <- merge(x = Globalecon, y = Broadband, 
                    by = "Joinkey", 
                    all.x = TRUE,
                    no.dups = TRUE)

Globalecon <- merge(x = Globalecon, y = Cellphone, 
                    by = "Joinkey", 
                    all.x = TRUE, 
                    no.dups = TRUE)

Globalecon <- merge(x = Globalecon, y = InternetUsers, 
                    by = "Joinkey", 
                    all.x = TRUE, 
                    no.dups = TRUE)

#####Clean Up#####
rm(GlobalGDP)
rm(GlobalGDP_PC)
rm(Bus_Friendly_Laws_Ind)
rm(Broadband)
rm(Cellphone)
rm(InternetUsers)

rm(countrykey)
rm(countrylist)


#####Subsetting#####
Globalecon1<- subset(Globalecon, original_period >= 2018)
Globalecon1<- subset(Globalecon1, is.country == TRUE)
Globalecon1[order(Globalecon1$value),]

rm(Globalecon1)


#####Analytics#####
library(PerformanceAnalytics)
chart.Correlation(Globalecon1[,c("Cellphone", "Broadband", 
     "GDP_PC", "Bus_Friendliness", "GDP")])