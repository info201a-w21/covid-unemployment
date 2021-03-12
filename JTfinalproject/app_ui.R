# UI for charts
library(shiny)
library(ggplot2)
library(plotly)

source("app_server.R")


result_type_input <- radioButtons( #check is this is right
  inputId = "result_type", 
  choices = c("cases", "hospilizations", "deaths"),  
  selected = "cases",
  label = "Choose what kind of data to graph"
)

race_input <- checkboxGroupInput(
  inputId = "race",
  choices = c("white", "black", "latinx", "asian"),
  selected = "white", "black", "latinx", "asian",
  label = "Choose a race"
)

time_input <- sliderInput(
  inputId = "x_var",
  label = "Choose the year",
  min = as.Date("2020-04-12","%Y-%m-%d"),
  max = as.Date("2021-02-10","%Y-%m-%d"),
  value = c(as.Date("2020-04-12"), as.Date("2021-02-10"),),
  timeFormat= "%Y-%m-%d",
  label = "Time"
)


page_five <- tabPanel(
  titlePanel("title"), 
  sidebarLayout(
    sidebarPanel(
      h1("Graph heading"),
      result_type_input, 
      race_input, 
      time_input,
    ),
    mainPanel(
      plotlyOutput(outputId = "line"), 
      p("Although at times the rates are nearly the same, minorities still experinces higher rates of cases, hospilaizations, and deaths.
        Just like with unemployment, the minority experinces a higher rates than white people, indicating the poor and unfair conditions
        they experince in US. Althought they make up a small portion of the the country, they ultimately are suffering at higher rates,
        whether through unemployemnt or covid-related health issues. This data helps expose how a lot minority groups live in bad environments
        and are not always receiving the proper treatment, revealing the hidden inqeualities they live in the US.")
    )
  )
)

ui <- navbarPage(
  paste0("application title"), # application title
  page_five
)



