library(lintr)
library(ggplot2)
library(tidyverse)
library(styler)
library(dplyr)
library(tidyr)

# Which month(s) have the highest death rates?

race <- read_csv("C:/Users/lynnc/Downloads/CRDT Data - CRDT (1).csv")

#deaths_data <- 
  #select(race) %>%
  #gather(key = State, value = Deaths_Total)

deaths_data<- race %>% 
    select (State, 
    Deaths_Total,
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
    Deaths_Unknown)%>%
    #gather(key = Deaths_Total, value = State, na.rm = FALSE)
    gather(key = State, value = Deaths_Total)%>%
    mutate(State = State)


View(deaths_data)

ggplot(deaths) + 
  geom_col(
    mapping = aes(x = State, y = Deaths_Total),
    fill = deaths
    )
