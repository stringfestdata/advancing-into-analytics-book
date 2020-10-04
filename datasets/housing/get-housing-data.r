library(Ecdat)
library(dplyr)
library(writexl)

housing <- Housing %>% 
  # Add an index column
  mutate(id = row_number()) %>% 
  # Put this at the front of the data frame
  select(id, everything())

write_xlsx(housing,"housing.xlsx")
