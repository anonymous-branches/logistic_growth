# logistic_growth
R scripts for a reproducible analysis of logistic growth
----
## Question 1 
<b>(10 points) Annotate the README.md file in your logistic_growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for <i>N<sub>0</sub></i>, <i>r</i>, and <i>K</i> (mention which *.csv file you used).</b>
#### Analysis
This analysis modelled population growth of a population of <i>Esherichia coli</i> in bacterial growth media, in a reproducible manner (i.e. clearly formatted code made available on GitHub). The aim was to be able to estimate the initial population size of the bacteria, the rate of growth, and the carrying capacity to generate a model of logistic growth built on simulated experimental data. 
The data was obtained from Jose Gabriel Nino Barreat through OSF (https://osf.io/) and is saved in this repository as `experiment.csv`. 

The population exhibited logistic growth. Logistic growth can be modelled using an equation in terms of <i>N<sub>0</sub></i>, <i>r</i>, and <i>K</i>. These parameters can be estimated using 2 linear approximations. 
![raw_experimental_plot](https://github.com/user-attachments/assets/8eec56b8-c6a0-490c-9d49-a1ba04b75fad)
<figcaption><i>Figure 1. Plot of the raw data, population size (N) against time</i></figcaption>
<br></br>
The first linear approximation represents the initial exponential stage of logistic growth, where <i>K</i> is much greater than <i>N<sub>0</sub></i> (the inital population size). When <i>K</i> >> <i>N<sub>0</sub></i> and <i>t</i> is small, <i>N(t) = N<sub>0</sub>e<sup>rt</sup></i>.
Therefore by identifying the time period where <i>K</i> >> <i>N<sub>0</sub></i>, i.e. <i>t</i> <1500, we can estimate <i>N<sub>0</sub></i> and <i>r</i>.
  
![case_1_semi_log](https://github.com/user-attachments/assets/0689a4db-b16a-4cd7-92cd-5d041389ba74)

In `fit_linear_model.R` I subset the experimental data to only include instances where t<1500, then fit a linear model between log N and t. This gave estimates for the values of <b><i>N<sub>0</sub></i> = 987</b> and <b><i>r</i> = 0.0100086</b>.

The second approximation represents the stationary stage of logistic growth, where population size reaches carrying capacity (i.e. the system is at equilibrium). When <i>N<sub>0</sub></i> tends towards <i>K</i> and <i>t</i> tends towards infinity (i.e. is very large), <i>N<sub>t</sub></i> = <i>K</i>.
Therefore by identifying the time period where <i>N<sub>t</sub></i> = <i>K</i>, i.e. <i>t</i> > 3000, we can estimate <i>K</i>.

![case_2_semi_log](https://github.com/user-attachments/assets/ad5c955b-ef55-4927-8fdb-f106bf0893cb)

In `fit_linear_model.R` I subset the experimental data to only include instances where t>3000, then fit a linear model with the model formula N ~ 1, which predicts the mean of N (i.e. setting Y = intercept, no x value specified). This gave an estimate for the value of <b><i>K</i> = 6.0 x 10<sup>10</sup></b>.
#### Estimates 
<i>N<sub>0</sub></i> = 987, <i>r</i> = 0.0100086, <i>K</i> = 6.0 x 10<sup>10</sup>
## Question 2 
(10 points) Use your estimates of  <i>N<sub>0</sub> </i>and <i>r</i> to calculate the population size at <i>t</i> = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?
## Question 3 
(20 points) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage.
