#####Following Code pulls in GDP Per Capita in USD##### 
dim <- list(
  country = countrylist,
  indicator = c("NY.GDP.PCAP.CD")
)
GlobalGDP_PC<- rdb("WB", "WDI", dimensions = dim)
rm(dim)

GlobalGDP_PC$GDP_PC <- GlobalGDP_PC$value
GlobalGDP_PC$charcode <- GlobalGDP_PC$country
GlobalGDP_PC <- merge(x = GlobalGDP_PC, y = countrykey, 
                      by = "charcode", 
                      all.x = TRUE)
GlobalGDP_PC$Joinkey = paste(GlobalGDP_PC$charcode,"_",GlobalGDP_PC$original_period)

library(dplyr)
GlobalGDP_PC <- GlobalGDP_PC %>%
  select(13, 14, 16, 21)