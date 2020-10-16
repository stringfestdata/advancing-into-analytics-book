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
my_other_num <- 3
my_int <- 12L
my_log <- F

class(my_num)
class(my_other_num)
typeof(my_num)
typeof(my_other_num)


class(my_char)
typeof(my_num)

class(my_num)
class(my_int)
class(my_log)

typeof(my_num)
