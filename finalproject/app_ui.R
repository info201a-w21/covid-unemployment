library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)


ui <- navbarPage(
  "Final Project",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five
)

page_one <- tabPanel(
  "Introduction", # label for the tab in the navbar
  titlePanel("Welcome!"), # show with a displayed title
)

page_two <- tabPanel(
  "Interactive Viz 1", # label for the tab in the navbar
  titlePanel("Unemployment by Race during Covid"),
  sidebarPanel(
    age_input,
    color_input
  ),
  mainPanel(
    plotlyOutput(outputId = "unemployment"),
    h2("About this chart"),
    p("This chart reveals trends between race groups in the U.S. based on
      unemployment rate during the Covid-19 pandemic, as compared to the
      previous year, 2019. The dropdown menu allows filtering between a
      variety of age groups.", em("Note: (his_lat stands for Hispanic or
      Latino ethnicity, which can be of any race)."), "This dataset comes 
      from the", em("U.S. Bureau Labor of Statistics."))
  )
)

page_three <- tabPanel(
  "Interactive Viz 2", # label for the tab in the navbar
)

page_four <- tabPanel(
  "Interactive Viz 3", # label for the tab in the navbar
)

page_five <- tabPanel(
  "Summary", # label for the tab in the navbar
)

# Tammy's input widgets
# select y variable (age groups)
age_input <- selectInput(
  inputId = "y_var",
  label = "Choose an age group",
  choices = c("total_16_over", "ages_16_to_19",  
              "ages_18_to_19", "ages_20_over", "ages_20_to_24", 
              "ages_25_and_over", "ages_25_to_54", 
              "ages_35_to_44", "ages_45_to_54", "ages_55_and_over",
              "ages_55_to_64", "ages_65_and_over")
)

# select color of unemployment chart
color_input <- selectInput(
  inputId = "color",
  label = "Choose a color palette",
  choices = c("Reds", "Oranges", "Greens", "Blues", "Purples", "Greys")
)