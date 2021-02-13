library(lintr)
library(ggplot2)
library(tidyverse)
library(styler)
library(dplyr)
library(tidyr)

unemployed <-Unemployment_insurance

# Filter Unemployment insurance data to only get Non-seasonal adjustment and seasonal adjustment data
NSA_and_SA<-Unemployment_insurance%>% 
  select(
  X,
  X.1, 
  X.3, 
  X.5, 
  X.7, 
  X.11
  )

View(NSA_and_SA)


ggplot(NSA_and_SA)
