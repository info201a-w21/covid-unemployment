# source in server
source("app_server.R")

# read in data 
employment_data <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/LCfinalproject/data/OECD_df.csv")

# Bar chart
choose_region <- unique(employment_merge$region)
choose_time <- unique(employment_merge$Quarter)

region_input <- selectInput(
  inputId = "regionName",
  label = "Choose a country",
  choices = c(choose_region),
  selected = "Australia"
)

time_stamp <- checkboxGroupInput(
  inputId = "Timeline",
  label = "Choose a Quarter",
  choices = c(choose_time),
  selected = "2019-Q1"
)

employment_visual <- tabPanel(
  "Employment data",
  titlePanel("Bar chart that shows the percentage of total working age population (15-64)"),

        sidebarLayout(
           sidebarPanel(region_input, time_stamp),
           mainPanel(textOutput("display_text"),
                     plotlyOutput("bar_chart"))
        )
        )

ui <- navbarPage(
  "Employment data",
  employment_visual
)


