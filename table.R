
library(tidyverse)
library(knitr)

covid_unemployment <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Georgetown-by-race.csv")
View(covid_unemployment)

covid_by_race <- read.csv("CRDT Data - CRDT.csv")
View(covid_by_race)

employment_rate_global <- read.csv("Employment-rate-global.csv")
View(employment_rate_global)



# Covid unemployment --------

# rename some columns
covid_unemployment %>%
  colnames(covid_unemployment) %>%
  colnames(covid_unemployment)[colnames(covid_unemployment) == "Labor.Force.Status"] <- "labor_status"
  colnames(covid_unemployment)[colnames(covid_unemployment) == "Month.of.Month.of.Period"] <- "month"
  colnames(covid_unemployment)[colnames(covid_unemployment) == "Education..3.levels.1"] <- "education_level"
  colnames(covid_unemployment)[colnames(covid_unemployment) == "Sample.size"] <- "sample_size"
 
# Number of loss or gain jobs by race
job_gains_or_loss_by_race <- covid_unemployment %>%
  group_by(Race) %>%
  summarize(total_change = sum(Number))
  


# Covid by race --------

# Cumulative total cases of COVID by racial group in the US
cumulative_cases_by_race <- covid_by_race %>%
  group_by(State) %>%
  arrange(Date) %>%
  summarize(Date = as.Date(as.character(Date), format = "%Y%m%d"),
            White = Cases_White,
            Black = Cases_Black,
            "Hispanic/Latino" = Cases_Latinx,
            Asian = Cases_Asian,
            "American Indian/Alaska Native" = Cases_AIAN,
            "Native Hawaiian/Pacific Islander" = Cases_NHPI,
            Multiracial = Cases_Multiracial,
            Other = Cases_Other,
            Unknown = Cases_Unknown) 

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




