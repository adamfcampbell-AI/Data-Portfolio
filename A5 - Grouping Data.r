
# Load libraries
# Do not load any additional libraries other than what is provided in this template
library(lubridate)
library(tidyverse)

# Explore data structure
# Data: storms
storms %>% glimpse()

# Display help on data
? storms

# Placeholder cell to create your own data frames from the source data
# gather() or spread()
# group_by()
# summarize()
# for() or walk() or map()
# labs()
# %>% pipe
# Map data to color
# A chart includes a categorical variable

libs <- c("tidyverse", "lubridate")

for(lib in libs) {
    print(lib)
}

df <- select(storms, -ts_diameter, -hu_diameter )

glimpse(df)

df %>% distinct(name)

dff <- filter(df, name == "Amy")

dff



# df_filtered %>% glimpse ()

dff %>% 
   group_by(name) %>% 
   summarize(n = n()) %>%
   arrange(n %>% desc()) # Sort by largest class first

df2 <-dff %>% 
   group_by(name) %>% 
   summarize(wind_max = wind %>% max(),
             wind_avg = wind %>% mean(),
             wind_min = wind %>% min())

df2 %>% glimpse()

df2

df3 <- df2 %>% 
   gather(wind_metric ,wind_value ,wind_max:wind_min)

df3

df4 <- df3 %>% 
    mutate(wind_metric = wind_metric %>% str_replace("wind_", ""))

df4

# chart 1 placeholder

df4 %>%
    ggplot(aes(wind_metric ,wind_value)) +
    geom_col() +
       labs(title = "Wind Speeds: Storm Amy")

#first time i ran it looks like this is the sum of avg, min, max for all storms so the numbers aren't useful.  
#Ill filter for a single storm "amy" and order to min, avg, max

# Convert hwy_metric to a factor
# Store result in df4
# Hint: as.factor()



df5 <- df4 %>% 
   mutate(wind_metric = wind_metric %>% as.factor())

# Display the levels and row count
# Hint: fct_count()
df5$wind_metric %>% fct_count()

# Reorder the levels
# min, avg, max
# update df4
# Hint: fct_relevel()
df5 <- df5 %>% 
   mutate(wind_metric = wind_metric %>% fct_relevel(c("min", "avg", "max")))

# Display the levels and row count
# Hint: fct_count()
df5$wind_metric %>% fct_count()

df5 %>% 
   ggplot(aes(wind_metric, wind_value)) + 
    geom_col() +
       labs(title = "Wind Speeds: Storm Amy")

# chart 3 placeholder
#if i have more than one storm it sums the min, max , avg cant figure out how to have more that one storm without it doing that

df5 %>% 
   ggplot(aes(wind_metric, wind_value, , color = name)) + 
    geom_col() +
       labs(title = "Wind Speeds: Storm Amy")
