# Load relevent Libraries
library(ggplot2)
library(shiny)
library(dplyr)
library(shinythemes)



############################ Introduction ############################ 
introduction <- tabPanel(
  "Introduction", 
  titlePanel("Introduction"), 
  mainPanel(
    h3("Information about Suicide"), 
    p("According to the WHO, close to 800,000 people die due to 
      suicide each year. Suicide drastically impacts families, communities,
      and the people who also commit suicides. Suicide can occur throughout 
      a lifetime, but mainly impacts 15-29 year olds globally in 2016. 
      As a non discriminatory issue, it impacts both low and high income countries, 
      which is why it is such a huge public health concern.")
    
  )
)




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
      plotlyOutput("plot"),
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

generation <-  tabPanel(
  "Generation",
  titlePanel("Something by generation"),
  # Creating sidebar layout
  sidebarLayout(
    # Sidebar Panel
    sidebarPanel(
      # Input to select variable to map
      selectInput('text', "Select Country", country_list, selectize=TRUE),
      sliderInput("slider_year", label = h3("Select Year"), min = 1985, 
                  max = 2016, value = 2000, sep = "")
    ),
    # Main Panel to Show Scatter Plot
    mainPanel(
      plotlyOutput("generation")
    )
  )
)



############################### Gender ############################### 

# gender <- tabPanel()



############################## About Us ##############################

#about_us <- tabPanel()

############################## Shiny UI ##############################

shinyUI(navbarPage(
  theme = shinytheme("simplex"), 
  "Suicides Around the World",
  introduction, 
  map,
  generation
  # gender, 
  # about_us
))
