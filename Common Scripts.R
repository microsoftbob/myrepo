#### Clear Workspace ####
rm(list = ls())

#### Read Excel ####
library(readxl)
table1 <- read_excel(file.choose(), skip =9)

library(readxl)
table2 <- read_excel(file.choose(), skip =10)

#### Summarize information about the data in general #### 
library(psych)
describe(table1)
summary(table1)

#### Change Column Name ####
table1$`column name` <- NULL

#### Change Column Data Type ####
table1$'Stock Level' <- as.numeric(table1$'Stock Level')

#### Write Table to Excel ####
write.table(table1, "C:/Users/romann/OneDrive - Microsoft/Desktop/112417a.csv", sep="\t") 

