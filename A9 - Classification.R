# Display help on data
# Explore data structure
# Data: iris
iris %>% glimpse()

ggplot(iris, aes(x = Petal.Length, y = Sepal.Length, colour = Species)) + 
  geom_point() +
  ggtitle('Iris Species by Petal and Sepal Length')

# Display help on data
? iris

#Added this line to make the data a binary classification
df <- iris %>% mutate(Species=if_else(Species=="versicolor", TRUE, FALSE) %>% as.factor())

# Placeholder cell to create your own data frames from the source data
# Set seed for reproducability
# Hint: set.seed()
set.seed(1222)

# Get 70% of the data for training
# Store in hr.train
# Hint: sample_frac()
iris.train <- iris %>% 
  sample_frac(0.7)

# Creat test set with the remaining rows
# Store in hr.test
# Hint: setdiff()
iris.test <- iris %>%  
  setdiff(iris.train)

# Display row counts of hr.train and hr.test
# Hint: nrow()
print(str_c("iris.train rows: ", nrow(iris.train)))
print(str_c("iris.test rows: ", nrow(iris.test)))

# Compare hr.train + hr.test to hr
nrow(iris.test) + nrow(iris.train) == nrow(iris)

# dimensions of dataset
dim(iris.train)



```

# Classification Model 1
Update this text to summarize this result.
```{r}
# species to numeric, naming field as is.versicolor.  This model is to determine if the iris is versicolor by measuring the petal lengths.  Similar to the hight of a child...is it a boy or girl if all i know is the hight?

iris[['is.versicolor']] <- as.numeric(iris[['Species']] == 'versicolor')

fit.logit <- glm(is.versicolor ~ Petal.Length, data = iris,
                 family = binomial(link = 'logit'))
summary(fit.logit)

# Calculate the confidence interval for the model coefficients
cat('Confidence intervals of model coefficients')
fit.logit %>% confint()
```
```{r}

fit.logit <- glm(is.versicolor ~ Petal.Length + Sepal.Length, data = iris,
                 family = binomial(link = 'logit'))
summary(fit.logit)

# Calculate the confidence interval for the model coefficients
cat('Confidence intervals of model coefficients')
fit.logit %>% confint()

#> Number of Fisher Scoring iterations: 4
iris[['Predict.Versicolor.logit']] <- as.numeric(predict(fit.logit) > 0.5)
table(iris[, c('is.versicolor', 'Predict.Versicolor.logit')])
```

# Analysis and Conclusions
# only one versicolor was predicted meaning that the model is producing false negatives.  
# What can fields can be used to determine that the iris is a versicolor? The current model 
#is too restricite and should be modified.  A good test could be to modify the model until 
#it is producing false positives.  Also what is the requiement for the model...
#is it better to have false negatives like the current model or false positives? What are the 'business requirements' for this study?
  