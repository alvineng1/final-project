library(shiny)
library(dplyr)
library(plotly)

colnames(master)[1] <- "country"

country_dataset <- master %>% 
  select(country) %>% 
  distinct(country)
country_list <- as.list(country_dataset)

shinyServer(function(input, output) {

   
   output$generation <- renderPlotly({
     country_year_filter <- master %>% 
         filter(year == input$slider_year, country == input$country_text_name)
     
     
     by_females <- country_year_filter %>% 
         filter(sex == "female") %>% 
         group_by(generation) %>% 
         summarize(total_female_suicides = sum(suicides_no))
     
     by_males <- country_year_filter %>% 
         filter(sex == "male") %>% 
         group_by(generation) %>% 
         summarize(total_male_suicides = sum(suicides_no))
     
     by_sex <- reactive({left_join(by_males, by_females) %>% 
         mutate(total_suicides = (total_male_suicides + total_female_suicides))})
     
     p <- plot_ly(by_sex(), x=~generation, y=~total_male_suicides,
                  name = "Male Suicides",
                  type = "bar") %>% 
       add_trace(y = ~total_female_suicides, name = 'Female Suicides') %>%
       layout(yaxis = list(title = "Total Suicides"), barmode = 'stack',
              xaxis = list(title = "Generation"),
              title = paste0("Suicides in ", input$country_text_name, ", ", 
                             input$slider_year))
     if (input$gender_checkbox != TRUE) {
       p <- plot_ly(by_sex(), x=~generation, y=~total_suicides,
                    name = "Male Suicides",
                    type = "bar") %>% 
         layout(title = paste0("Suicides in ", input$country_text_name, ", ", 
                               input$slider_year), 
                xaxis = list(title = "Generation"),
                yaxis = list(title = "Total Suicides"))
     }
     
     print(p)
     
   })
 })


