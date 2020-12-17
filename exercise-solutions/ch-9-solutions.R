#install.packages('DAAG')
library(DAAG)
library(tidyverse)


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
  select(-c(sex,sport)) %>% 
  cor()

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
