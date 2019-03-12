library(shiny)
library(dplyr)
library(plotly)

master <- read.csv("data/master.csv", stringsAsFactors = F)

colnames(master)[1] <- "country"

# by_generation <- master %>% 
#   group_by(generation) %>%
#   summarize(total_suicides_by_gen = sum(suicides_no))
# 
# by_males <- master %>% 
#   filter(sex == "male") %>% 
#   group_by(generation) %>% 
#   summarize(total_male_suicides = sum(suicides_no))
# 
# by_females <- master %>% 
#   filter(sex == "female") %>% 
#   group_by(generation) %>% 
#   summarize(total_female_suicides = sum(suicides_no))
# 
# by_sex <- left_join(by_males, by_females)
# by_generation_sex <- left_join(by_sex, by_generation)

country_dataset <- master %>% 
  select(country) %>% 
  distinct(country)
country_list <- as.list(country_dataset)

# shinyServer(function(input, output) {
#   country_plot <- reactive ({master %>% 
#     filter(year == input$slider_year, country == input$text) %>% 
#     group_by(generation) %>% 
#     summarize (total_suicides = sum(suicides_no))
#   })
#   
#   output$generation <- renderPlotly({
#     
#     p <- plot_ly(country_plot(), x=~generation, y=~total_suicides,
#             name = "Male Suicides",
#             type = "bar") %>% 
#       layout(title = paste0("Suicides in ", input$text, ", ", 
#                             input$slider_year), 
#              xaxis = list(title = "Generation"),
#              yaxis = list(title = "Total Suicides"))
#     print(p)
#   })
# })

