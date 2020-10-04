setwd("C:/Users/GeorgeM/Documents/GitHub/advancing-into-analytics-book/data/")
mpg_raw <- read.csv("auto-mpg-raw.csv",
                    na="?")

# Drop incomplete cases
mpg <- mpg_raw %>% drop_na()

# Compare data frames
dim(mpg_raw)
dim(mpg)

# Add an index column, move to front of data frame
mpg <- mpg %>% mutate(id = row_number()) %>% 
  select(id, everything()) %>% 
  # Recode origin: 1=USA, 2=Europe, 3=Asia
  mutate(origin=recode(origin,
                          `1`="USA",
                          `2`="Europe",
                          `3`="Asia"))


# Write data
write_excel_csv(mpg,"mpg-use.csv")

names(mpg)
# Truncated dataset
mpg %>% select(weight)


