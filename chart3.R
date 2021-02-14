library(lintr)
library(ggplot2)
library(tidyverse)
library(styler)
library(dplyr)
library(tidyr)

unemployed <-Unemployment_insurance

# Filter Unemployment insurance data to only get Non-seasonal adjustment and seasonal adjustment data
NSA_and_SA <- unemployed %>% 
  select(
  X,
  X.1, 
  X.3, 
  X.5, 
  X.7, 
  X.11
  )

# Rename columns in NSA_SA

names(NSA_and_SA)[names(NSA_and_SA) == "X"] <- "Date"
names(NSA_and_SA)[names(NSA_and_SA) == "X.1"] <- "initial_NSA"
names(NSA_and_SA)[names(NSA_and_SA) == "X.3"] <- "initial_SA"
names(NSA_and_SA)[names(NSA_and_SA) == "X.5"] <- "continued_NSA"
names(NSA_and_SA)[names(NSA_and_SA) == "X.7"] <- "continued_SA"
names(NSA_and_SA)[names(NSA_and_SA) == "X.11"] <- "covered_employment"

View(NSA_and_SA)
    

# Graph comparing initial non-seasonal adjusted to continued non-seasonal adjusted 
NSA_initial_to_continued <- ggplot(data = NSA_and_SA)+
  geom_col(mapping = aes(x = initial_NSA, y = continued_NSA)) + 
                          coord_flip()
                        






