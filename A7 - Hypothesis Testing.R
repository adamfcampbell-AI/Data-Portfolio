# hypothesis testing with diamonds
library(tidyvers)

# Explore data structure
# Data: diamonds
diamonds %>% glimpse()

# Display help on data
? diamonds

# Placeholder cell to create your own data frames from the source data
# Create two subsets
df_diamonds <- select(diamonds, price, cut)

# Explore data structure
# Data: diamonds
df_diamonds %>% glimpse() %>% summary()

# Filter data for cut equals Ideal
# Store in dataframe df_ideal
df_ideal <- df_diamonds %>% filter(cut == "Ideal")

# Explore results
df_ideal %>% glimpse()

# Filter data for Neighborhood equal OldTown
# Store in dataframe df_old_town
df_good <- df_diamonds %>% filter(cut == "Good" )

# Explore results
df_good %>% glimpse()

# Get the mean and standard deviation of Ideal
# Round to 1 decimal places
# Hint: mean(), sd(), round()
ideal_mean <- df_ideal$price %>% mean() %>%  round(1)
ideal_sd <- df_ideal$price %>% sd() %>% round(1)

# Print results
cat(str_c("Ideal: mean = ", ideal_mean, " and standard deviation = ", ideal_sd))

# Get the mean and standard deviation of Good
# Round to 1 decimal places
# Hint: mean(), sd(), round()
good_mean <- df_good$price %>% mean() %>%  round(1)
good_sd <- df_good$price %>% sd() %>% round(1)

# Print results
cat(str_c("Good: mean = ", good_mean, " and standard deviation = ", good_sd))

cat("\n**** Ideal != Good ****")
t.test(df_ideal$price, df_good$price, conf.level = 0.95, alternative = "two.sided")

cat("\n**** ideal > good ****")
t.test(df_idea$price, df_good$price, conf.level = 0.95, alternative+"greater")

cat("\n**** ideal > good ****")
t.test(df_ideal$price, df_good$price, conf.level = 0.95, alternative = "less")