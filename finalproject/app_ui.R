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
    p("2. Which month(s) have the highest death rates?"),
    p("3. When was unemployment at its highest during the pandemic?"),
    h3("Data we are using to answer these questions:"),
    p("COVID 19 unemployment: https://cew.georgetown.edu/cew-reports/jobtracker/"),
    p("Employment rate: https://data.oecd.org/emp/employment-rate.htm"),
    p("COVID racial data tracker: https://covidtracking.com/race"),
    p("Unemployment insurance: https://oui.doleta.gov/unemploy/claims.asp")
    ),
    mainPanel(
      h1("COVID and Unemployment",
      img("",
      src = "https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/finalproject/unemployment.jpg", width = "900", height = "600")
      )
    )
  )
)

page_two <- tabPanel(
  "Unemployment by Race", # label for the tab in the navbar
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
  "COVID Among Races",  # label for the tab in the navbar
  titlePanel("Racial Covid-Related Health Rates"), 
  sidebarLayout(
    sidebarPanel(
      result_type_input, 
      time_input,
    ),
    mainPanel(
      plotlyOutput(outputId = "line"), 
      h2("About this chart"),
      p("Although at times the rates are nearly the same, minorities still 
      experinces higher rates of cases, hospilaizations, and deaths.
        Just like with unemployment, the minority community have higher rates 
        of covid cases, hospitalizations, and deaths, than white people, 
        indicating the poor and unfair conditions minority groups experince in 
        US. Althought they make up a small portion of the the country, they 
        ultimately are suffering at higher rates, whether through unemployemnt 
        or covid-related health issues. This data helps expose how a lot 
        minority groups live in bad environments and are not always receiving 
        the proper treatment, revealing the hidden inqeualities inside the 
        United States.")
    )
  )
)


page_four <- tabPanel(
  "Employment Data", # label for the tab in the navbar
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
   p("This chart shows the employment trends for all countries from January 2019
   to December 2020. The first graph allows the user to see how the total 
   employment population, ages 15-64, changes between the years and/or quarters.
   The dropdown menu allows users to choose the country they desire along with 
   the quarter(s). The second chart shows the changes in the total employment 
   population based on quarters, which is every 3 months. Since some quarters 
   had an increase in total employment, while other quarters had a decrease in 
   total employment, this allows the viewer to be able to see how darastic the 
   increase or decrease was for the respective quarter(s). The dropdown menus 
   are the same for both charts in case the viewer wants to see how the total 
   employment changed along with how much the total employment changed between 
   quarter(s) and/or year(s). Some general patterns in the dataset are that in 
   Quarter 2020-Q2, most countries have the biggest decrease in employment, 
   that is, the greatest unemployment for that quarter, which makes sense 
     because 2020-Q2 is when COVID hit. This data set comes from",
     a("Organisation for Economic Co-operation and Development"),
     herf= "https://data.oecd.org/emp/employment-rate.htm"),
 )
)

page_five <- tabPanel(
  "Summary", # label for the tab in the navbar
  sidebarLayout(
    sidebarPanel(
      h1("3 major takeaways"),
      p("1. According to the insights gathered from the visualizations, Blacks 
      and Latinx continue to have the highest unemployment rates from ages 18
      and up until ages 45-54, where it was about even with Asians. Then Blacks
      continued to take the lead in the highest unemployment rate for ages 65 
      and up. This wasn't too shocking, given that people of color in this 
        country often suffer the most."),
      p("2. We learned that the highest covid cases in US was from April to May, 
      and it was highest among people who were Asian. The highest hospitalizations 
      was in November, with Asians, Latinx, and Blacks taking the lead. The 
      highest deaths occurred in April among the Latinx population. These 
        findings weren't surprising and it matches with our findings from the 
        first visualization where people of color were the most impacted."),
      p("3. We learned that decrease in employment in most countries occurred
        during Quarter 2 of 2020, which began around April, which correlates
        with the rest of our insights which concluded that the biggest impact of 
        COVID cases and unemployment on minorities began around April.")
    ),
    mainPanel(
      h1("Unemployment During the Pandemic Affects Minorities Disproportionately",
         img("",
             src = "https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/finalproject/minority_unemployment.jpeg", width = "900", height = "600")
      )
    )
  )
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

# Lynn's input widgets (employment)
# For total working age population
choose_country <- unique(employment_new$Country)

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
choose_country <- unique(employment_new$Country)

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


#Jonathan's input widgets (covid-related)
result_type_input <- radioButtons( #check is this is right
  inputId = "result_type", 
  choices = c("Cases", "Hospilizations", "Deaths"),  
  selected = "Cases",
  label = "Choose what kind of data to graph",
  choiceNames = NULL,
  choiceValues = NULL
)

time_input <- sliderInput(
  inputId = "x_var",
  label = "Choose the year",
  min = as.Date("2020-04-12","%Y-%m-%d"),
  max = as.Date("2021-02-10","%Y-%m-%d"),
  value = c(as.Date("2020-04-12"), as.Date("2021-02-10")),
  timeFormat= "%Y-%m-%d"
)




