library(lintr)
library(ggplot2)
library(tidyverse)
library(styler)

# Which month(s) have the highest death rates?

race <- read_csv("C:/Users/lynnc/Downloads/CRDT Data - CRDT (1).csv")

deaths<- race %>%
  select(Deaths_Total,
         Deaths_White, 
         Deaths_Asian, 
         Deaths_Latinx,
         Deaths_Black, 
         Deaths_Multiracial, 
         Deaths_Other, 
         Deaths_Ethnicity_Hispanic, 
         Deaths_AIAN, 
         Deaths_NHPI,
         Deaths_Other, 
         Deaths_Unknown)

states <- race%>%
  pull(State)

states_death <- merge(states, deaths)
       
       #(Deaths_White, Deaths_Black, Deaths_Latinx, Deaths_Asian)

ggplot(states_death) + 
  geom_bar(mapping = aes(x = race, y = deaths))

