library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)
library(tidyverse)

# Tammy's interactive stuff, chart set up:
# unemployment graph by race, total (both female and male)
unemploy <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/finalproject/unemploy_by_race_bureau.csv", header = T)

# Renaming columns, preparing for chart
unemploy <- rename(unemploy, race = ï..race)
unemploy$year <- sapply(unemploy$year, toString)

# Lynn's interactive stuff, chart setup and manipulation
# Load in OECD data
employment_data <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/finalproject/OECD_data/OECD_newdf.csv")

# Rename column and restructure data frame
names(employment_data)[names(employment_data) == "ï..LOCATION"] <- "Alpha_3"

employment_merge <- merge(employment_data, ISO_3166_1, by = "Alpha_3")

names(employment_merge)[names(employment_merge) == "Name"] <- "Country"

names(employment_merge)[names(employment_merge) == "TIME"] <- "Quarter"

employment_new <- employment_merge %>%
  select(Alpha_3, Quarter, Value, Country)%>%
  arrange(employment_merge, Quarter)%>%
  mutate(change_in_value= Value-lag(Value, default = 0))%>%
  filter(Quarter >= 2019)

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
      #need to make a legend 
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
    #Add your server stuff here 
  }
