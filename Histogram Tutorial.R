#### Histogram ####
library(lattice)
histogram(table1$`Stock Level`,
  main = "R Lattice Histogram",  #### Main Plot Title ####
  xlab = "Length",               #### X Axis Label ####
  ylab = "Total Percentage",      #### Y Axis Label ####
  col = c("chocolate2", "seagreen"), #### Color Bars ####
  breaks = 8
)
  #### Multiple Histograms in 1 view ####
histogram(~ table1$`Stock Level | Species, data = iris,
          main = "R Lattice Histogram",
          xlab = "Length",
          ylab = "Total Percentage",
          col = c("chocolate2", "seagreen"))