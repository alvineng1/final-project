library(dplyr)
library(leaflet)
library(ggplot2)
library(shiny)
library(tidyr)
library(stringr)

source("./scripts/map_plotly.R")
source("./scripts/scatter-function.R")
source("ui.R")


shinyServer(function(input, output) {
  # map
  output$plot <- renderPlotly({
    return(map_function(
      master_data, input$years
    ))
  })

  # bar plot
  output$generation <- renderPlotly({
    country_year_filter <- master %>%
      filter(year == input$slider_year, country == input$country_text_name)
  # filtering by females
    by_females <- country_year_filter %>%
      filter(sex == "female") %>%
      group_by(generation) %>%
      summarize(total_female_suicides = sum(suicides_no))
  # filtering by males
    by_males <- country_year_filter %>%
      filter(sex == "male") %>%
      group_by(generation) %>%
      summarize(total_male_suicides = sum(suicides_no))
  # joining by both sexes
    by_sex <- reactive({
      left_join(by_males, by_females) %>%
        mutate(total_suicides = (total_male_suicides + total_female_suicides))
    })
  # creating plotly plot
    p <- plot_ly(by_sex(),
      x = ~generation, y = ~total_male_suicides,
      name = "Male Suicides",
      type = "bar"
    ) %>%
      add_trace(y = ~total_female_suicides, name = "Female Suicides") %>%
      layout(
        yaxis = list(title = "Total Suicides"), barmode = "stack",
        xaxis = list(title = "Generation"),
        title = paste0(
          "Suicides in ", input$country_text_name, ", ",
          input$slider_year
        )
      )
    # if statement for gender checkbox
    if (input$gender_checkbox != TRUE) {
      p <- plot_ly(by_sex(),
        x = ~generation, y = ~total_suicides,
        name = "Total Suicides",
        type = "bar"
      ) %>%
        layout(
          title = paste0(
            "Suicides in ", input$country_text_name, ", ",
            input$slider_year
          ),
          xaxis = list(title = "Generation"),
          yaxis = list(title = "Total Suicides")
        )
    }

    print(p)
  })
  # scatter
  output$scatter <- renderPlotly({
    return(scatter_plot(scatter_data, input$country))
  })
  
  #second scatter 
  output$new <- renderPlotly({
    return(new(scatter_data, input$country))
  })
  
})
