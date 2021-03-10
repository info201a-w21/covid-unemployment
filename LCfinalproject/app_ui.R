# source in server
source("app_server.R")

# read in data 
employment_data <- read.csv("data/OECD_newdf.csv")

# Bar chart
choose_country <- unique(employment_merge$Country)

country_input <- selectInput(
  inputId = "countryName",
  label = "Choose a country",
  choices = c(choose_country),
  selected = "Australia"
)

time_stamp <- checkboxGroupInput(
  inputId = "Timeline",
  label = "Choose a Quarter",
  choices = c("2019-Q1" = "2019-Q1",
              "2019-Q2" = "2019-Q2",
              "2019-Q3" = "2019-Q3",
              "2019-Q4" = "2019-Q4",
              "2020-Q1" = "2020_Q1",
              "2020-Q2" = "2020-Q2",
              "2020-Q3" = "2020-Q3",
              "2020-Q4" = "2020-Q4"),
  selected = "2019-Q1"
)

employment_visual <- tabPanel(
  "Employment data",
  titlePanel("Bar chart that shows the percentage of total working age population (15-64)"),

        sidebarLayout(
           sidebarPanel(country_input, time_stamp),
           mainPanel(textOutput("display_text"),
                     plotlyOutput("bar_chart"))
        )
        ) 

ui <- navbarPage(
  "Employment data",
  employment_visual
)


