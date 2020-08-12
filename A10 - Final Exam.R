---
  title: "Final Project"
output: html_notebook
---
  
  # Assignment Instructions
  
  Create a multivariate prediction model and perform data analyis of a dataset you choose. This can be either a linear regression, or a classification. 
This includes:
  
  * 1 point - All code blocks run without error. 
* 2 points - Create 2 charts exploring the data with respect to the prediction variable (label)#
* 2 points - Create a hypothesis and perform a t.test to reject or fail to reject that hypothesis#
* 1 point - Split the data into training set and testing set for each model and wrangle the data as desired #
* 3 points - Create 2 prediction models of your chosen type (regression | classification), with at least one multivariate model  including visualizing the results of each model
* 2 points - Compare the performance of your models
* 1 point - Include a written analysis of your prediction referencing using data to support your conclusions.

The above is what is required to achieve full credit for the assignment. You are welcome and encouraged to go above and beyond these requirements, just be sure these requirements are fully met first. 

## R Features
* You are welcome to use any feature covered in this class
* You are welcome to load any library that is already installed in the virtual environment, but you cannot install new packages. You can also reference installed packages by library name::function_name to avoid naming conflicts
* Use set.seed() as necessary to ensure reproducability as the instructor / TA will run the code to grade it
* Ensure your code runs to completion within 60 minutes from start to finish. You may save and load pre-trained models with your instructor's prior permission if you feel you need to exceed this time limit.

