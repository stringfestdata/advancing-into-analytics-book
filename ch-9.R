
# Import packages that we need
library(tidyverse)
library(psych)

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
