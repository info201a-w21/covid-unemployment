# Load in OECD data
employment_data <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/LCfinalproject/data/OECD_df.csv")

# Rename column and restructure data frame
names(employment_data)[names(employment_data) == "ï..LOCATION"] <- "a3"

employment_merge <- merge(employment_data, iso3166, by = "a3")

names(employment_merge)[names(employment_merge) == "ISOname"] <- "region"
names(employment_merge)[names(employment_merge) == "TIME"] <- "Quarter"

employment_merge <- employment_merge %>%
  mutate(change_in_value= Value - lag(Value, default = 0))%>%
  arrange(Quarter)%>%
  select(a3, Quarter, Value, region, change_in_value)

# Visual interactive chart/map 

  server <- function(input, output){
    
    output$bar_chart <- renderPlotly({
      
      output$display_text <- renderText({
        paste("This chart shows the percentage of total working age population in",
              input$regionName, "that is measured in the choosen quarter(s).")
      })
      
      employment_new <- employment_merge %>%
        arrange(desc(Quarter))%>%
        filter(region %in% input$regionName)%>%
        filter(Quarter %in% input$Timeline)
      
      bar_chart<- ggplot(data = employment_new, 
                         #aes(x = Quarter, y = Value)
      )+
        geom_point(aes(x= Quarter, y = Value), color="orange", size = 2)+
        geom_segment(aes(x = Quarter, xend = Quarter, y=1, yend = Value))
        theme_light()+
        theme(
          panel.grid.major.x = element_blank(),
          panel.border = element_blank(),
          axis.ticks.x = element_blank()
        )+
        labs(title = "Percentage of total working age population (15-64)",
             x = "",
             y = "Change in the percentage of total working population",
             fill = "Percent of Working age Population")
      
      
      ggplotly(bar_chart)
      return(bar_chart)
      
    })
  }