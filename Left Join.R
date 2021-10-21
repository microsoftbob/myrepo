#### Left outer join ####
table3 <- merge(x = table1, y = table2, 
                 by = "Personnel Number", 
                 all.x = TRUE)