library(wppExplorer)

set.wpp.year(2019)
countrykey<-data("iso3166")

worldpop <- wpp.indicator("tpop")
worldpop <- as.data.frame(worldpop)
worldpop$Joinkey = paste(worldpop$charcode,"_",worldpop$Year)

medage<- wpp.indicator("medage")

worldpop$Joinkey = paste(worldpop$charcode,"_",worldpop$Year)

