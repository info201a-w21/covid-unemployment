library(tidyverse)
library(stringr)
library(ggplot2)
library(openintro)

covid_data <- read.csv("covid_race.csv")

covid_data <- as.Date(covid_data$Date, format = "%Y%m%d")

mod_covid_data <- covid_data %>% 
  group_by(Date) %>% 
  summarise(national_cases_white = sum(Cases_White, na.rm = T),
            national_cases_black = sum(Cases_Black, na.rm = T),
            national_cases_latinx = sum(Cases_Latinx, na.rm = T),
            national_cases_asian = sum(Cases_Asian, na.rm = T),
            national_deaths_white = sum(Deaths_White, na.rm = T),
            national_deaths_black = sum(Deaths_Black, na.rm = T),
            national_deaths_latinx = sum(Deaths_Latinx, na.rm = T),
            national_deaths_asian = sum(Deaths_Asian, na.rm = T),
            national_hosp_white = sum(Hosp_White, na.rm = T),
            national_hosp_black = sum(Hosp_Black, na.rm = T),
            national_hosp_latinx = sum(Hosp_Latinx, na.rm = T),
            national_hosp_asian = sum(Hosp_Asian, na.rm = T)) %>% 
  mutate(new_white_cases = national_cases_white - lag(national_cases_white, n = 1),
         new_black_cases = national_cases_black - lag(national_cases_black, n = 1),
         new_latinx_cases = national_cases_latinx - lag(national_cases_latinx, n = 1),
         new_asian_cases = national_cases_asian - lag(national_cases_asian, n = 1),
         new_white_deaths = national_deaths_white - lag(national_deaths_white, n = 1),
         new_black_deaths = national_deaths_black - lag(national_deaths_black, n = 1),
         new_latinx_deaths = national_deaths_latinx - lag(national_deaths_latinx, n = 1),
         new_asian_deaths = national_deaths_asian - lag(national_deaths_asian, n = 1),
         new_white_hosp = national_hosp_white - lag(national_hosp_white, n = 1),
         new_black_hosp = national_hosp_black - lag(national_hosp_black, n = 1),
         new_latinx_hosp = national_hosp_latinx - lag(national_hosp_latinx, n = 1),
         new_asian_hosp = national_hosp_asian - lag(national_hosp_asian, n = 1)) %>%
  
  mutate(percent_change_white_cases = new_white_cases / lag(national_cases_white, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_black_cases = new_white_cases / lag(national_cases_black, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_latinx_cases = new_white_cases / lag(national_cases_latinx, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_asian_cases = new_white_cases / lag(national_cases_asian, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_white_deaths = new_white_deaths / lag(national_deaths_white, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_black_deaths = new_black_deaths / lag(national_deaths_black, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_latinx_deaths = new_latinx_deaths / lag(national_deaths_latinx, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_asian_deaths = new_asian_deaths / lag(national_deaths_asian, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_white_hospilizations = new_white_hosp / lag(national_hosp_white, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_black_hospilizations = new_black_hosp / lag(national_hosp_black, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_latinx_hospilizations = new_latinx_hosp / lag(national_hosp_latinx, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_asian_hospilizations = new_asian_hosp / lag(national_hosp_asian, n = 1, default = 0) * 100) %>% 
  
  mutate_all(funs(ifelse(is.na(.), 0, .))) %>% 
  #lnf into value of 0
  select(Date, percent_change_white_cases, percent_change_black_cases, percent_change_latinx_cases, percent_change_asian_cases, 
         percent_change_white_deaths, percent_change_black_deaths, percent_change_latinx_deaths, percent_change_asian_deaths,
         percent_change_white_hospilizations, percent_change_black_hospilizations, percent_change_latinx_hospilizations, percent_change_asian_hospilizations) %>% 
  pivot_longer(cols = c("percent_change_white_cases", "percent_change_black_cases", "percent_change_latinx_cases", "percent_change_asian_cases",
                        "percent_change_white_deaths", "percent_change_black_deaths", "percent_change_latinx_deaths", "percent_change_asian_deaths",
                        "percent_change_white_hospilizations", "percent_change_black_hospilizations", "percent_change_latinx_hospilizations", 
                        "percent_change_asian_hospilizations"),
               names_to = "result_types", 
               values_to = "percent_change") 

  mutate(mod_covid_data, Date = as.Date(mod_covid_data$Date, format = "%Y%m%d"))
 
# how to pivot this so i can change both the result type and y variable
# how to convert data column into an actual date rather than a number

server <- function(input, output) {
  output$line <-renderPlotly({
    chart <- ggplot(mod_covid_data %in% 
                filter(result_types %in% input$result_type) %in% #should i use the contains method instead of this
                  filter(result_types %in% input$race) %in%      #not sure if this format works to properly filter the data
                    filter(Date >= input$x_var[1], Date <= input$x_var[2])) +
      geom_line(aes(x = Date, y = percent_change, color = race)) +
      labs(title = "Covid Racial Health Rate Impact", x = "Time (Date)", y = "Percent Change", 
           color = "Race")
    
    ggplotly(chart)
  })
}


  
  
  
  
  
  
  
