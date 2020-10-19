library(tidyverse)
library(writexl)
library(palmerpenguins)


penguins_cleaned <- penguins %>% drop_na()

write_xlsx(penguins_cleaned, "penguins.xlsx")
