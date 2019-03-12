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
    mainPanel(
      h3(strong("Map of Suicides: 1985-2016"), align = "center"), 
      leafletOutput("plot", height = "500px"),
      p(" "), 
      p("This map shows the amount of suicides from different countries around 
        the world from 1985 to 2016. The area of the circles represent the 
        relative amount of suicides in that country compared to other countries 
        that year."), 
      p(strong("To use this map:"), "use the slider to select the year that you are 
        interested in. Keep in mind that this data set did not have data for some countries
        and for certain years.")
      )
  )
)




############################# Generation ############################# 

#generation <- tabPanel()



############################### Gender ############################### 

# gender <- tabPanel(
#  "Map of Gender",
#  titlePanel("Gender Plot"),
#  sidebarLayout(
#    sidebarPanel(
#      selectInput("country", label = h3("Select a Country"),
#                  choices = list("choice 1" = "Albania" ),
#                  selected = "Albania"),
#      hr(),
#      fluidRow(column(3, verbatimTextOutput("country")))
      
#    )
#  )
#)



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
