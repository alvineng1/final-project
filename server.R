library(dplyr)
library(leaflet)
library(ggplot2)
library(shiny)

source("./scripts/map_plotly.R")
source("./generation/generation/server.R")
source("ui.R")
# source("./scatter/server.R")


shinyServer(function(input, output) {
  # map 
  output$plot <- renderPlotly({
    return(map_function(
      data, input$years
    ))
  })
  # bar plot 
  country_plot <- reactive ({master %>% 
      filter(year == input$slider_year, country == input$text) %>% 
      group_by(generation) %>% 
      summarize (total_suicides = sum(suicides_no))
  })
  
  output$generation <- renderPlotly({
    
    p <- plot_ly(country_plot(), x=~generation, y=~total_suicides,
                 name = "Male Suicides",
                 type = "bar") %>% 
      layout(title = paste0("Suicides in ", input$text, ", ", 
                            input$slider_year), 
             xaxis = list(title = "Generation"),
             yaxis = list(title = "Total Suicides"))
    print(p)
  })
  # scatter 
  # gdp_data <- reactive({good %>% 
  #     filter(str_detect(country.year, input$country))
  # })
  # output$scatter <- renderPlotly({
  #   p <- plot_ly(gdp_data(), x=~suicide_rate, y=~gdp_per_capita....)
  #   print(p)
  # })
  # 
})



# year_filter <- function(select_year){
#   year_df <- master %>% 
#   filter(year == select_year)
#   return(year_df)
# }
# 
# year_filter(2000)
# 
# test <- function(df, select_year){
#   year_df <- df %>% 
#     filter(year == select_year)
# }
# 
# 
# test(master, 2000)




