library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)

unemployment <- read.csv("Georgetown-by-race.csv") #[LC, prof mikes suggestion!]

total_sample_size <- sum(unemployment$Sample.Size)

# change column name from ï..Labor.Force.Status to Labor.Force.Status [LC]
names(unemployment)[names(unemployment) == "ï..Labor.Force.Status"] <- "Labor.Force.Status" 

# modified table for graphing
mod_table <- unemployment %>%
  filter(Labor.Force.Status == "Unemployed") %>% #[LC]
  group_by(Race) %>%
  summarize(num_unemployed = sum(Sample.Size, na.rm = T) / 
              total_sample_size * 100)

# graph comparing unemployment percentages by race
unemployment_by_race <- ggplot(data = mod_table) +
  geom_col(mapping = aes(x = Race, y = num_unemployed, color = Race,
                         fill = Race), show.legend = F) +
  labs(x = "Race",
       y = "Percent Unemployed",
       title = "Comparing Unemployment Percentages by Race in 2020") +
  scale_fill_manual(values = c("#ff9f1c", "#2ec4b6", "#E65F5C", "#f88dad")) +
  scale_color_manual(values = c("#ff9f1c", "#2ec4b6", "#E65F5C", "#f88dad"))


