
# Load libraries
# Do not load any additional libraries other than what is provided in this template
library(tidyverse)

# Explore data structure
# Data: diamonds
diamonds %>% glimpse()

# Display help on data
? diamonds

# Optional: placeholder cell to create your own data frames from the source data
diamonds %>% 
   rename( girlsbestfriend = price ) %>% 
   names()

diamonds %>% 
   select(girlsbestfriend = price, contains ("r"), ends_with ("h"),starts_with ("t") ) %>% 
   names()

# chart 1 - ggplot charts with price as the y axis in all of them
ggplot(data = diamonds, mapping = aes( x = carat, y = price, color = color )) + 
   geom_jitter( alpha = 0.9 ) + 
   geom_smooth(method = "lm" , se = FALSE) +
   labs(title="Diamonds: carat vs price", 
        subtitle="Points jittered + alpha blended")

ggplot(data = diamonds, mapping = aes( x = carat, y = price, color = color )) + 
   geom_jitter(alpha = 0.5) + 
   geom_smooth(method = "lm", se = FALSE) +
   facet_wrap( ~ color ) +
   labs(title="Diamond trend: carat vs price by color", 
        subtitle="Points jittered + alpha blended + class color + facet color")

ggplot(data = diamonds, mapping = aes( x = clarity, y = price, color = color )) + 
   geom_jitter(alpha = 0.5) + 
   geom_smooth(method = "lm", se = FALSE) +
   facet_wrap( ~ cut ) +
   labs(title="Diamond trend: carat vs price by color", 
        subtitle="Points jittered + alpha blended + class color + facet color")
