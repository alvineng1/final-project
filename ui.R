# Load relevent Libraries
library(ggplot2)
library(shiny)
library(dplyr)
library(shinythemes)



############################ Introduction ############################ 
#introduction <- tabPanel()




################################ MAP ################################# 

map <- tabPanel(
  "Map of Suicide",
  titlePanel("Suicides by Year"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "years",
        label = "Between two years:",
        min = 1985,
        max = 2016,
        value = 1985
      )
    ),
    mainPanel(leafletOutput("plot", height = "500px"))
  )
)




############################# Generation ############################# 

#generation <- tabPanel()



############################### Gender ############################### 

#gender <- tabPanel()



############################## About Us ##############################

#about_us <- tabPanel()

############################## Shiny UI ##############################

shinyUI(navbarPage(
  theme = shinytheme("simplex"), 
  "Suicides Around the World",
  # introduction, 
  map 
  # generation,
  # gender, 
  # about_us
))
