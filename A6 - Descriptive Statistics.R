# Explore data structure
# Data: diamonds
diamonds %>% glimpse()

# Display help on data
? diamonds

# Placeholder cell to create your own data frames from the source data

df <- diamonds %>% select(carat, cut, color, clarity, price)
df %>% glimpse()

df2 <- df %>% select(price)
df2 %>% glimpse()

print("nrow():")
nrow(df)

print("ncol():")
ncol(df)

print("dim():")
dim(df)

print("length(df):")
length(df)

print("length(df$price)")
length(df$price)

print("glimpse()")
glimpse(df)

print("min")
min(df$price)

print("max")
max(df$price)

print("range")
range(df$price)

# placeholder

print("Mean (avg) of Price")
df$price %>% mean()

print("Median of Price")
df$price %>% median()


print("Mode of Price")
df$price %>% mfv()

print("literal vector")
rank (c(1, 2, 3))

# placeholder

bw <- 10
df %>% ggplot(aes(x=price)) + 
  geom_histogram(binwidth= bw , color="black" , fill="grey" ) +
  theme_classic() +
  labs(title="Histogram of Diamond Prices",
       subtitle=str_c("Binwidth:", bw ),
       x="Price", y="Number of Diamonds")

# density Plot


bw <- 10
df %>% ggplot(aes(x=price)) + 
  # placeholder
  
  df %>% ggplot(aes(x=price)) + 
  geom_density(fill= "blue" ) +
  theme_classic() +
  labs(title="Histogram of Diamond Prices",
       subtitle=str_c("Binwidth:", bw ),
       x="Price", y="Number of Diamonds")

# Violin Plot

df %>% ggplot(aes(x=price)) + 
  geom_violin( ) +
  theme_light() +
  labs(title="Cost by Cut",
       subtitle= "Violin plot",
       x="Price")

# boxplot

df %>% ggplot(aes(x=0, y=price)) +
  geom_boxplot () +
  labs(title="DIamond data",
       subtitle="Boxplot showing quartinles and outliers")