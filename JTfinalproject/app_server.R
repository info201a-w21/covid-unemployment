library(tidyverse)
library(stringr)
library(ggplot2)
library(openintro)

covid_data <- read.csv("covid_race.csv")


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
  
  mutate(percent_change_white_Cases = new_white_cases / lag(national_cases_white, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_black_Cases = new_white_cases / lag(national_cases_black, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_latinx_Cases = new_white_cases / lag(national_cases_latinx, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_asian_Cases = new_white_cases / lag(national_cases_asian, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_white_Deaths = new_white_deaths / lag(national_deaths_white, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_black_Deaths = new_black_deaths / lag(national_deaths_black, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_latinx_Deaths = new_latinx_deaths / lag(national_deaths_latinx, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_asian_Deaths = new_asian_deaths / lag(national_deaths_asian, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_white_Hospilizations = new_white_hosp / lag(national_hosp_white, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_black_Hospilizations = new_black_hosp / lag(national_hosp_black, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_latinx_Hospilizations = new_latinx_hosp / lag(national_hosp_latinx, n = 1, default = 0) * 100) %>% 
  mutate(percent_change_asian_Hospilizations = new_asian_hosp / lag(national_hosp_asian, n = 1, default = 0) * 100) %>% 
  
  mutate_all(funs(ifelse(is.na(.), 0, .))) %>% 
  mutate(Date = as.character(Date)) %>% 
  mutate(Date = as.Date(Date, format = "%Y%m%d"))

  mod_covid_data[sapply(mod_covid_data, Negate(is.finite))] <- 0 


  updated_covid_data <- select(mod_covid_data, Date, percent_change_white_Cases, percent_change_black_Cases, percent_change_latinx_Cases, percent_change_asian_Cases, 
         percent_change_white_Deaths, percent_change_black_Deaths, percent_change_latinx_Deaths, percent_change_asian_Deaths,
         percent_change_white_Hospilizations, percent_change_black_Hospilizations, percent_change_latinx_Hospilizations, percent_change_asian_Hospilizations) %>% 
  pivot_longer(cols = c("percent_change_white_Cases", "percent_change_black_Cases", "percent_change_latinx_Cases", "percent_change_asian_Cases",
                        "percent_change_white_Deaths", "percent_change_black_Deaths", "percent_change_latinx_Deaths", "percent_change_asian_Deaths",
                        "percent_change_white_Hospilizations", "percent_change_black_Hospilizations", "percent_change_latinx_Hospilizations", 
                        "percent_change_asian_Hospilizations"),
               names_to = "result_types", 
               values_to = "percent_change") 
  

server <- function(input, output) {
  output$line <- renderPlotly({
    dataset <- updated_covid_data %>% 
      filter(str_detect(result_types,input$result_type)) %>% 
      #filter(str_detect(result_types, input$race)) %>% 
      filter(Date >= input$x_var[1], Date <= input$x_var[2])
    chart <- ggplot(dataset) +
      geom_line(aes(x = Date, y = percent_change, color = result_types)) +
      labs(title = paste0("Covid ", input$result_type, " Rates For Different Races"), x = "Time (Date)", y = "Percent Change", 
           color = "Type of Informations")

    ggplotly(chart)
  })
}







  
  
  
  
  
  
  
