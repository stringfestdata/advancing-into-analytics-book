# For importing and exploring data
library(tidyverse)
# For reading in Excel files
library(readxl)
# For descriptive statistics
library(psych)
# For writing data to Excel
library(writexl)

my_number <- 8.2
sqrt(my_number)


my_char <- 'Hello, world'
toupper(my_char)

is.vector(my_number)

length(my_number)

my_numbers <- c(5, 8, 2, 7)

is.vector(my_numbers)
str(my_numbers)
length(my_numbers)

sqrt(my_numbers)


roster_names <- c('Jack', 'Jill', 'Billy', 'Susie', 'Johnny')
toupper(roster_names)

my_vec <- c('A', 2, 'C')
my_vec

str(my_vec)

# Get third element of roster_names vector
roster_names[3]

# Get first through third elements
roster_names[1:3]

# Get second through last elements
roster_names[2:length(roster_names)]

# Get second and fifth elements
roster_names[c(2, 5)]


head(iris)


is.data.frame(iris)
str(iris)


?factor

data(package = 'psych')


data('sat.act')
str(sat.act)
