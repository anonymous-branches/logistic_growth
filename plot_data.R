#Script to plot the logistic growth data

#downloading the experimental data
growth_data <- read.csv("experiment.csv")

#installing packages 
install.packages("ggplot2")
library(ggplot2)

#plotting the experimental data 
#plotting population size against time 
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (minutes)") +
  
  ylab("N") +
  
  theme_bw()

#plotting log(population size) against time
  #this is a semi-log plot 
ggplot(aes(t, N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (minutes)") +
  
  ylab("Log10(N)") +
  
  scale_y_continuous(trans='log10') +
  
  theme_bw()

