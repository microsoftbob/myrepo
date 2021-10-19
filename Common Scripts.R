#### Clear Workspace ####
rm(list = ls())

#### Read Excel ####
library(readxl)
table1 <- read_excel(file.choose())

#### Summarize information about the data in general #### 
library(psych)
describe(table1)
summary(table1)

#### Change Column Name ####
table1$`column name` <- NULL

#### Change Column Data Type ####
table1$'Stock Level' <- as.numeric(table1$'Stock Level')


