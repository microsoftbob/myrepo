#####Economics Data#####
#From- https://db.nomics.world/
#https://www.r-bloggers.com/2018/11/dbnomics-r-client-a-tutorial/

   library(wppExplorer)

   #Set Package year#
   set.wpp.year(2019)
   data("iso3166")
   #Pull in Country and Code convention#
   countrykey<-iso3166
   rm(iso3166)
   rm(iso3166ud)
   tmod <- as.vector(countrykey$charcode) 

#####Following Code pulls in annual GDP for all countries USD##### 
library(rdbnomics)
dim <- list(
  country = tmod,
  indicator = c("NY.GDP.MKTP.CD")
)
GlobalGDP<- rdb("WB", "WDI", dimensions = dim)
rm(dim)

GlobalGDP$charcode <- GlobalGDP$country
GlobalGDP <- merge(x = GlobalGDP, y = countrykey, 
                  by = "charcode", 
                  all.x = TRUE)
GlobalGDP$Joinkey = paste(GlobalGDP$charcode,"_",GlobalGDP$original_period)

#####Following Code pulls in GDP Per Capita in USD##### 
dim <- list(
  country = tmod,
  indicator = c("NY.GDP.PCAP.CD")
)
GlobalGDP_PC<- rdb("WB", "WDI", dimensions = dim)
rm(dim)

GlobalGDP_PC$charcode <- GlobalGDP_PC$country
GlobalGDP_PC <- merge(x = GlobalGDP_PC, y = countrykey, 
                   by = "charcode", 
                   all.x = TRUE)
GlobalGDP_PC$Joinkey = paste(GlobalGDP_PC$charcode,"_",GlobalGDP_PC$original_period)

#####Following Code pulls in Business friendly indicator##### 
dim <- list(
  country = tmod,
  indicator = c("IC.BUS.EASE.XQ")
)
Bus_Friendly_Laws_Ind<- rdb("WB", "JOBS", dimensions = dim)
rm(dim)

Bus_Friendly_Laws_Ind$charcode <- Bus_Friendly_Laws_Ind$country
Bus_Friendly_Laws_Ind <- merge(x = Bus_Friendly_Laws_Ind, y = countrykey, 
                      by = "charcode", 
                      all.x = TRUE)
Bus_Friendly_Laws_Ind$Joinkey = paste(Bus_Friendly_Laws_Ind$charcode,"_",Bus_Friendly_Laws_Ind$original_period)
#Bus_Friendly_Laws_Ind<- subset(Bus_Friendly_Laws_Ind, value = NULL)

#####Subsetting#####
GlobalGDP_PC1<- subset(GlobalGDP_PC, original_period == 2020)
GlobalGDP_PC1<- subset(GlobalGDP_PC1, is.country == TRUE)
GlobalGDP_PC1[order(GlobalGDP_PC1$value),]

rm(GlobalGDP_PC1)

