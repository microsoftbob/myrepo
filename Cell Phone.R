#####Pulls in Fixed Cellphone Subscriptions Per 100 People##### 
library(rdbnomics)
dim <- list(
  country = countrylist,
  indicator = c("IT.CEL.SETS.P2")
)
Cellphone<- rdb("WB", "JOBS", dimensions = dim)
rm(dim)

Cellphone$Cellphone <- Cellphone$value
Cellphone$charcode <- Cellphone$country
Cellphone <- merge(x = Cellphone, y = countrykey, 
                   by = "charcode", 
                   all.x = TRUE, 
                   suffixes = ".cp")
Cellphone$Joinkey = paste(Cellphone$charcode,"_",Cellphone$original_period)

library(dplyr)
Cellphone <- Cellphone %>%
  select(16, 21)