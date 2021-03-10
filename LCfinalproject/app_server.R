# Load in OECD data
employment_data <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/finalproject/OECD_data/OECD_newdf.csv")

# Rename column and restructure data frame
names(employment_data)[names(employment_data) == "ï..LOCATION"] <- "Alpha_3"

employment_merge <- merge(employment_data, ISO_3166_1, by = "Alpha_3")

names(employment_merge)[names(employment_merge) == "Name"] <- "Country"
names(employment_merge)[names(employment_merge) == "TIME"] <- "Quarter"

employment_new <- employment_merge %>%
  select(Alpha_3, Quarter, Value, Country)%>%
  arrange(employment_merge, Quarter)%>%
  mutate(change_in_value= Value-lag(Value, default = 0))%>%
  filter(Quarter >= 2019)

# Visual interactive chart
  server <- function(input, output){
    
    output$new_chart <- renderPlotly({ 
      
      output$new_text <- renderText({
        paste("This chart shows the total percentage of total working age population in",
              input$name_of_country, "that is measured in the choosen quarter(s).")
      })
      
      
      employment_final <- employment_new %>%
        arrange(desc(Quarter))%>%
        filter(Country %in% input$name_of_country)%>%
        filter(Quarter %in% input$pick_a_quarter)
      
      
      new_chart<- ggplot(data = employment_final, x = Quarter, y = Value,
                         fill = Value)+
        geom_point(aes(x = Quarter, y = Value), 
                   color="blue", size = 2)+
        geom_segment(aes(x = Quarter, xend = Quarter, y=1, yend = Value), 
                     color = "grey")+
        theme_minimal()+
        labs(title = "Total percentage working age population (15-64)",
             x = "Quarter(s)",
             y = "Percent of total working population")
      
      ggplotly(new_chart)
      return(new_chart)
      
    })
  
    output$bar_chart <- renderPlotly({
      
      output$display_text <- renderText({
        paste("This chart shows the change in percentage of total working age population in",
              input$countryName, "that is measured in the choosen quarter(s).")
      })
      
      employment_total <- employment_new %>%
        arrange(desc(Quarter))%>%
        filter(Country %in% input$countryName)%>%
        filter(Quarter %in% input$Timeline)
      
      #need to make a legend 
      bar_chart<- ggplot(data = employment_total, x = Quarter, y = change_in_value,
                         fill = change_in_value)+
        geom_point(aes(x = Quarter, y = change_in_value), 
                   color="orange", size = 2)+
        geom_segment(aes(x = Quarter, xend = Quarter, y=1, yend = change_in_value), 
                     color = "grey")+
        theme_minimal()+
        labs(title = "Changes in total working age population (15-64)",
             x = "Quarter(s)",
             y = "Percent of change in total working population")
      
      ggplotly(bar_chart)
      return(bar_chart)
    })
  }