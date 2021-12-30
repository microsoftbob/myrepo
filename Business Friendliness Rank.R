#####Following Code pulls in Business friendly indicator##### 
dim <- list(
  country = countrylist,
  indicator = c("IC.BUS.EASE.XQ")
)
Bus_Friendly_Laws_Ind<- rdb("WB", "JOBS", dimensions = dim)
rm(dim)

Bus_Friendly_Laws_Ind$Bus_Friendliness <- Bus_Friendly_Laws_Ind$value
Bus_Friendly_Laws_Ind$charcode <- Bus_Friendly_Laws_Ind$country
Bus_Friendly_Laws_Ind <- merge(x = Bus_Friendly_Laws_Ind, y = countrykey, 
                               by = "charcode", 
                               all.x = TRUE)
Bus_Friendly_Laws_Ind$Joinkey = paste(Bus_Friendly_Laws_Ind$charcode,"_",Bus_Friendly_Laws_Ind$original_period)

library(dplyr)
Bus_Friendly_Laws_Ind <- Bus_Friendly_Laws_Ind %>%
  select(13, 14, 16, 21)