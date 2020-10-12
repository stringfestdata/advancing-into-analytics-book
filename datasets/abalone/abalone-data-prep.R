library(tidyverse)
library(writexl)


abalone_names <- c("sex", "length", "diameter", "height", "weight.whole",
                    "weight.shucked", "weight.viscera", "weight.shell", "rings")


abalone <- read_csv("http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data", 
                    col_names = abalone_names) %>% 
            mutate(sex=recode(sex,
                              `M`=0,
                              `F`=1,
                              `I`=2))


write_xlsx(abalone,"abalone.xlsx")

