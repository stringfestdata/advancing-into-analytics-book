my_number <- 8.2
sqrt(my_number)

my_char <- 'Hello, world'
toupper(my_char)

is.vector(my_number)

length(my_number)

my_numbers <- c(5, 8, 2, 7)


is.vector(my_numbers)
typeof(my_numbers)
length(my_numbers)


sqrt(my_numbers)


roster_names <- c('Jack', 'Jill', 'Billy', 'Susie', 'Johnny')
toupper(roster_names)



my_vec <- c('A', 2, 'C')
my_vec
typeof(my_vec)



roster_names <- c('Jack', 'Jill', 'Billy', 'Susie', 'Johnny')

# Get third element of roster_names vector
roster_names[3]

# Get get first through third elements
roster_names[1:3]

# Get second through last elements
# Check that people don't put space between the :'s
roster_names[2:length(roster_names)]

# Get second and fifth elements
roster_names[c(2, 5)]


roster_names[3]

sort(roster_names)
nchar(roster_names)

# View listing of available datasets
data()

is.data.frame(iris)

# install.packages('Lahman')
# library(Lahman)

data(package = 'Lahman')




# For summary statistics
library(psych)

# For reading in Excel files
library(readxl)


# For importing and exploring data
library(tidyverse)



