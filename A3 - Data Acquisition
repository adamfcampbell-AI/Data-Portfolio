
# Load libraries
# Do not load any additional libraries other than what is provided in this template
library(tidyverse)


# Explore data structure
# Data: house_listings

load("house_listings.RData")

house_listings %>% glimpse()

# Placeholder cell to create your own data frames from the source data
df_house <- house_listings %>% 
   mutate(listings = as.factor(listings),
         sales = as.integer(sales),
         median = as.integer(median),
         volume = as.integer(volume))

# Glimpse result
glimpse(df_house)

# Summary result
summary(df_house)
df_house <- df_house %>% 
filter(city %in% c("Dallas", "Austin"))

glimpse(df_house)

# chart 1 placeholder
df_house %>% 
   ggplot(aes(x = year, y = median, color = city)) + 
   geom_jitter(alpha = 0.3) +
   geom_smooth(se = FALSE, method = "lm")
   labs()


# chart 2 placeholder
# chart 1 placeholder
df_house %>% 
   ggplot(aes(x = year, y = median, color = city)) + 
   geom_jitter(alpha = 0.3) +
   geom_smooth(se = FALSE, method = "lm") +
   facet_grid(city ~ .) +
   labs(title="Median trend: Median vs year", 
        subtitle="Points jittered + alpha blended")


# chart 3 placeholder
# chart 1 placeholder
df_house %>% 
   ggplot(aes(x = year, y = listings, color = city)) + 
   geom_jitter(alpha = 0.3) +
   geom_smooth(se = FALSE, method = "lm") +
    facet_grid(city ~ .) +
    labs(title="Listings trend: hwy vs displ", 
        subtitle="Points jittered + alpha blended")

