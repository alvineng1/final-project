#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(navbarPage(
  "ASDKFJALSKDJFLKSDJFLKSDJF",
  # Creating tab panel
  tabPanel(
    "ASDFKJ",
    titlePanel("Something by generation"),
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
)
)

