library(lintr)
library(tidyverse)
library(styler)
library(dplyr)
library(tidyr)
library(readr)

employment<- read.csv("OECD_Data_EA-19_and_G-7.csv")

View(employment)

# Filter dataset by location, time, and value 

new_employment<- employment %>%
    select(LOCATION, TIME, Value) %>%
    arrange(desc(TIME)) # Orders data from least recent to most recent 

# Lollipop graph that shows how much fluctuation each country goes through from 2019-2021

library(ggplot2)
theme_set(theme_bw())
employment_range <- ggplot(data = new_employment, aes(x = LOCATION, y = Value, label = Value))+
  geom_point(stat = 'identity', fill = "black", size = 5) +
  geom_segment(aes(y=0, 
                   x = '0', 
                   yend = 0,
                   xend = '0'),
               color = "black")+
  geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
  ylim(45.0, 80.0) 