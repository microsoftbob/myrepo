#### Basic Filterings ####

library(dplyr)
table3a <- filter(table3, Profession == "Engineering")

####Relational operators ####
#  == (Equal to)
#!= (Not equal to)
#< (Less than)
#<= (Less than or equal to)
#> (Greater than)
#>= (Greater than or equal to)


#### Filter on Multiple Variables in dplyr ####
table3a <- filter(table3, Profession == "Engineering" & 
                    Area == "United Kingdom")
