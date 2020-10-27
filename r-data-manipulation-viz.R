library(tidyverse)
library(readxl)


star <- read_excel("datasets/star/star.xlsx")
head(star)

# Select given columns from star
select(star, tmathssk,treadssk,schidkn)


star_selected <- select(star, tmathssk,treadssk,schidkn)
head(star_selected)




select(star, -tmathssk, -treadssk, -schidkn)


select(star, -c(tmathssk, treadssk, schidkn))

# Select all columns between tmathssk and totexpk;
# Re-assign results back to star
star <- select(star, tmathssk:totexpk)
head(star)

# Calculate total score, months of experience
mutate(star, score_ttl = tmathssk+treadssk, months_exp = totexpk*12)

# Rename tmathssk and treadssk as 
# math_score and reading_score, respectively 
rename(star, math_score=tmathssk, reading_score=treadssk)

# Sort
arrange(star, classk)



# Read in our data sets
star <- read_excel("star.xlsx")
districts <- read_excel("district-names.xlsx")
head(star)
head(districts)

# Left outer join star on districts
left_join(star, districts)

# Get the average reading score
# by class type, sorted high to low 

star_grouped <- group_by(star,classk)
star_avg_reading <- summarize(star_grouped,avg_reading=mean(treadssk))
star_avg_reading_sorted <- arrange(star_avg_reading,desc(avg_reading))
star_avg_reading_sorted  

# Piping %>% 
# Get the average reading score
# by class type, sorted high to low 

star %>% 
  group_by(classk) %>% 
  summarise(avg_reading = mean(treadssk)) %>% 
  arrange(desc(avg_reading))


# Piping %>% 
# Get the average reading score 
# for students on the free lunch program
# by class type, sorted high to low

star %>% 
  filter(freelunk=='yes') %>% 
  group_by(classk) %>% 
  summarise(avg_reading = mean(treadssk)) %>% 
  arrange(desc(avg_reading))

# Count plot
ggplot(data=star,aes(x=classk))+
  geom_bar()

# Histogram
ggplot(data=star,aes(x=treadssk))+
  geom_histogram()

# Boxplot
ggplot(data=star,aes(x=treadssk))+
  geom_boxplot()

# Grouped boxplot
ggplot(data=star,aes(x=classk,y=treadssk))+
  geom_boxplot()

# Scatterplot
ggplot(data=star,aes(x=tmathssk,y=treadssk))+
  geom_point()

# Scatterplot with custom axis labels and title
ggplot(data=star,aes(x=tmathssk,y=treadssk))+
  geom_point() + 
  xlab('Total math scaled score') + ylab('Total reading scaled score')+
  ggtitle('Relationship between total math and reading scaled scores')
