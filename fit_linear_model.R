#Script to estimate the model parameters using a linear approximation

#install packages
install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))
#from the plot of the raw data, can see K>> N0 when t<1500 

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3000)
#from the plot of the raw data, n(t)= k at t>3000

model2 <- lm(N ~ 1, data_subset2)
#N~1 = setting intercept to the value of N provided in the data_subset2 (when N=K)
  #1 represents the intercept in the model formula 
  #N= 6.000e+10 = k

summary(model2)
