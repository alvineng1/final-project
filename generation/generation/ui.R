library(shiny)


shinyUI(navbarPage(
  "By Generation",
  # Creating tab panel
  tabPanel(
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
  )
)


