#####Pulls in Fixed InternetUsers Subscriptions Per 100 People##### 
library(rdbnomics)
InternetUsers <-rdb("UNDP", "HDR", mask = "43606")

InternetUsers$InternetUsers <- InternetUsers$value
InternetUsers$charcode <- InternetUsers$country
InternetUsers <- merge(x = InternetUsers, y = countrykey, 
                   by = "charcode", 
                   all.x = TRUE, 
                   suffixes = ".cp")
InternetUsers$Joinkey = paste(InternetUsers$charcode,"_",InternetUsers$original_period)

library(dplyr)
InternetUsers <- InternetUsers %>%
  select(19, 24)