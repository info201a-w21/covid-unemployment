library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)

unemployment <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-
                         unemployment/main/Georgetown-by-race.csv")

total_sample_size <- sum(unemployment$Sample.Size)

# modified table for graphing employment by month
new_table <- unemployment %>%
  group_by(Month.of.Month.of.Period) %>%
  filter(ï..Labor.Force.Status == "Employed - at work") %>%
  summarize(num_employed = sum(Sample.Size)) %>%
  arrange(match(Month.of.Month.of.Period, month.name))

# graph of employed numbers by month
employment_by_month <- ggplot(new_table, aes(month.abb[1:11],
                                             num_employed, group = 1)) +
  geom_point(size = 2, color = "#2ec4b6") +
  geom_line(size = 1, color = "#2ec4b6") +
  scale_x_discrete(limits = month.abb[1:11]) +
  scale_y_continuous(limits = c(0, max(new_table$num_employed))) +
  labs(x = "Month",
       y = "Number of Employed Individuals",
       title = "Employment Trends Jan-Nov 2020")