#Script to estimate the model parameters using a linear approximation

#install packages
install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment.csv")

#Case 1. K >> N0, t is small ####
#from the plot of the raw data, can see K>> N0 when t<1500
#re-plotting experimental data, shading regions on the graphs that demonstrate my choices of model parameters:
#raw data:
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (minutes)") +
  
  ylab("N") +
  
  theme_bw() +
  
  annotate('rect', xmin=0, xmax=1500, ymin =0, ymax=6e+10, fill="orange", alpha=0.4) #adds a shaded rectangle for visualisation

#semi-log plot: 
#can see that when t<1500, culture is demonstrating exponential growth 
ggplot(aes(t, N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (minutes)") +
  
  ylab("Log10(N)") +
  
  annotate('rect', xmin=0, xmax=1500, ymin= 0, ymax=1e+11, fill="orange", alpha=0.4) + #adds a shaded rectangle for visualisation 
  
  scale_y_continuous(trans='log10') +
  
  theme_bw() 

#sub-setting data for instances where t<1500 (i.e. where K>>N0)
data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K ####
#from the plot of the raw data, can see n(t)= k at t>3000
#re-plotting experimental data, shading regions on the graphs that demonstrate my choices of model parameters:
#raw data:
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (minutes)") +
  
  ylab("N") +
  
  theme_bw() +
  
  annotate('rect', xmin=3000, xmax=5000, ymin =0, ymax=6e+10, fill="purple", alpha=0.4) #adds a shaded rectangle for visualisation

#semi-log plot: 
#can see that when t>3000, N=K
ggplot(aes(t, N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (minutes)") +
  
  ylab("Log10(N)") +
  
  annotate('rect', xmin=3000, xmax=5000, ymin= 0, ymax=1e+11, fill="purple", alpha=0.4) + #adds a shaded rectangle for visualisation 
  
  scale_y_continuous(trans='log10') +
  
  theme_bw() 

#sub-setting data for instances where t>3000
data_subset2 <- growth_data %>% filter(t>3000)
#from the plot of the raw data, n(t)= k at t>3000

model2 <- lm(N ~ 1, data_subset2)
#N~1 = setting intercept to the value of N provided in the data_subset2 (when N=K)
  #1 represents the intercept in the model formula 
  #N= 6.000e+10 = k

summary(model2)
