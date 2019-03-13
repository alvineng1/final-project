source("scatter/scatter-function.R")



page_one <- tabPanel(
  "Scatter Plot",
  titlePanel("Suicide Rates by GDP per Capita"),
  # Creating sidebar layout
  sidebarLayout(
    # Sidebar Panel
    sidebarPanel(
      # Input to select country to map
      selectInput(
        inputId = "country", 
        label = "Select Country", 
        choices = select_values, 
        selected = "China"
      )
    ),
    mainPanel(
      plotlyOutput("scatter")
    )
  )
)

library(shiny)

shinyUI(navbarPage(
  "Economics and Suicide",
  page_one
)
)
# shinyUI(navbarPage(
#   "Economics and Suicide",
#   # Creating tab panel
#   tabPanel(
#     "Scatter Plot",
#     titlePanel("Suicide Rates by GDP per Capita"),
#     # Creating sidebar layout
#     sidebarLayout(
#       # Sidebar Panel
#       sidebarPanel(
#         # Input to select country to map
#         selectInput('country', "Select Country", gdp_data, selectize=TRUE)
#       ),
#         # Input to checkbox for statistics
#         checkboxGroupInput("stats", label = h3("Choose What to Display"),
#                            choices = list("Line of Best Fit" = ""),
#                            selected = "Line of Best Fit"
#       ),
#       
#       mainPanel(
#         plotlyOutput("scatter")
#       )
#     )
#   )
# )
# )

