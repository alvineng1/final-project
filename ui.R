# Load relevent Libraries
library(ggplot2)
library(shiny)
library(dplyr)
library(shinythemes)



############################ Introduction ############################ 
introduction <- tabPanel(
  "Introduction", 
  mainPanel(
    tags$h4(strong("Information about Suicide"), class = "header"), 
    tags$p("According to the WHO, close to 800,000 people die due to 
      suicide each year. Suicide drastically impacts families, communities,
      and the people who also commit suicides. Suicide can occur throughout 
      a lifetime, but mainly impacts 15-29 year olds globally in 2016. 
      As a non discriminatory issue, it impacts both low and high income countries, 
      which is why it is such a huge public health concern.", class = "para1"),
    tags$h4(strong("Information about the Dataset"), class = "header"), 
    tags$p("The information was collected by russellyates88, 
            and sourced by the World Bank. The dataset is hosted on Kaggle. The 
            data set is targeted towards indivals who have an interest in global
            and mental health. This data set can help provide numerical evidence to 
            support research on mental health.", class = "para2"), 
    tags$h4(strong("Questions that can be asked"), class = "header"), 
    tags$p("The data set is 30,000 rows long and summarizes information by 
            country, year, age group, generation, and GDP.", class = "para2"), 
      tags$ol(class = "para2", 
              tags$li("Which countries experience the highest rates of suicide?"), 
              tags$li("How do economic and development indicators link to suicide rates?"), 
              tags$li("What are the sex differences when it comes to suicide rates?"), 
              tags$li("How has suicide rates increased or decreased per generation? 
                      If there is a trend, which countries does this trend exist for?"), 
              tags$li("Which years were suicide rates most prevalent?")),
    tags$h4(strong("Structure")), 
    tags$p("The first tab of this report shows has a choropleth map of the number of suicides
           in each country. Users can change the year input to see how suicides vary in each 
           country from 1985 to 2016. 
           The second page shows a generational bar plot of suicides per country and per year. 
           Users can select the country and the year and see how many suicides occured per in each
           generation. The third plot is a scatter plot **********"),
    tags$h4(strong("Creators")), 
      tags$ol(
        tags$li("Bryce Fukada"), 
        tags$li("Alvine Ngouonga"), 
        tags$li("Steven Hsieh"), 
        tags$li("Macey Schallert")
      )
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
        value = 1998
      )
      
    ),
    mainPanel(
      tags$h3(strong("Map of Suicides: 1985-2016"), align = "center"), 
      plotlyOutput("plot"),
      tags$tav, 
      tags$p("This map shows the amount of suicides from different countries around
              the world from 1985 to 2016. The countries that are more pigmented are those
              with the highst rates of suicide."), 
      tags$p(strong("To use this map:"), "use the slider to select the year that you are 
              interested in and the map will adjust the suicide rates according to the year chosen.
              Please keep in mind that this map was created using a data set that did not include the
              suicide rates for each country in the world for each year."), 
      tags$h5(strong(em("Possible Questions:"))), 
        tags$ol(
          tags$li("There are some countries that seem to have zero rates of suicide. 
                  Why do you think that is?"), 
          tags$li("Why do some countries have higher reported rates of suicides than others?"), 
          tags$li("Are there social or economic factors that might cause suicides to be more common 
                  in some countries and not in others?")
        )
      )
  )
)




############################# Generation ############################# 

generation <-  tabPanel(
  "Generation",
  titlePanel("Generation Plot"),
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

scatter <- tabPanel(
  "Economics",
  titlePanel("Scatter plot generation"),
  # Creating sidebar layout
  sidebarLayout(
    # Sidebar Panel
    sidebarPanel(
      # Input to select country to map
      selectInput('country', "Select Country", country_list, selectize=TRUE)
    ),
    mainPanel(
      plotlyOutput("scatter")
    )
  )
)




############################## About Us ##############################

#about_us <- tabPanel()

############################## Shiny UI ##############################

shinyUI(navbarPage(
  # includeCSS("style.css"),
  theme = shinytheme("yeti"), 
  "Suicides Around the World",
  introduction, 
  map,
  generation,
  scatter
  # about_us
))


