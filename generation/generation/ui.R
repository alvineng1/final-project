library(shiny)


shinyUI(navbarPage(
  "By Generation",
  # Creating tab panel
  tabPanel(
    "Generation",
    titlePanel("Suicides by sex and generation"),
    # Creating sidebar layout
    sidebarLayout(
      # Sidebar Panel
      sidebarPanel(
        # Input to select variable to map
        selectInput('country_text_name', "Select Country", country_list, selectize=TRUE),
        sliderInput("slider_year", label = h3("Select Year"), min = 1985, 
                    max = 2016, value = 2000, sep = ""),
        checkboxInput("gender_checkbox", label = "Show Sex", value = TRUE)
      ),
      # Main Panel to Show Scatter Plot
      mainPanel(
        plotlyOutput("generation")
        )
      )
    )
  )
)


