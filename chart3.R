library(lintr)
library(ggplot2)
library(tidyverse)
library(styler)
library(dplyr)
library(tidyr)
library(readr)

unemployment<- read_csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/OECD_Data_EA-19_and_G-7.csv")

View(unemployment)

# Filter dataset

new_unemployment<- unemployment %>%
    select(LOCATION, TIME, Value) %>%
    arrange(unemployment, TIME, Value)

  ggplot(new_unemployment, aes(x = LOCATION, y = Value))+
    geom_bar(stat = 'identity')
             
  