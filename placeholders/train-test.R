library(tidymodels)
library(tidyverse)

mpg <- read_csv('../datasets/mpg/mpg.csv')


set.seed(1234)
mpg_split <- initial_split(mpg)

mpg_train <- training(mpg_split)
mpg_test <- testing(mpg_split)

lm_spec <- linear_reg()

lm_fit <- lm_spec %>%
  fit(mpg ~ weight, data = mpg_train)

lm_fit

glance(lm_fit)
