#For Metrics Project 1 
#10 18 2021, 10:34

#Pull in the data from the correct spreadsheet 

chro <- read_excel(file.choose())
chro


#Summarize information about the data in general. 

describe(chro)

#Chronbach's Alpha 

cronbach(chro[,c("NBC1a", "NBC1c", "NBC1g", "NBC1kr")])
item.total(chro[,c("NBC1a", "NBC1c", "NBC1g", "NBC1kr")])


#Create Column for Leadership Team Openness

chro$openness.S<-rowMeans(chro[,c("NBC1a", "NBC1c", "NBC1g", "NBC1kr")],na.rm=TRUE)
histogram(chro$openness.S)

describe(chro$openness.S)

#To find info about Firm 49 

chro$openness.S[chro$FirmID==49]

#This tells me which firms are below 2 std 
chro$FirmID[chro$openness.S<2.2&!is.na(chro$openness.S)]
