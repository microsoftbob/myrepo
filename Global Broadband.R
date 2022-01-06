#####Pulls in Fixed Broadband Subscriptions Per 100 People##### 
library(rdbnomics)
dim <- list(
  country = countrylist,
  indicator = c("IT.NET.BBND.P2")
)
Broadband<- rdb("WB", "JOBS", dimensions = dim)
rm(dim)

Broadband$Broadband <- Broadband$value
Broadband$charcode <- Broadband$country
Broadband <- merge(x = Broadband, y = countrykey, 
                   by = "charcode", 
                   all.x = TRUE)
Broadband$Joinkey = paste(Broadband$charcode,"_",Broadband$original_period)

library(dplyr)
Broadband <- Broadband %>%
  select(16, 21)