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
    p("Employment rate: https://data.oecd.org/emp/employment-rate.htm"),
    p("COVID racial data tracker: https://covidtracking.com/race"),
    p("Unemployment insurance: https://oui.doleta.gov/unemploy/claims.asp")
    ),
    mainPanel(
      img("covid_unemployment", src = "~/Desktop/INFO 201/Group Project/project-covid-unemployment/finalproject/unemployment_covid.jpg")
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
  "Interactive Viz 2" # label for the tab in the navbar
)
page_four <- tabPanel(
  "Employment Data",
  # Interactive chart
  employment_total <- tabPanel(
    "Total working population employment data",
    titlePanel("Chart that shows total the percentage of total working age (15-64) population"),
    sidebarLayout(
      sidebarPanel(input_country, stamp_time),
      mainPanel(textOutput("new_text"),
                plotlyOutput("new_chart"))
  )
),
  employment_visual <- tabPanel(
    "Change in total working population employment data",
    titlePanel("Chart that shows the change in percentage of total working age (15-64) population"),
    sidebarLayout(
      sidebarPanel(country_input, time_stamp),
      mainPanel(textOutput("display_text"),
                plotlyOutput("bar_chart")),
    )
  ),
 employment_analysis <- tabPanel(
   "Analysis",
   titlePanel("Analysis of the Charts"),
   p("This chart shows the employment trends for all countries from January 2019 to December 2020. The 
         first graph allows the user to see how the total employment population, ages 15-64, changes
         between the years and/or quarters. The dropdown menu allows users to choose the country they desire
         along with the quarter(s). The second chart shows the changes in the total employment population 
         based on quarters, which is every 3 months. Since some quarters had an increase in total employment, 
         while other quarters had a decrease in total employment, this allows the viewer to be able to see
         how darastic the increase or decrease was for the respective quarter(s). The dropdown menus are the 
         same for both charts in case the viewer wants to see how the total employment changed along with how 
         much the total employment changed between quarter(s) and/or year(s). This dataset comes from",
     a("Organisation for Economic Co-operation and Development"),
     herf= "https://data.oecd.org/emp/employment-rate.htm"),
 )
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
  img("unemployment", src = "~/Desktop/INFO 201/Group Project/project-covid-unemployment/finalproject/unemployment.jpg"))

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

# Lynn's input widgets (employment)
# For total working age population
choose_country <- unique(employment_merge$Country)

input_country <- selectInput(
  inputId = "name_of_country",
  label = "Choose a country",
  choices = c(choose_country),
  selected = "Australia")

stamp_time <- checkboxGroupInput(
  inputId = "pick_a_quarter",
  label = "Choose a Quarter",
  choices = c("2019-Q1" = "2019-Q1",
              "2019-Q2" = "2019-Q2",
              "2019-Q3" = "2019-Q3",
              "2019-Q4" = "2019-Q4",
              "2020-Q1" = "2020-Q1",
              "2020-Q2" = "2020-Q2",
              "2020-Q3" = "2020-Q3",
              "2020-Q4" = "2020-Q4"),
  selected = "2019-Q1")

# For change in total working age population 
choose_country <- unique(employment_merge$Country)

country_input <- selectInput(
  inputId = "countryName",
  label = "Choose a country",
  choices = c(choose_country),
  selected = "Australia")

time_stamp <- checkboxGroupInput(
  inputId = "Timeline",
  label = "Choose a Quarter",
  choices = c("2019-Q1" = "2019-Q1",
              "2019-Q2" = "2019-Q2",
              "2019-Q3" = "2019-Q3",
              "2019-Q4" = "2019-Q4",
              "2020-Q1" = "2020-Q1",
              "2020-Q2" = "2020-Q2",
              "2020-Q3" = "2020-Q3",
              "2020-Q4" = "2020-Q4"),
  selected = "2019-Q1")
