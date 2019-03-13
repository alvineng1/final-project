library(shiny)
library(plotly)
library(dplyr)
library(tidyr)
library(stringr)

source("./scatter/scatter-function.R")
source("./scatter/ui.R")



shinyServer(function(input, output)({
 output$scatter <- renderPlotly({
   return(scatter_plot(scatter_data, input$country))
 }) 
})
)


# # Load in data as "master"
# master <- read.csv("data/master.csv", stringsAsFactors = F)
# 
# #Shiny Function
# shinyServer(function(input, output) ({
#   
#   # Make dataframe grouped by country&year, taking total suicides and population
#   suicide_and_pop <- master %>% 
#     group_by(country.year) %>% 
#     summarise(total_suicides = sum(suicides_no), total_pop = sum(population))
#   
#   # Make dataframe getting country&year and gdp per capita
#   gdp_raw <- master %>% 
#     select(country.year, gdp_per_capita....)
#   
#   gdp_shortened <- distinct(gdp_raw)
#   
#   
#   # Combine two dataframes to include countries&years, total suicides, and gdp per capita
#   # join by country.year
#   scatter_data <- left_join(suicide_and_pop, gdp_shortened)
#   
#   # Calculate suicide rate
#   scatter_data <- scatter_data %>%
#     mutate(suicide_per_100k = (total_suicides / total_pop)*100000)
#   gdp_data <- reactive({scatter_data %>% 
#       filter(str_detect(country.year, input$country))
#   })
#   p <- plot_ly(data = scatter_data, x = ~suicide_per_100k) %>%
#     add_markers(y = ~gdp_per_capita...., showlegend = FALSE) %>%
#     add_lines(y = ~fitted(loess(gdp_per_capita.... ~ suicide_per_100k)),
#               name = "Line of Best Fit",
#               showlegend = T) %>%
#     layout(xaxis = list(title = "Rate of Suicice(per 100k)"),
#            yaxis = list(title = "GDP per Capita"))
# 
# })
# )
# 
# 

  

