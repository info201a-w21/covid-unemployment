
library(tidyverse)
library(knitr)
library(dplyr)

covid_unemployment <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Georgetown-by-race1.csv")
View(covid_unemployment)

covid_by_race <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/CRDT%20Data%20-%20CRDT.csv")
View(covid_by_race)

employment_rate_global <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Employment-rate-global.csv")
View(employment_rate_global)



# Covid unemployment --------

# rename some columns
  colnames(covid_unemployment)[colnames(covid_unemployment) == "Labor.Force.Status."] <- "labor_status"
  colnames(covid_unemployment)[colnames(covid_unemployment) == "Month.of.Month.of.Period"] <- "month"
  colnames(covid_unemployment)[colnames(covid_unemployment) == "Education..3.levels.1"] <- "education_level"
  colnames(covid_unemployment)[colnames(covid_unemployment) == "Sample.Size"] <- "sample_size"
  View(covid_unemployment)
 
# Number of loss or gain jobs by race
job_gains_or_loss_by_race <- covid_unemployment %>%
  group_by(Race, month) %>%
  filter(month != "February", month != "April", month != "May", 
         month != "June", month != "July", month != "August", 
         month != "September", month != "October") %>%
  summarize(total_change = sum(Number)) # Biggest impact on White community
  
# White with covid out of total white pop
white_covid_ratio <- 33146501 / 234370202 # 14% of white pop lost jobs

# African-Americans with covid out of total Africa-American pop
Black_covid_ratio <- 9971075 / 44100000 # 22.6% of black pop lost jobs

# Hispanics with covid out of total Hispanics pop
Hispanics_covid_ratio <- 12195967 / 60600000 # 20% of hispanic pop lost jobs




# Covid by race --------

# Cumulative total cases of COVID by racial group in the US
cumulative_cases_by_race <- covid_by_race %>%
  group_by(State) %>%
  filter(Date == max(Date)) %>%
  arrange(Date) %>%
  summarize(Date = as.Date(as.character(Date), format = "%Y%m%d"),
            White = sum(Cases_White),
            Black = sum(Cases_Black),
            "Hispanic/Latino" = sum(Cases_Latinx),
            Asian = sum(Cases_Asian),
            "American Indian/Alaska Native" = sum(Cases_AIAN),
            "Native Hawaiian/Pacific Islander" = sum(Cases_NHPI),
            Multiracial = sum(Cases_Multiracial),
            Other = sum(Cases_Other),
            Unknown = sum(Cases_Unknown)) 

# Rate of increase of new COVID cases by racial group in the US 
rate_increase_in_cases_by_race <- covid_by_race %>%
  group_by(State) %>%
  arrange(Date) %>%
  summarize(Date = as.Date(as.character(Date), format = "%Y%m%d"),
            White = ((as.numeric(Cases_White) - as.numeric(lag(Cases_White))) / as.numeric(lag(Cases_White))) * 100,
            Black = ((as.numeric(Cases_Black) - as.numeric(lag(Cases_Black))) / as.numeric(lag(Cases_Black))) * 100,
            "Hispanic/Latino" = ((as.numeric(Cases_Latinx) - as.numeric(lag(Cases_Latinx))) / as.numeric(lag(Cases_Latinx))) * 100,
            Asian = ((as.numeric(Cases_Asian) - as.numeric(lag(Cases_Asian))) / as.numeric(lag(Cases_Asian))) * 100,
            "American Indian/Alaska Native" = ((as.numeric(Cases_AIAN) - as.numeric(lag(Cases_AIAN))) / as.numeric(lag(Cases_AIAN))) * 100,
            "Native Hawaiian/Pacific Islander" = ((as.numeric(Cases_NHPI) - as.numeric(lag(Cases_NHPI))) / as.numeric(lag(Cases_NHPI))) * 100,
            Multiracial = ((as.numeric(Cases_Multiracial) - as.numeric(lag(Cases_Multiracial))) / as.numeric(lag(Cases_Multiracial))) * 100,
            Other = ((as.numeric(Cases_Other) - as.numeric(lag(Cases_Other))) / as.numeric(lag(Cases_Other))) * 100,
            Unknown = ((as.numeric(Cases_Unknown) - as.numeric(lag(Cases_Unknown))) / as.numeric(lag(Cases_Unknown))) * 100) %>%
  mutate_if(is.numeric, round, digits = 1) 

view(rate_increase_in_cases_by_race)



