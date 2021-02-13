# 1. Create a character vector of five elements
my_strings <- c('Have', 'a', '"R"eally', 'nice', 'day')

# 1a. Access the 1st and 4th elements
my_strings[c(1,4)]

# 1a. more exotic way ;)
my_strings[c(sqrt(1), 2^2)]

# 2. Create two vectors x and y of length 4; 
# one containing numeric and the other logical values. 
# Multiply them and pass the result to z. What is
# the result?

x <- c(1, 2, 3, 4)
y <- c(TRUE, FALSE, TRUE, FALSE)
z <- x * y
z

### Logicals get coerced into numerics; under
### the hood they are represented as 1's and 0's...
### The same thing happens in Excel; try it!

# 3. Download the `nycflights13` package from CRAN. 
# How many datasets are included with this package?

# install.packages('nycflights13')
library(nycflights13)
data(package = 'nycflights13')
### 5 packages

# 3a. One of these packages is called `airports`. 
# Print the first few rows of this data frame as well as the descriptive statistics.

data('airports')

head(airports)
summary(airports)

# 3b. Another is called `weather`. 
# Find the tenth through twelfth rows and the 
# fourth through seventh columns of this data frame. 
# Write the results to a `.csv` file and an Excel workbook.

data('weather')

weather_subset <- weather[10:12, 4:7]

library(tidyverse)
write_csv(weather_subset, 'output/weather_subset.csv')

library(writexl)
write_xlsx(weather_subset, 'output/weather_subset.xlsx')
