library(Ecdat)
library(dplyr)
library(writexl)

# Drop ID column
star <- select(star, -id)

write_xlsx(star,'star.xlsx')




