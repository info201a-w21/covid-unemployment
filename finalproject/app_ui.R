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
  sidebarLayout(
    sidebarPanel(
      p("For this project, we wanted to explore unemployment during the Covid 19
        pandemic because we want to find out how the pandemic has contributed 
        to unemployment and if there are certain groups of people who are more 
        affected than others during the pandemic."),
    h3("Questions we you hope to answer:"),
    p("1. Which race/groups of people are most unemployed during the pandemic?"),
    p("When was unemployment at its highest during the pandemic?"),
    p("Which month(s) have the highest death rates?"),
    h3("Data we are using to answer these questions:"),
    p("COVID 19 unemployment: https://cew.georgetown.edu/cew-reports/jobtracker/"),
    p("Unemployment rate: https://data.oecd.org/emp/employment-rate.htm"),
    p("COVID racial data tracker: https://covidtracking.com/race"),
    p("Unemployment insurance: https://oui.doleta.gov/unemploy/claims.asp")
    ),
    mainPanel(
      img("covid_unemployment", src = "unemployment_covid.jpg")
      )
  )
)


page_two <- tabPanel(
  "Interactive Viz 1", # label for the tab in the navbar
  titlePanel("Unemployment by Race during Covid"),
    sidebarLayout(
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
)

page_three <- tabPanel(
  "Interactive Viz 2", # label for the tab in the navbar
)

page_four <- tabPanel(
  "Interactive Viz 3", # label for the tab in the navbar
)

page_five <- tabPanel(
  "Summary", # label for the tab in the navbar
  sidebarLayout(
    sidebarPanel(
      h2("3 major takeaways"),
      p("1. lorem ipsum"),
      p("2. lorem ipsum"),
      p("3. lorem ipsum")
    ),
    mainPanel()
  )
)

mainPanel(
  img("unemployment", src = "unemployment.jpg"))

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