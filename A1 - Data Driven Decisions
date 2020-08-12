
# Load the tidyverse library
library(tidyverse)  

# Let's check out the class of the data
class (diamonds) 

# Use glimpse to display the variable names and sample data
glimpse ( diamonds )

# This may open another window with the result
# If so, you may close it by clicking the x in the upper right of the window
?diamonds

# Create a scatterplot of diamonds 
# price on the y-axis and carat on the x-axis
ggplot(data = diamonds) + 
   geom_point(mapping = aes(x = carat , y = price ))

# Execute help on labs()
? labs

# Create a scatterplot of diamonds 
# price on the y-axis and carat on the x-axis
# Add a title label 'Diamonds carat vs price'
# Add a subtitle 'Banding at 1/2 carat increments'
ggplot(data = diamonds) + 
   geom_point(mapping = aes(x = carat, y = price)) +
   labs(title="Diamonds carat vs price", subtitle="Banding at 1/2 carat increments")
