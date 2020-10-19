library(tidyverse)
library(readxl)


# Data source:
# https://www.census.gov/data/tables/time-series/demo/popest/2010s-state-total.html

census <- read_xlsx("raw-data/census-raw.xlsx", skip=3) %>%
  # Drop unneeded columns
  select(-c("Census","Estimates Base","2016":"2019")) %>% 
  # Drop unneeded rows
  slice(6:56) %>% 
  # Fix name of first column
  rename("state" = "...1") %>% 
  # Remove opening period from state names
  mutate(state=str_remove(state,".")) %>% 
  # Pivot the Year column
  pivot_longer(-state,names_to="year",values_to="population")

# All set with this!
head(census)


# Now let's read in state land area
# Data source:
# https://19january2017snapshot.epa.gov/sites/production/files/2016-11/fy2017_proposed105_allocation_state_land_pop_data.xlsx

state_land <- read_xlsx("raw-data/state-land-raw.xlsx",sheet = "LandArea",skip=2) %>% 
  # Take only the columns we need
  select(c("State/Territory","Sq. Mi....4")) %>% 
  # Rename these columns
  rename("state"="State/Territory","land_area"="Sq. Mi....4")
  
# All set with this
head(state_land)


# Now let's left outer join our census data into our 
# land data

census <- left_join(census,state_land)

head(census)

# Write out our data
write_csv(census,"census.csv")
