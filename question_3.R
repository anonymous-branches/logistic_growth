library(ggplot2)
growth_data <- read.csv("experiment.csv")

#logistic growth function (plot_data_and_model.R)
logistic_fun <- function(t) {
  #this is plotting the values predicted by the model based on the parameters defined below  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

#exponential growth function (question_2.R)
exp_fun <- function(t){
  N <- N0*exp(r*t)
  return(N)
}

#defining parameter values based on my estimates 
N0 <- exp(6.8941709)

r <- 0.0100086 

K <- 6.000e+10 

#plotting the logistic and exponential growth curves
ggplot(aes(t,N), data = growth_data) +#
geom_function(fun=logistic_fun, colour="#D81B60", linewidth=1) +
geom_function(fun=exp_fun, colour="#1E88E5", linewidth = 1) +
  scale_y_continuous(limits = c(0, 6.5e+10), expand = c(0, 0)) + #graph only shows N values within range predicted by logistic model
  geom_point() + #showing raw data to demonstrate how well each model describes data
  xlab("Time (minutes)") +
  ylab("Population size (N)") +
  theme_minimal()
  
