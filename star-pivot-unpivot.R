library(tidyverse)
library(readxl)

star <- read_excel('datasets/star/star.xlsx') 
star <- select(star, c('classk', 'schidkn', 'treadssk', 'tmathssk'))

# https://rstudio-conf-2020.github.io/r-for-excel/tidying.html#tidyrpivot_longer-to-reshape-from-wider-to-longer-format

star_long <- pivot_longer(data = star, 
                          cols = 'tmathssk':'treadssk',
             names_to = 'test_type', values_to = 'score')
star_long

# https://stackoverflow.com/questions/38088328/how-to-recode-and-reverse-code-variables-in-columns-with-dplyr
star_long <- star_long %>%
  mutate(test_type = recode(test_type, 
    'tmathssk' = 'math', 'treadssk' = 'reading')) 

star_long

library(dplyr)

# https://github.com/tidyverse/tidyr/issues/599

star_long %>% 
  group_by(schidkn, classk) %>% 
  mutate(row = row_number()) %>%
  pivot_wider(names_from = 'test_type', values_from = 'score') %>% 
  select(-row)

