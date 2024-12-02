#Script to plot the logistic growth data

#downloading the experimental data
growth_data <- read.csv("experiment.csv")

#installing packages 
install.packages("ggplot2")
library(ggplot2)

#plotting population size against time 
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

#plotting log(population size) against time
  #this is a semi-log plot 
ggplot(aes(t, N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
