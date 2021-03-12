library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)
library(tidyverse)

# Tammy's interactive stuff, chart set up:
# unemployment graph by race, total (both female and male)
unemploy <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/unemploy_by_race_bureau.csv", header = T)

# Renaming columns, preparing for chart
unemploy <- rename(unemploy, race = ï..race)
unemploy$year <- sapply(unemploy$year, toString)


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
  
  # Add your server stuff in here
}
