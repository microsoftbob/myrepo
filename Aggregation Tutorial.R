#### Remove Rows From Table ####

table1 = table1[-c(1, 2,3,4,5,6,7),]
table1


#### Aggregate by Field ####
table1a <- aggregate(table1$`Actual People`, 
        by=list(Total=table1$`City`), 
        FUN=sum
)
table1a

