#install.packages('DAAG')
library(DAAG)
library(tidyverse)
#install.packages('tidymodels')
library(tidymodels)

head(ais)

# 1. Visualize rcc by sex
ggplot(data = ais, aes(x = sex, y = rcc))+
  geom_boxplot()


ggplot(data = ais, aes(x = rcc))+
         geom_histogram()+
         facet_wrap(~ sex)

# 2. Significant difference in red blood cell count?
t.test(rcc ~ sex, data=ais)
# Yes, there is a significant difference in red blood cell counts

# 3. Correlation matrix of relevant variables: 
ais %>% 
  select(-c(sex, sport)) %>% 
  cor()

# Lots of these to plot; you may 
# want to pick just the ones of interest
ais %>% 
  select(-c(sex, sport)) %>% 
  pairs()


# 4. Visualize relationship of height on weight: 
ggplot(data = ais, aes(x = wt, y = ht))+
  geom_point()


# 5. Linear regression of height on weight: 
ais_reg <- lm(ht ~ wt, data = ais)
summary(ais_reg)

# Yes there is a significant influence. 
# height = 139.16 + .55 * weight
# About 61% of the variability in height is explained by weight. 

# Bonus: visualize the regression
ggplot(data = ais, aes(x = wt, y = ht))+
  geom_point()+
  geom_smooth(method = lm)


# 5. Split the dataset and validat model
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
  fit(ht ~ wt, data = ais_train)

ais_pred <- lm_fit %>% 
  predict(new_data = ais_test) %>% 
  bind_cols(ais_test)


# Find r-squared
rsq(data = ais_pred, truth = ht, estimate = .pred)

# Find rmse
rmse(data = ais_pred, truth = ht, estimate = .pred)

