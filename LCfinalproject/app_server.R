# Load in OECD data
employment_data <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/LCfinalproject/data/OECD_df.csv")

# Load maps data 
library(maps)
map_data <- map_data("world")

# Rename column and restructure data frame
names(employment_data)[names(employment_data) == "ï..LOCATION"] <- "a3"

employment_merge <- merge(employment_data, iso3166, by = "a3")

names(employment_merge)[names(employment_merge) == "ISOname"] <- "region"

employment_merge <- employment_merge %>%
  mutate(change_in_value= Value - lag(Value, default = 0))%>%
  select(a3, TIME, Value, region, change_in_value)

# Visual interactive chart/map 

  server <- function(input, output){
    
    output$bar_chart <- renderPlotly({
      
      output$display_text <- renderText({
        paste("This chart shows the percentage of total working age population in",
              input$regionName, "that is measured in the choosen quarter(s).")
      })
      
      employment_new <- employment_merge %>%
        group_by(TIME)%>%
        filter(region %in% input$regionName)%>%
        filter(TIME %in% input$Timeline)
      
      bar_chart<- ggplot(data = employment_new, 
             mapping = aes(x = TIME, y = Value, fill = change_in_value)
      )+
        geom_bar(position = "dodge", stat = "identity")+
        theme_light()+
        labs(title = "Percentage of total working age population (15-64)",
             x = "Quarter",
             y = "Change in the percentage of total working population",
             fill = "Percent of Working age Population")
      
      
      ggplotly(bar_chart)
      return(bar_chart)
      
    })
  }