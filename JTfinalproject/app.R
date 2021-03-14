library("shiny")
library(plotly)
library(tidyverse)

source("app_ui.R")
source("app_server.R")

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)