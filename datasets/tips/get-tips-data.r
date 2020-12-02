

library(tidyverse)
library(writexl)

tips <- read_csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')

write_xlsx(tips, 'tips.xlsx')
