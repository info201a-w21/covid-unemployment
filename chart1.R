library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)

unemployment <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-
                         unemployment/main/Georgetown-by-race.csv")

total_sample_size <- sum(unemployment$Sample.Size)


# modified table for graphing
mod_table <- unemployment %>%
  filter(ï..Labor.Force.Status == "Unemployed") %>%
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


