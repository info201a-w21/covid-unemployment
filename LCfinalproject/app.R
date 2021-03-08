# Load libraries
library("shiny")

# Source in `app_ui.R` and `app_server.R`
source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = ui, server = server)
