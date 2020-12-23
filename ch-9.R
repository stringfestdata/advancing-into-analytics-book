
# Import packages that we need
library(tidyverse)
library(psych)
library(tidymodels)


# Read in the data, select only the columns we need
mpg <- read_csv("datasets/mpg/mpg.csv") %>% 
  select(mpg,weight,horsepower,origin,cylinders)
head(mpg)

# Descriptive statistics
describe(mpg)

# One-way frequency table of origin
table(mpg$origin)


# Two-way frequency table
table(mpg$origin, mpg$cylinders)


# Descriptive statistics by group
mpg %>% 
  select(mpg, origin) %>% 
  describeBy(group = 'origin')



# Histogram
ggplot(data = mpg,aes(x = mpg)) +
  geom_histogram()



# Box plot
ggplot(data = mpg,aes(x = origin,y = mpg)) +
  geom_boxplot()


# Facet histogram
ggplot(data = mpg,aes(x = mpg)) +
  geom_histogram()+
  facet_grid(~ origin)




# Is there a difference in mileage? 
mpg_filtered <- filter(mpg, origin == 'USA' | origin == 'Europe')

# Dependent variable ~ independent variable
t.test(mpg ~ origin, data = mpg_filtered)



select(mpg, mpg:horsepower) %>% 
  cor()  

select(mpg, mpg:horsepower) %>% 
  pairs()  

# Scatterplot
ggplot(data=mpg, aes(x=weight,y=mpg)) +
  geom_point() + xlab("weight (pounds)") +
  ylab("mileage (mpg)") + ggtitle("Relationship between weight and mileage")



# Fit the regression, print the summary results
mpg_regression <- lm(mpg ~ weight, data=mpg)
summary(mpg_regression)


# Scatterplot with fit linear regression line
ggplot(data = mpg, aes(x = weight, y = mpg)) + 
  geom_point() + xlab("weight (pounds)") + 
  ylab("mileage (mpg)") + ggtitle("Relationship between weight and mileage") +
  geom_smooth(method = lm)

mpg_split <- initial_split(mpg)

mpg_train <- training(mpg_split)
mpg_test <- testing(mpg_split)

dim(mpg_train)
dim(mpg_test)

# Specify what kind of model this is
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
