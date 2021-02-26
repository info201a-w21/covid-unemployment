library(tidyverse)
unemploy <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/unemploy_by_race_bureau.csv", header = T)
# unemploy <- unemploy[-c(1,2,3),]
# 
unemploy <- rename(unemploy, race = ï..race)

