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
)

page_two <- tabPanel(
  "Interactive Viz 1", # label for the tab in the navbar
)

page_three <- tabPanel(
  "Interactive Viz 2", # label for the tab in the navbar
)

page_four <- tabPanel(
  "Interactive Viz 3", # label for the tab in the navbar
)

page_five <- tabPanel(
  "Summary", # label for the tab in the navbar
)