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

#What is the absolute value of -100?
abs(-100)

toupper('I love R')

3 > 4
my_first_object = abs(-100)
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
my_num == 5.5
nchar(my_char)
my_other_num <- 2.2
my_num <- my_num/my_other_num
my_num
?arrange
library(tidyverse)
update.packages()
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
my_vec <- c('A', 2, 'C')
my_vec
str(my_vec)
roster_names[3]
roster_names[1:3]
roster_names[2:length(roster_names)]
roster_names[c(2, 5)]

roster <- data.frame(
  name = c('Jack', 'Jill', 'Billy', 'Susie', 'Johnny'),
  height = c(72, 65, 68, 69, 66),
  injured = c(FALSE, TRUE, FALSE, FALSE, TRUE))
roster
head(iris)
is.data.frame(iris)
str(iris)
data(package = 'psych')
data('sat.act')
str(sat.act)
read_csv('datasets/star/districts.csv')
districts <- read_csv("datasets/star/districts.csv")
star <- read_xlsx("datasets/star/star.xlsx")
head(star)
glimpse(star)
summary(star)
describe(star)
# Third row, second column of data frame
roster[3, 2]
# Second through fourth rows, first through third columns
roster[2:4, 1:3]
# Second and third rows only
roster[2:3,]
# First and third columns only
roster[, c(1,3)]
roster$height
is.vector(roster$height)
library(tidyverse)
library(readxl)
star <- read_excel('datasets/star/star.xlsx')
head(star)
select(star, tmathssk, treadssk, schidkn)
select(star, -tmathssk, -treadssk, -schidkn)
select(star, -c(tmathssk, treadssk, schidkn))
star <- select(star, tmathssk:totexpk)
head(star)
star <- mutate(star, new_column = tmathssk + treadssk)
head(star)
star <- rename(star, ttl_score = new_column)
head(star)
arrange(star, classk, treadssk)
# Sort by classk descending, treadssk ascending
arrange(star, desc(classk), treadssk)
filter(star, classk == 'small.class')
filter(star, treadssk >= 500)
# Get records where classk is small.class and
# treadssk is at least 500
filter(star, classk == 'small.class' & treadssk >= 500)
star_grouped <- group_by(star, classk)
head(star_grouped)
summarize(star_grouped, avg_math = mean(tmathssk))
star <- read_excel('datasets/star/star.xlsx')
head(star)
head(districts)
left_join(select(star, schidkn, tmathssk, treadssk), districts)
star_grouped <- group_by(star, classk)
star_avg_reading <- summarize(star_grouped, avg_reading = mean(treadssk))
star %>%
  group_by(classk) %>%
  summarise(avg_reading = mean(treadssk)) %>%
  arrange(desc(avg_reading))

star %>%
  group_by(schidkn) %>%
  summarise(avg_read = mean(treadssk), avg_math = mean(tmathssk)) %>%
  arrange(schidkn) %>%
  head()
star_pivot <- star %>%
  select(c(schidkn, treadssk, tmathssk)) %>%
  mutate(id = row_number())


    
star_long <- star %>%
pivot_longer(cols = c(tmathssk, treadssk),
             values_to = 'score', names_to = 'test_type')
head(star_long)
# Rename tmathssk and treadssk as math and reading
star_long <- star_long %>%
  mutate(test_type = recode(test_type,
                            'tmathssk' = 'math', 'treadssk' = 'reading'))
distinct(star_long, test_type)
star_wide <- star_long %>%
  pivot_wider(values_from = 'score', names_from = 'test_type')
head(star_wide)


ggplot(data = star,
       aes(x = classk)) +
  geom_bar()


ggplot(data = star, aes(x = treadssk))+
  geom_histogram()


ggplot(data = star, aes(x = treadssk))+
  geom_histogram(bins = 25, fill = 'blue')


ggplot(data = star, aes(x = treadssk))+
  geom_boxplot()

ggplot(data = star, aes(y = treadssk))+
  geom_boxplot()

ggplot(data = star, aes(x = classk, y = treadssk))+
  geom_boxplot()

ggplot(data = star, aes(x = tmathssk, y = treadssk))+
  geom_point()


ggplot(data = star, aes(x = tmathssk,y = treadssk))+
  geom_point() +
  xlab('Math score') + ylab('Reading score')+
  ggtitle('Math score versus reading score')


library(tidyverse)
library(psych)
library(tidymodels)
# Read in the data, select only the columns we need
mpg <- read_csv("datasets/mpg/mpg.csv") %>%
  select(mpg, weight, horsepower, origin, cylinders)

head(mpg)
describe(mpg)
mpg %>%
  count(origin)
mpg %>%
  count(origin, cylinders) %>%
  pivot_wider(values_from = n, names_from = cylinders)

mpg %>%
  select(mpg, origin) %>%
  describeBy(group = 'origin')
ggplot(data = mpg, aes(x = mpg)) +
  geom_histogram()


# Box plot
ggplot(data = mpg, aes(x = origin, y = mpg)) +
  geom_boxplot()
# Histogram of mpg, facted by origin
ggplot(data = mpg, aes(x = mpg)) +
  geom_histogram() +
  facet_grid(~ origin)
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

mpg_filtered <- filter(mpg, origin=='USA' | origin=='Europe')
t.test(mpg ~ origin, data = mpg_filtered)
select(mpg, mpg:horsepower) %>%
  cor()

ggplot(data = mpg, aes(x = weight,y = mpg)) +
  geom_point() + xlab("weight (pounds)") +
  ylab("mileage (mpg)") + ggtitle("Relationship between weight and mileage")

select(mpg, mpg:horsepower) %>%
  pairs()
mpg_regression <- lm(mpg ~ weight, data = mpg)
summary(mpg_regression)
ggplot(data = mpg, aes(x = weight, y = mpg)) +
  geom_point() + xlab("weight (pounds)") +
  ylab("mileage (mpg)") + ggtitle("Relationship between weight and mileage") +
  geom_smooth(method = lm)


set.seed(1234)

mpg_split <- initial_split(mpg)
mpg_train <- training(mpg_split)
mpg_test <- testing(mpg_split)

dim(mpg_train)
dim(mpg_test)

lm_spec <- linear_reg()
# Fit the model to the data
lm_fit <- lm_spec %>%
  fit(mpg ~ weight, data = mpg_train)
tidy(lm_fit)
glance(lm_fit)
mpg_results <- predict(lm_fit, new_data = mpg_test) %>%
  bind_cols(mpg_test)
mpg_results
rsq(data = mpg_results, truth = mpg, estimate = .pred)
rmse(data = mpg_results, truth = mpg, estimate = .pred)
