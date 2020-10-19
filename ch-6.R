1 * 2
3 + 5 - 4

?sqrt

require(stats) # for spline
require(graphics)
xx <- -9:9
plot(xx, sqrt(abs(xx)),  col = "red")
lines(spline(xx, sqrt(abs(xx)), n=101), col = "pink")


# Multiplication before addition
3 * 5 + 6 

# Division before subtraction
2 / 2 - 7

# What is the absolute value of -100?


# Assigning an object in R
my_first_object = abs(-100)


# Printing an object in R
my_first_object

my_second_object <- sqrt(abs(-5^2))
my_second_object


my_char <- 'Hello, world'
my_num <- 3.2
my_int <- 12L
my_logical <- F


typeof(my_char)
typeof(my_num)
typeof(my_int)
typeof(my_logical)


# Is my_num equal to 5.5?
my_num == 5.5

# Number of characters in my_char
# (This is like `LEN()` in Excel)
nchar(my_char)

my_other_num <- 2.2
my_num <- my_num/my_other_num
my_num


# Run this once
# install.packages('tidyverse')

?arrange
arrange(mtcars, cyl, disp)

library(tidyverse)

arrange(mtcars, cyl, disp)





install.packages('installr')
library(installr)
help(package='installr')

