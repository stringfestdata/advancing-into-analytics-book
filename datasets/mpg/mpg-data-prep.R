
library(tidyverse)
library(writexl)


mpg_raw <- read.csv('input/auto-mpg-raw.csv', na='?')

# Drop incomplete cases
mpg <- mpg_raw %>% drop_na()

# Compare data frames
dim(mpg_raw)
dim(mpg)

mpg <- mpg %>% 
  mutate(origin = recode(origin,
                          `1` = 'USA',
                          `2` = 'Europe',
                          `3` = 'Asia'))



# Write data to Excel
write_xlsx(mpg,'mpg.xlsx')

