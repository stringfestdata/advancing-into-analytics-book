library(tidyverse)
library(readxl)


star <- read_excel("datasets/star/star.xlsx")
head(star)

# Select given columns from star
select(star, tmathssk, treadssk, schidkn)


select(star, -tmathssk, -treadssk, -schidkn)


select(star, -c(tmathssk, treadssk, schidkn))

# Select all columns between tmathssk and totexpk;
# Re-assign results back to star
star <- select(star, tmathssk:totexpk)
head(star)

# Calculate total score
star <- mutate(star, new_column = tmathssk + treadssk)
head(star)

# Rename
star <- rename(star, ttl_score = new_column)
head(star)

# Sort
arrange(star, classk, treadssk)

arrange(star, desc(classk), treadssk)


# Filter
filter(star, classk == 'small.class')

filter(star, treadssk >= 500)

filter(star, classk == 'small.class' & treadssk >= 500)


# Group by 
star_grouped <- group_by(star, classk)
head(star_grouped)

# Average math score by class size
summarize(star_grouped, avg_math = mean(tmathssk))



# Read in our data sets
star <- read_excel('datasets/star/star.xlsx')
head(star)

districts <- read_csv('datasets/star/districts.csv')
head(districts)

# Left outer join star on districts
left_join(select(star, schidkn, tmathssk, treadssk), districts)



star_grouped <- group_by(star, classk)
star_avg_reading <- summarize(star_grouped, avg_reading = mean(treadssk))
star_avg_reading_sorted <- arrange(star_avg_reading, desc(avg_reading))
star_avg_reading_sorted  

# Piping %>% 
# Get the average reading score
# by class type, sorted high to low 

star %>% 
  group_by(classk) %>%
  summarise(avg_reading = mean(treadssk)) %>% 
  arrange(desc(avg_reading))

# Average math and reading score
# for each school district
star %>% 
  group_by(schidkn) %>% 
  summarise(avg_read = mean(treadssk), avg_math = mean(tmathssk)) %>% 
  arrange(schidkn) %>% 
  head()


# Set up 
star_pivot <- star %>% 
                select(c(schidkn, treadssk, tmathssk)) %>% 
                mutate(id = row_number())



star_long <- star_pivot %>% 
                pivot_longer(cols = c(tmathssk, treadssk),
                             values_to = 'score', names_to = 'test_type')

head(star_long)


# Rename tmathssk and treadssk as math and reading
star_long <- star_long %>%
  mutate(test_type = recode(test_type, 
                            'tmathssk' = 'math', 'treadssk' = 'reading')) 

distinct(star_long, test_type)

star_wide <- star_long %>% 
                pivot_wider(values_from = 'score', names_from = 'test_type') 
head(star_wide)

# Count plot
ggplot(data = star,
       aes(x = classk))+
  geom_bar()

# Histogram
ggplot(data = star,aes(x = treadssk))+
  geom_histogram()



ggplot(data = star, aes(x = treadssk))+
  geom_histogram(bins = 25, fill = 'blue')


# Boxplot
ggplot(data = star,aes(x = treadssk))+
  geom_boxplot()


# "Flipped" boxplot
ggplot(data = star, aes(y = treadssk))+
  geom_boxplot()



# Grouped boxplot
ggplot(data = star, aes(x = classk,y = treadssk))+
  geom_boxplot()

# Scatterplot
ggplot(data=star,aes(x = tmathssk,y = treadssk))+
  geom_point()

# Scatterplot with custom axis labels and title
ggplot(data = star, aes(x = tmathssk, y = treadssk))+
  geom_point() + 
  xlab('Math score') + ylab('Reading score')+
  ggtitle('Math score versus reading score')



