# Load libraries
library("shiny")
library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
library(plotly)
library(ISOcodes)
library(readr)

# Source in `app_ui.R` and `app_server.R`
source("app_ui.R")
source("app_server.R")


# Run the application 
shinyApp(ui = ui, server = server)
