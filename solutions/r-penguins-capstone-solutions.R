library(tidyverse)
library(readxl)

penguins <- read_xlsx("penguins.xlsx")


# flipper length by male versus female
ggplot(data = penguins, aes(x = sex, y = flipper_length_mm))+
  geom_boxplot()


ggplot(data = penguins, aes(x = flipper_length_mm))+
  geom_histogram()+
  facet_grid(~ sex)


t.test(flipper_length_mm ~ sex, data = penguins)
# Yes, there is a significant difference in flipper lengths


# Correlation 
penguins %>% select(-c(species, island, sex, year)) %>% cor()

# Height and weight scatterplot
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point()


# Linear regression
penguins_reg <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(penguins_reg)

# Yes there is a significant influence. 
# About 76% of the variability in body mass is explained by flipper length. 

# Bonus: visualize the regression
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm")
