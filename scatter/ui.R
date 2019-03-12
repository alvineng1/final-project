
library(shiny)

shinyUI(navbarPage(
  "Economics and Suicide",
  # Creating tab panel
  tabPanel(
    "",
    titlePanel("Suicide Rates by GDP per Capita"),
    # Creating sidebar layout
    sidebarLayout(
      # Sidebar Panel
      sidebarPanel(
        # Input to select country to map
        selectInput('country', "Select Country", country_list, selectize=TRUE)
      ),
        # Input to checkbox for statistics
        checkboxGroupInput("stats", label = h3("Choose What to Display"),
                           choices = list("Line of Best Fit" = "", "P value" = "", "Correlation Coefficient" = ""),
                           selected = "Line of Best Fit"
      ),
      
      mainPanel(
        plotlyOutput("scatter")
      )
    )
  )
)
)

