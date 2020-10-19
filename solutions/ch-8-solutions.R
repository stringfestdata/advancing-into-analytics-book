library(tidyverse)
library(readxl)
library(writexl)

census <- read_csv('../datasets/census/census.csv')
glimpse(census)


divisions <- read_csv('../datasets/census/census-divisions.csv')
glimpse(divisions)

# Merge the datasets first

census <- left_join(census, divisions)
head(census)

# Sort the data by region ascending, division ascending and population descending. 
# (You will need to combine datasets to do this.) 
# Write the results to an Excel worksheet.

census %>% 
  arrange(region, division, desc(population)) %>% 
  write_xlsx("../datasets/census/solutions-data/census-sorted.xlsx")


# Drop the postal_code field from your merged dataset.

census <- select(census, -postal_code)
head(census)

# Create a new column _density_ which is a calculation
# of population divided by land area. 

census <- mutate(census, density = population/land_area)
head(census)

# Visualize the relationship between land area and population 
# for all observations in 2015.

census_2015 <- filter(census, year == 2015)

ggplot(data = census_2015, aes(x = land_area, y = population))+
  geom_point()


# NOTE: It's possible to use `ggplot()` in the pipe...

census %>% 
  filter(year == 2015) %>% 
  ggplot(aes(x = land_area, y = population)) + geom_point()


# Check out our large land areas...
census_2015 %>% arrange(desc(land_area))


# Find the total population for each region in 2015.  
census_2015 %>% 
  group_by(region) %>% 
  summarise(ttl_population = sum(population))
