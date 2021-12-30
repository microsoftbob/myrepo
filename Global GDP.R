#####Following Code pulls in annual GDP for all countries USD##### 
library(rdbnomics)
dim <- list(
  country = countrylist,
  indicator = c("NY.GDP.MKTP.CD")
)
GlobalGDP<- rdb("WB", "WDI", dimensions = dim)
rm(dim)

GlobalGDP$GDP <- GlobalGDP$value
GlobalGDP$charcode <- GlobalGDP$country
GlobalGDP <- merge(x = GlobalGDP, y = countrykey, 
                   by = "charcode", 
                   all.x = TRUE)
GlobalGDP$Joinkey = paste(GlobalGDP$charcode,"_",GlobalGDP$original_period)
