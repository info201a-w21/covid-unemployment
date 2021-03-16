library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)
library(tidyverse)


# Tammy's interactive stuff, chart set up:
# unemployment graph by race, total (both female and male)
unemploy <- read.csv("unemploy_by_race_bureau.csv", header = T)

# Renaming columns, preparing for chart
unemploy$year <- sapply(unemploy$year, toString)

# Lynn's interactive stuff, chart setup and manipulation
# Load in OECD data
employment_data <- read.csv("OECD_newdf.csv")

# Rename column and restructure data frame
names(employment_data)[names(employment_data) == "LOCATION"] <- "Alpha_3"

employment_merge <- merge(employment_data, ISO_3166_1, by = "Alpha_3")

names(employment_merge)[names(employment_merge) == "Name"] <- "Country"

names(employment_merge)[names(employment_merge) == "TIME"] <- "Quarter"

employment_new <- employment_merge %>%
  select(Alpha_3, Quarter, Value, Country)%>%
  arrange(employment_merge, Quarter)%>%
  mutate(change_in_value= Value-lag(Value, default = 0))%>%
  filter(Quarter >= 2019)

#Jonathan's chart data
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
  # Tammy's interactive chart (1), do not change
  output$unemployment <- renderPlotly({
    unemployment_chart <- ggplot(data = unemploy) +
      geom_bar(mapping = aes_string(x = "race", y = input$y_var, fill = "year"),
               position = "dodge", stat = "identity") +
      scale_fill_brewer(palette = input$color) +
      theme_minimal() +
      labs(x = "Race", y = "Unemployment Rates") +
      if (input$y_var == "total_16_over") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 16 and over"
        )
      } else if (input$y_var == "ages_16_to_19") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 16 to 19"
        )
      } else if (input$y_var == "ages_18_to_19") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 18 to 19"
        )
      } else if (input$y_var == "ages_20_over") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 20 and over"
        )
      } else if (input$y_var == "ages_20_to_24") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 20 to 24"
        )
      } else if (input$y_var == "ages_25_and_over") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 25 and over"
        )
      } else if (input$y_var == "ages_25_to_54") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 25 to 54"
        )
      } else if (input$y_var == "ages_35_to_44") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 35 to 44"
        )
      } else if (input$y_var == "ages_45_to_54") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 45 to 54"
        )
      } else if (input$y_var == "ages_55_and_over") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 55 and over"
        )
      } else if (input$y_var == "ages_55_to_64") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 55 to 64"
        )
      } else if (input$y_var == "ages_65_and_over") {
        labs(
          title = "Comparing Unemployment Rates across Races for ages 65 and over"
        )
      }
    ggplotly(unemployment_chart)
  })

# Lynn's visual interactive chart
    output$new_chart <- renderPlotly({
      output$new_text <- renderText({
        paste("This chart shows the total percentage of total working age population in",
              input$name_of_country, "that is measured in the choosen quarter(s).")
      })
      employment_final <- employment_new %>%
        arrange(desc(Quarter))%>%
        filter(Country %in% input$name_of_country)%>%
        filter(Quarter %in% input$pick_a_quarter)
      new_chart<- ggplot(data = employment_final, x = Quarter, y = Value,
                         fill = Value)+
        geom_point(aes(x = Quarter, y = Value), 
                   color="blue", size = 2)+
        geom_segment(aes(x = Quarter, xend = Quarter, y=1, yend = Value), 
                     color = "grey")+
        theme_minimal()+
        labs(title = "Total percentage of the working age (15-64) population",
             x = "Quarter(s)",
             y = "Percent of total working population")
      ggplotly(new_chart)
      return(new_chart)
    })
    output$bar_chart <- renderPlotly({
      output$display_text <- renderText({
        paste("This chart shows the change in percentage of total working age population in",
              input$countryName, "that is measured in the choosen quarter(s).")
      })
      employment_total <- employment_new %>%
        arrange(desc(Quarter))%>%
        filter(Country %in% input$countryName)%>%
        filter(Quarter %in% input$Timeline)
      
      bar_chart<- ggplot(data = employment_total, x = Quarter, y = change_in_value,
                         fill = change_in_value)+
        geom_point(aes(x = Quarter, y = change_in_value), 
                   color="orange", size = 2)+
        geom_segment(aes(x = Quarter, xend = Quarter, y=1, yend = change_in_value), 
                     color = "grey")+
        theme_minimal()+
        labs(title = "Change in total working age (15-64) population",
             x = "Quarter(s)",
             y = "Percent of change in total working population")
      ggplotly(bar_chart)
      return(bar_chart)
    })
    
# Jonathan's visual interactive chart
    output$line <- renderPlotly({
      dataset <- updated_covid_data %>% 
        filter(str_detect(result_types,input$result_type)) %>% 
        filter(Date >= input$x_var[1], Date <= input$x_var[2])
      chart <- ggplot(dataset) +
        geom_line(aes(x = Date, y = percent_change, color = result_types)) +
        labs(title = paste0("Covid ", input$result_type, " Rates For Different Races"), x = "Time (Date)", y = "Percent Change", 
             color = "Type of Informations")
      
      ggplotly(chart)
    })
  }
