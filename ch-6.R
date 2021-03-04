1:50

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


1 * 2 # This comment is possible

# This comment is preferred
2 * 1


# What is the absolute value of -100?
abs(-100)


# These aren't going to work!
ABS(-100)
Abs(-100)

# Convert to upper case
toupper('I love R')

# Is 3> 4?
3 > 4

# Assigning an object in R
my_first_object = abs(-100)


# Printing an object in R
my_first_object


my_second_object <- sqrt(abs(-5 ^ 2))
my_second_object

my_char <- 'Hello, world' 
my_other_char <- "We're able to code R!" 
my_num <- 3
my_other_num <- 3.21
my_int <- 12L 
my_logical <- FALSE
my_other_logical <- F

 
str(my_char)
str(my_num)
str(my_int)
str(my_logical)

# Is my_num equal to 5.5?
my_num == 5.5

# Number of characters in my_char
nchar(my_char)


my_other_num <- 2.2
my_num <- my_num/my_other_num
my_num


#install.packages('tidyverse')

?arrange

library(tidyverse)

?arrange

update.packages()


install.packages('installr')
library(installr)
updateR()


