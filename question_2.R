#calculating population size under exponential growth 
#creating function for exponential growth, in terms of t 
exp_fun <- function(t){
  N <- N0*exp(r*t)
  return(N)
}
N0 <- exp(6.8941709)
r <- 0.0100086
exp_fun(4980)
#4.370846e+24

#value predicted under logistic growth
logistic_fun(4980) #using function defined in plot_data_and_model
#6e+10 - as we would expect this matches logistic growth estimate of K - since t = 4980 > 3000

