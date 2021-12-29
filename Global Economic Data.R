#####Economics Data#####
#From- https://db.nomics.world/
#https://www.r-bloggers.com/2018/11/dbnomics-r-client-a-tutorial/

library(rdbnomics)

dim <- list(
  country = c("DZ", "PE", "AD"),
  indicator = c("NY.GDP.MKTP.CD")
)
df3 <- rdb("WB", "WDI", dimensions = dim)