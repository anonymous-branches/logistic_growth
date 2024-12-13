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
<figcaption><i>Figure 2. Plot of the raw data, log(population size (N)) against time, with region where K >> N<sub>0</sub> highlighted in orange </i></figcaption>
<br></br>

In `fit_linear_model.R` I subset the experimental data to only include instances where t<1500, then fit a linear model between log N and t. This gave estimates for the values of <b><i>N<sub>0</sub></i> = 987</b> and <b><i>r</i> = 0.0100086</b>.

The second approximation represents the stationary stage of logistic growth, where population size reaches carrying capacity (i.e. the system is at equilibrium). When <i>N<sub>0</sub></i> tends towards <i>K</i> and <i>t</i> tends towards infinity (i.e. is very large), <i>N<sub>t</sub></i> = <i>K</i>.
Therefore by identifying the time period where <i>N<sub>t</sub></i> = <i>K</i>, i.e. <i>t</i> > 3000, we can estimate <i>K</i>.

![case_2_semi_log](https://github.com/user-attachments/assets/ad5c955b-ef55-4927-8fdb-f106bf0893cb)
<figcaption><i>Figure 3. Plot of the raw data, log (population size (N)) against time, with region where N<sub>t</sub> = K highlighted in purple </i></figcaption>
<br></br>

In `fit_linear_model.R` I subset the experimental data to only include instances where t>3000, then fit a linear model with the model formula N ~ 1, which predicts the mean of N (i.e. setting Y = intercept, no x value specified). This gave an estimate for the value of <b><i>K</i> = 6.0 x 10<sup>10</sup></b>.

#### Results
Estimates:
<i>N<sub>0</sub></i> = 987, <i>r</i> = 0.0100086, <i>K</i> = 6.0 x 10<sup>10</sup>

In `plot_data_and_model.R` these estimates were substituted into a model of logisitc growth to produce a plot of the model (red) against the experimental data (black points) used to generate the parameter estimates, allowing visual assessment of how well the model and parameter estimates use describe the population growth observed. It appears to be a good fit.

![model_vs_raw_data](https://github.com/user-attachments/assets/a86f2909-b4dc-4b32-9b57-624ca154cda0)
<figcaption><i>Figure 4. Plot of the raw data (black data points), population size (N) against time, compared to the values predicted by the model (red) </i></figcaption>
<br></br>

## Question 2 
<b>(10 points) Use your estimates of <i>N<sub>0</sub> </i>and <i>r</i> to calculate the population size at <i>t</i> = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?</b>

The code for this question is provided as `question_2.R` in this repository. I created a function (`exp_fun()`) to calculate <i>N<sub>t</sub></i> in terms of <i>t</i>, for specified <i>N<sub>0</sub> </i>and <i>r</i> values. The function was based on the equation for exponential growth (<i>N<sub>t</sub> = N<sub>0</sub>e<sup>rt</sup></i>). 
This predicted than when <i>N<sub>0</sub></i> = 987, <i>r</i> = 0.0100086, and <i>t</i> = 4980, population size would be  4.37 x 10<sup>24</sup>. 

I used the logistic growth function from `plot_data_and_model.R` to estimate population size under logistic growth, 6 x 10<sup>10</sup>. This aligns with what I would expect - as t = 4980 > 3000, so at this time point <i>N=K</i> and as mentioned in question one, my estimate for K was 6.0 x 10<sup>10</sup>.

The value predicted by exponential growth is much larger than the value predicted by logistic growth, which is what I would expect since logistic growth plateaus, whilst exponential growth does not. 

## Question 3 
<b>(20 points) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage.</b>

The code for this question is provided as `question_3.R` in this repository. I used the logistic growth function from the original class work and the exponential function I created in question 2 to generate this plot. I plotted the raw data values to demonstrate which model was a better descriptor of the real population growth (the logistic model).

I truncated the y-axis to only show values within the range predicted by the logistic model, because the exponential model predicted such large population sizes that if both models were plotted for the full time range (t=5000), the pattern of logistic growth was no longer visible as it occurs over a comparatively small range of population size values.

![logistic_vs_exponential](https://github.com/user-attachments/assets/5a01f6e7-088f-4dad-9384-6773821118c8)
<figcaption><i>Figure 5. Plot of the exponential model (blue) and the logistic model (magenta) of population growth. Raw data (black data points) from the simulated experiment plotted for comparison.</i></figcaption>
