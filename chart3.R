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

#NSA_total <- NSA_and_SA%>%arrange(min(Date))%>%pull(Date) 


# Rename columns in NSA_SA

names(NSA_and_SA)[names(NSA_and_SA) == "X"] <- "Date"
names(NSA_and_SA)[names(NSA_and_SA) == "X.1"] <- "initial_NSA"
names(NSA_and_SA)[names(NSA_and_SA) == "X.3"] <- "initial_SA"
names(NSA_and_SA)[names(NSA_and_SA) == "X.5"] <- "continued_NSA"
names(NSA_and_SA)[names(NSA_and_SA) == "X.7"] <- "continued_SA"
names(NSA_and_SA)[names(NSA_and_SA) == "X.11"] <- "covered_employment"

View(NSA_and_SA)

# Extract population from the specific columns
NSA_ipopulation <- NSA_and_SA[, "initial_NSA"]
NSA_cpopulation <- NSA_and_SA[, "continued_NSA"]

SA_ipopulation <- NSA_and_SA[, "initial_SA"]
SA_cpopulation <- NSA_and_SA[, "continued_SA"]

NSA_and_SA[order(as.Date(NSA_and_SA$Date, format = "%Y/%m/%d")),]

# Graph shows the date and how many initial non-seasonal adjustments were made on that day 
NSA_initial<- ggplot(NSA_and_SA)+
    geom_col(mapping = aes(x = Date, y = initial_NSA, fill = NSA_ipopulation)) +
          theme(legend.position = "right")+
          coord_flip()
          
# Graph shows the date and how many continued non-seasonal adjustments were made on that day
NSA_continued<- ggplot(data = NSA_and_SA)+
  geom_col(mapping = aes(x=Date, y=continued_NSA, fill = NSA_cpopulation)) +
          theme(legend.position = "right")+
          coord_flip()

# Graph shows the date and how many initial seasonal adjustments were made on that day
SA_initial <- ggplot(data = NSA_and_SA)+
  geom_col(mapping = aes(x = Date, y = initial_SA, fill = SA_ipopulation)) + 
          theme(legend.position = "right")+
          coord_flip()

# Graph shows the date and how many continued seasonal adjustmets were made on that day
SA_continued <- ggplot(data = NSA_and_SA)+
  geom_col(mapping = aes(x = Date, y = continued_SA, fill = SA_cpopulation)) + 
          theme(legend.position = "right")+
          coord_flip()
    



    