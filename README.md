# logistic_growth
R scripts for a reproducible analysis of logistic growth
----
## Question 1 
<b>(10 points) Annotate the README.md file in your logistic_growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for <i>N<sub>0</sub></i>, <i>r</i>, and <i>K</i> (mention which *.csv file you used).</b>
This analysis modelled population growth of a population of <i>Esherichia coli</i> in bacterial growth media, in a reproducible manner (i.e. clearly formatted code made available on GitHub). The aim was to be able to estimate the initial population size of the bacteria, the rate of growth, and the carrying capacity using the model built on simulated experimental data. 
The data was obtained from Jose Gabriel Nino Barreat through OSF (https://osf.io/) and is saved in this repository as `experiment.csv`. 

The population exhibited logistic growth. ![raw_experimental_plot](https://github.com/user-attachments/assets/8eec56b8-c6a0-490c-9d49-a1ba04b75fad "Plot of the raw data, population size (N) against time")


## Question 2 
(10 points) Use your estimates of  <i>N<sub>0</sub> </i>and <i>r</i> to calculate the population size at <i>t</i> = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?
## Question 3 
(20 points) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage.
