#Script to plot data and model

growth_data <- read.csv("experiment")

#defining a function to plot the model
logistic_fun <- function(t) {
  #this is plotting the values predicted by the model based on the parameters defined below  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#approximating parameter values from two simplified linear equations (see fit_model_R)

#using model 1 (exponential growth when K>> N0):
N0 <- exp(6.8941709) #6.8941709 is the intercept of model 1, which is the initial population size
#use exp() of it because 6.8941709 is given as ln(N0) and exp(ln(N0)) gives N0
  
r <- 0.0100086 #gradient of model 1 (rate of change of population size)

#using model 2 (constant N=K):
K <- 6.000e+10 #output of model 2 gives us the value of N=K as 6.000e+10
  #here e is not eulers number, it is representing 10

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
theme_minimal()
#this is plotting the data against the model to check fit! 
  #it fits really well :)

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() + scale_y_continuous(trans='log10') +
theme_minimal()
  #this is the semi-log version of the plot - different way of viewing the relationship, model still fits well


