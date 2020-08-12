
# Load libraries
# Do not load any additional libraries other than what is provided in this template
library(odbc) # odbc
library(DBI) # DBI
library(lubridate)
library(tidyverse) # tidyverse

# Connection string info
# Already completed, just run the code block
# Everyone uses the same SQL credentials
driver_name <- "ODBC Driver 13 for SQL Server"
server_name <- "uwc-sqlserver.clients.uw.edu"
database_name <- "AdventureWorks2016CTP3" 
user_id <- "sqlstudentreader"
password <- "PA6aX2gAhe4hE!ru$6atru"

# Connect to the database
# Store connection in conn variable
conn <- dbConnect(odbc::odbc(), 
                  driver = driver_name, 
                  server = server_name, 
                  database = database_name,
                  uid = user_id,
                  pwd = password)

# Print the connection object
print(conn)

# Placeholder cell to create your own data frames from the source data
# Get Sales.SalesOrderHeader
sql_select <- "SELECT * FROM sales.SalesOrderHeader"
df_sales_order_header <- conn %>% 
   dbGetQuery(sql_select)

# Get Sales.SalesOrderDetail
sql_select <- "SELECT * FROM sales.SalesOrderDetail"
df_sales_order_detail <- conn %>% 
   dbGetQuery(sql_select)

sql_select <- "SELECT * FROM Sales.SalesTerritory"
df_sales_territory <- conn %>% 
   dbGetQuery(sql_select) %>% 
   select(-rowguid)

# Glimpse results
glimpse(df_sales_order_header)
glimpse(df_sales_order_detail)

# how many rows are in the table
df_sales_order_header %>% 
   nrow()

# how many SalesOrderID are there?
df_sales_order_header %>% 
   distinct(SalesOrderID) %>% 
    nrow()

# how many revision numbers are there?
df_sales_order_header %>% 
   distinct(RevisionNumber) %>% 
    nrow()

df_sales_order <- df_sales_order_header %>%
   inner_join(df_sales_order_detail, by = "SalesOrderID")

# Glimpse result
glimpse(df_sales_order)

# use of semijoin

# matching on another table it returns the number of rows that match
df_sales_order %>% semi_join(df_sales_territory) %>% 
   glimpse()

df_sales_order %>% semi_join(df_sales_territory %>% filter(TerritoryID != "5")) %>% 
   glimpse()

str_TPS <- "The TPS Report is Due"



# chart 1 placeholder
# Plot: scatterplot 
ggplot(df_sales_order, mapping = aes( x = DueDate, y = TotalDue )) +
   geom_point() 
print(str_TPS)
#too cluttered for the lower TotalDue to be readable

# chart 2 placeholder - cant read the lower TotalDue so lets focus on the top 100 $ due
# Plot the top 100 highest of the prior plot with territoryID
ggplot(head(df_sales_order, n = 100), mapping = aes(x = TerritoryID, y = TotalDue, color = SalesPersonID)) +
geom_jitter(alpha = 0.2)  +  
labs(title = "TerritoryID for the largest TotalDue")

# chart 3 placeholder
# Plot the top 10 highest hwy of the prior plot
ggplot(head(df_sales_order, n = 10), mapping = aes(x = SalesPersonID, y = TotalDue)) +
   geom_jitter(alpha = 0.5) +
    labs(title = "Top 10 TotalDue by sales person")
