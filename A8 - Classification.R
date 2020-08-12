---
  title: "L08-Assignment"
output: html_notebook
---
  
  # Assignment Instructions
  
  * Complete all cells as instructed, replacing any ??? with the appropriate code

* Execute RStudio **Session** > **Restart & Run All Chunks** and ensure that all code blocks run without error

* Do not load any additional libraries. You must use the libraries in the Load Libraries cell provided.

* Meet all of the assignment objectives described below

* RStudio Notebook cells can be added and inserted as desired

# Assignment Objectives


Analyze storms This includes:
  
  * 1 point - All code blocks run without error. RStudio **Session** > **Restart & Run All Chunks**
  * 1 point - Create 3 linear models, with at least one multiple linear model
* 1 point - QQ chart for each model
* 1 point - Include the following R Features at least once. You are not limited to these, only by the libraries loaded.
* 1 point - Include a written analysis of statistically significant features around the storms's category referencing the t-test(s) and linear models as evidence of your conclusions.

The above is what is required to achieve full credit for the assignment. You are welcome and encouraged to go above and beyond these requirements, just be sure these requirements are fully met first. 


## R Features
* t.test()
* 3 uses of lm()
* 3 qq plots, one for each model

## Datasets
* storms

```{r}
# Load libraries
# Do not load any additional libraries other than what is provided in this template
library(lubridate)
library(tidyverse)
```

```{r}
# Explore data structure
# Data: storms
storms %>% glimpse()

# Display help on data
? storms
```

# Data processing
Create a new data frame(s) with appropriate data types and data cleaning for the data.

```{r}
# Placeholder cell to create your own data frames from the source data
df_storm <- select(storms, wind, pressure, category)

df_storm %>% glimpse() %>% summary()

plot(x=storms$wind, y=storms$pressure)

cor(storms$wind, storms$pressure)

cat("\n**** wind != pressure ****")
t.test(storms$wind, storms$pressure, conf.level = 0.95 , alternative="two.sided")


```
```{r}
# wind ~ pressure

mod <- lm(storms$wind ~ storms$pressure)
summary(mod)

qqnorm(storms$wind)
qqline(storms$wind, col='red')

```
```{r}
# placeholder

mod <- lm(storms$day ~ storms$pressure)
summary(mod)

qqnorm(storms$day)
qqline(storms$day, col='red')
```
```{r}
# Multiple Linear Model
mod <- lm(storms$wind ~ storms$pressure + storms$category)

summary(mod)

qqnorm(storms$wind)
qqline(storms$wind, col='red')

```
# Analysis and Conclusions

Residuals are the difference between the observed value and the expected value.  The last model has a median of 0.01 meaning that the 'middle' of the data set is 0.01 different than the expected value.  The min/max describe the lowest and highest value difference from the expected value. 
Residual standard error is the standard deviation of the residuals.
Multiple and Adjusted R squared describe the percent of variance of Y after subtracting the error.  That can be translated into english as the model explains 95% of the dependent variable in this model wind speed.

The p-value is less than 0.5 so we can reject the null hypothesis. 