## Dataset
* Your choice. Be sure the data lends itself to supervised learning, with a label and is appropriate for either regression or classification. Remove any personally identifiable data. 
* Suggested data source [UCI Machine Learning Repository](http://mlr.cs.umass.edu/ml/datasets.html) and look for Data Types == Multivariate and Default Task in (Classification, Regression)
* The data would need to be uploaded to the virtual environment such that the instructor or TA can run the code without error. 
```{r}
# Load libraries
# Load any additional libraries. No install.package()
library(lubridate)
library(tidyverse)
install.packages("Metrics")
library(Metrics)

# set.seed for reproducible results, i have no idea what this means....
sim.data <- function(x1, y1, x2, y2, n, sd){
  error <- rnorm(n, mean = 0, sd = sd)
  data.frame(
              x = seq(from = x1, to = x2, length.out = n),
              y = (seq(from = y1, to = y2, length.out = n) + error)
  )
}
set.seed(1222) 
reg.data = sim.data(0,0,10,10,50,1)

```{r}
# Placeholder
kc_house_data =read.csv("kc_house_data.csv")

glimpse(kc_house_data)

df_kc_house_data <- select(kc_house_data, date, price, bedrooms,bathrooms, zipcode)

df_kc_house_data_price <- "kc_house_data.csv" %>% read_csv() %>% mutate_if(is.character, as.factor) %>% select(zipcode, price, bedrooms, bathrooms)

df_kc_house_data_study <- filter(df_kc_house_data, zipcode == 98007)

df_MyHouse <- filter(df_kc_house_data, zipcode == 98105)

df_kc_house_data_study_twobedroom <- filter(df_kc_house_data, bedrooms == 3, zipcode == 98007)

df_kc_house_data_study_threebedroom <- filter(df_kc_house_data, bedrooms == 4, zipcode == 98007)

df_kc_house_data_study %>% glimpse() %>% summary()

df_kc_house_data_study_twobedroom %>% glimpse() %>% summary()

df_kc_house_data_study_threebedroom %>% glimpse() %>% summary ()

df_MyHouse %>% glimpse() %>% summary ()

#df_kc_house_data_study %>% head ()

ggplot(df_kc_house_data_study, aes(x = as.factor(bedrooms), y = price)) + 
geom_boxplot() +
  geom_smooth(method = "lm", se=FALSE, color="red", aes(group=1))
   labs(title="Boxplot: the relationship between bedrooms and price")

# interesting there is no increase in house price from 1 bathroom, 1.25 and 1.5  Then a steady increase in price from 1.75 to 2.5
ggplot(df_kc_house_data_study, aes(x = as.factor(bathrooms), y = price)) + 
geom_boxplot() +
  geom_smooth(method = "lm", se=FALSE, color="red", aes(group=1))
   labs(title="Boxplot: the relationship between bathrooms and price")

```{r}
# Tryin to understand the relationship between the number of bedrooms and number of bathrooms to determine the price of a house. 
# Does more bathroom = higher price or is the relationship more complicated than that.

ggplot(data = df_kc_house_data_study, mapping = aes( x = bedrooms, y = price, color = as.factor(bathrooms) )) + 
   geom_jitter( alpha = 0.5 ) + 
  # geom_smooth(method = "lm" , se = FALSE) +
  facet_wrap(~ bedrooms) +
   labs(title="price trend: price vs bedrooms and bathrooms", 
        subtitle="Points jittered + alpha blended")
        
```{r}
# Placeholder cell to create your own data frames from the source data

df_threebedroom <- df_kc_house_data_study %>% filter(bedrooms == 3)
df_threebedroom %>% glimpse()

df_fourbedroom <- df_kc_house_data_study %>% filter(bedrooms == 4)
df_fourbedroom%>% glimpse()

df_threebedroom_mean <- df_threebedroom$price %>% mean() %>% round(1)
df_threebedroom_sd <- df_threebedroom$price %>% sd() %>% round(1)

cat(str_c("Three Bedroom: mean ", df_threebedroom_mean, " and standard deviation ' ", df_threebedroom_sd))

df_fourbedroom_mean <- df_fourbedroom$price %>% mean() %>% round(1)
df_fourbedroom_sd <- df_fourbedroom$price %>% sd() %>% round(1)

cat(str_c("Four Bedroom: mean ", df_fourbedroom_mean, " and standard deviation ' ", df_fourbedroom_sd))

cat("\n**** Four Bedroom < Three Bedroom ****")

```{r}
# Placeholder cell to create your own data frames from the source data

df_threebedroom <- df_kc_house_data_study %>% filter(bedrooms == 3)
df_threebedroom %>% glimpse()

df_fourbedroom <- df_kc_house_data_study %>% filter(bedrooms == 4)
df_fourbedroom%>% glimpse()

df_threebedroom_mean <- df_threebedroom$price %>% mean() %>% round(1)
df_threebedroom_sd <- df_threebedroom$price %>% sd() %>% round(1)

cat(str_c("Three Bedroom: mean ", df_threebedroom_mean, " and standard deviation ' ", df_threebedroom_sd))

df_fourbedroom_mean <- df_fourbedroom$price %>% mean() %>% round(1)
df_fourbedroom_sd <- df_fourbedroom$price %>% sd() %>% round(1)

cat(str_c("Four Bedroom: mean ", df_fourbedroom_mean, " and standard deviation ' ", df_fourbedroom_sd))

cat("\n**** Four Bedroom < Three Bedroom ****")

t.test(df_fourbedroom$price, df_threebedroom$price, conf.level = 0.95, alternative = "less")

cat("\n**** Four Bedroom > Three Bedroom ****")
t.test(df_fourbedroom$price, df_threebedroom$price, conf.level = 0.95, alternative = "greater")


cat("\n**** Four Bedroom != Three Bedroom ****")
t.test(df_fourbedroom$price, df_threebedroom$price, conf.level = 0.95, alternative = "two.sided")

# can reject the null hypothesis ....

```
# Split into train / test sets
```{r}
# Placeholder 70/30 test sets for supervised learning models

# Get 70% of the data for training
# Store in price.train
price.train <- df_kc_house_data_study %>% 
  sample_frac(0.7)

# Creat test set with the remaining rows

# Store in price.test
price.test <- df_kc_house_data_study %>%  
  setdiff(price.train)

# Display row counts of price.train and price.test

```{r}
# placeholder lm with bedrooms and bathrooms for one zip code
# Create an linear model of predicting a house price only using number of bedrooms in a singe zip code 98007
# price = f(bedrooms) 

mod = lm(price ~ bedrooms, data = price.train)
price.train$score <- predict(mod, data = price.train)
head(reg.data, 10)


# Print the confidence interval of the model coefficients

cat('The coefficient confidence intervals')
price.mod.train %>% confint()


# Print the confidence interval of the model coefficients
cat('The coefficient confidence intervals')
price.mod %>% confint()




```

```{r}
# placeholder lm with bedrooms and bathrooms for one zip code
# Create a model prdicting a house price using number of bedrooms and number of bathrooms in a single zip code 98007
# price = (bedrooms) 

price.mod <- lm(price ~ bedrooms, data = price.test)

mod = lm(price ~ bedrooms, data = price.test)
price.test$score <- predict(mod, data = price.test)
head(reg.data, 10)

# View the model summary

price.mod %>% summary()

# Model Performance Comparison
```{r}
price.train$resids <- price.train$price - price.train$score
head(price.train, 10)

price.test$resids <- price.test$price - price.test$score
head(price.test, 10)

plot.resids_train <- function(price.train){
    require(ggplot2)
    require(gridExtra)
    p1 = ggplot(price.train, aes(resids, ..density..)) +
    
          geom_histogram(bins = 10, alpha = 0.3, color = 'blue') +
      geom_density(size = 1) +
      xlab('Residual value')
      ggtitle('Histogram and density function \n for residuals')
    p2 = ggplot(price.train, aes(sample = resids)) +
      geom_qq() +
      ggtitle('Qantile quantile Normal plot \n of residuals')
    grid.arrange(p1, p2, ncol = 2)
}
plot.resids(price.train)


plot.resids_test <- function(price.test){
    require(ggplot2)
    require(gridExtra)
    p1 = ggplot(price.test, aes(resids, ..density..)) +
      geom_histogram(bins = 10, alpha = 0.3, color = 'blue') +
      geom_density(size = 1) +
      xlab('Residual value')
      ggtitle('Histogram and density function \n for residuals')
    p2 = ggplot(price.test, aes(sample = resids)) +
      geom_qq() +
      ggtitle('Qantile quantile Normal plot \n of residuals test data set')
    grid.arrange(p1, p2, ncol = 2)
}
plot.resids_test(price.test)

summary(mod)
cat('The coefficient condifence intervals')
confint(mod)

```
# Analysis and Conclusions
Per the resids the model is too innacurate to make any house purchases based on the models price predictions.  Further fields would have to be added to make the model useful for predicting the price of a house.

The data is also messy in that there are a large number of outliers in the dataset with some extreme high prices, I assumed the prices were correct so I kept them in the dataset.  This will skew the comparables, comps, and make the average house more expensive than it should sell for.

The histogram should have a normal distribution but does not meaning there are large amoutns of errors in the model.  

The residual mean is -38,000 which is NOT close to zero, making the model not useful for predicting the price of a house. 

Resids should be close to zero and they are not. Although the test model performed better than the train model additional factors would need to be included such as adding bathrooms and removing the outliers
