#install.packages('DAAG')
library(DAAG)
library(tidyverse)
#install.packages('tidymodels')
library(tidymodels)

head(ais)

# rcc by male versus female
ggplot(data=ais, aes(x=sex, y=rcc))+
  geom_boxplot()


ggplot(data=ais, aes(x=rcc))+
         geom_histogram()+
         facet_grid(~ sex)


t.test(rcc ~ sex, data=ais)
# Yes, there is a significant difference in red blood cell counts

# Correlation 
ais %>% 
  select(-c(sex, sport)) %>% 
  cor()

# Lots of these; you may 
# want to pick just the ones of interest
ais %>% 
  select(-c(sex, sport)) %>% 
  pairs()


# Height and weight scatterplot
ggplot(data = ais, aes(x = ht,y = wt))+
  geom_point()


# Linear regression
ais_reg <- lm(wt ~ ht, data = ais)
summary(ais_reg)

# Yes there is a significant influence. 
# About 61% of the variability in weight is explained by height. 

# Bonus: visualize the regression
ggplot(data = ais, aes(x = ht,y = wt))+
  geom_point()+
  geom_smooth(method = lm)


# Split the data
set.seed(1234)
ais_split <- initial_split(ais)
ais_train <- training(ais_split)
ais_test <- testing(ais_split)


dim(ais_train)
dim(ais_test)
# These samples are skirting the lower side for
# representative samples, proceed with caution

# Specify what kind of model this is
lm_spec <- linear_reg()

# Fit the model to the data 
lm_fit <- lm_spec %>%
  fit(ht ~ wt, data = ais)

ais_pred <- lm_fit %>% 
  predict(new_data = ais_test) %>% 
  bind_cols(ais_test)


# Find r-squared
rsq(data = ais_pred, truth = ht, estimate = .pred)

# Find rmse
rmse(data = ais_pred, truth = ht, estimate = .pred)
