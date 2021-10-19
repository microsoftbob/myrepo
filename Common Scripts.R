####Set Working Directory####

setwd("C:/Users/romann/One-Drive - Microsoft/Desktop/R")
source("libraries.R")


####Clear Workspace####

rm(list = ls())

####Read Excel####
library(readxl)
table1 <- read_excel(file.choose())







