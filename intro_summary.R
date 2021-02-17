library(stringr)
library(tidyverse)
install.packages("openintro")
library(openintro)
covid_data <- read.csv("./covid_race.csv", row.names = NULL)

covid_data <- covid_data %>% 
  mutate(Date = as.Date(as.character(Date), format = "%Y%m%d"))

summary_info <- list()


#--------------------------------------------------------------------------------------------------
# Calculate which state has the highest amount of deaths
summary_info$state_with_the_most_deaths <- covid_data %>% 
  filter(Date == max(Date)) %>% 
  filter(Deaths_Total == max(Deaths_Total, na.rm = T)) %>% 
  pull((State)) 
  
summary_info$state_with_the_most_cases <- abbr2state(summary_info$state_with_the_most_cases)
#--------------------------------------------------------------------------------------------------
#which state has the most black deaths
summary_info$state_with_the_most_black_deaths <- covid_data %>% 
  filter(Date == max(Date)) %>%
  filter(Deaths_Black == max(Deaths_Black, na.rm = T)) %>% 
  pull(State)

summary_info$state_with_the_most_black_deaths <- abbr2state(summary_info$state_with_the_most_black_deaths)

#--------------------------------------------------------------------------------------------------  
# determine the average daily death count of minorities
summary_info$minority_average_death_count <- covid_data %>%
  # create new column that tallies up all minority deaths total on that day in each state
  mutate(minority_deaths = Deaths_Black + Deaths_Latinx + Deaths_Asian + 
                           Deaths_AIAN + Deaths_NHPI + Deaths_Multiracial +
                           Deaths_Other + Deaths_Other + Deaths_Ethnicity_Hispanic +
                           Deaths_Ethnicity_NonHispanic + Deaths_Ethnicity_Unknown) %>% 
  group_by(Date) %>% 
  arrange(Date) %>% 
  summarise(national_minority_deaths = sum(minority_deaths, na.rm = T)) %>% 
  mutate(new_deaths = national_minority_deaths - lag(national_minority_deaths, n = 1, default = 0), 
         days_diff = Date - lag(Date, n = 1), average_deaths = new_deaths / as.numeric(days_diff)) %>% 
  select(average_deaths) %>% 
  summarize(mean_of_deaths = mean(average_deaths, na.rm = T)) %>% 
  pull()

#--------------------------------------------------------------------------------------------------  
# determine the average daily death count of african american
summary_info$african_average_death_count <- covid_data %>%
  group_by(Date) %>% 
  arrange(Date) %>% 
  summarise(national_black_deaths = sum(Deaths_Black, na.rm = T)) %>%
  mutate(new_deaths = national_black_deaths - lag(national_black_deaths, n = 1, default = 0), 
         days_diff = Date - lag(Date, n = 1), average_black_deaths = new_deaths / as.numeric(days_diff)) %>%  
  select(average_black_deaths) %>% 
  summarise(mean_of_black_deaths = mean(average_black_deaths, na.rm = T)) %>% 
  pull()

#--------------------------------------------------------------------------------------------------  
# Calculate percentage what percentage of Covid deaths are of minorities
total_minority_deaths <- covid_data %>% 
  filter(Date == max(Date)) %>% 
  mutate(minority_deaths = Deaths_Black + Deaths_Latinx + Deaths_Asian +
         Deaths_AIAN + Deaths_NHPI + Deaths_Multiracial +
         Deaths_Other + Deaths_Other + Deaths_Ethnicity_Hispanic +
         Deaths_Ethnicity_NonHispanic + Deaths_Ethnicity_Unknown) %>% 
  summarize(national_minority_deaths = sum(minority_deaths, na.rm = T)) %>%  
  pull()

total_deaths <- covid_data %>% 
  filter(Date == max(Date)) %>% 
  summarize(national_deaths = sum(Deaths_Total, na.rm = T)) %>% 
  pull(national_deaths)

summary_info$percentage_of_minority_deaths <- (total_minority_deaths / total_deaths) * 100

#--------------------------------------------------------------------------------------------------
# Calculate what percentage of minority deaths are of African Americans
total_black_deaths <- covid_data %>% 
  filter(Date == max(Date)) %>% 
  summarize(national_black_deaths = sum(Deaths_Black, na.rm = T)) %>% 
  pull()

summary_info$percentage_of_black_deaths <- (total_black_deaths / total_minority_deaths) * 100

  