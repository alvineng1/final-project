library(shiny)
library(plotly)
library(dplyr)
library(tidyr)
library(stringr)

shinyServer(function(input, output) ({
  gdp_data <- reactive({good %>% 
      filter(str_detect(country.year, input$country))
  })
  output$scatter <- renderPlotly({
    p <- plot_ly(gdp_data(), x=~suicide_rate, y=~gdp_per_capita....) %>% 
    add_lines(y = fitted(loess(suicide_rate ~ gdp_per_capita....)),
              name = "Line of Best Fit") %>% 
      add_ribbons(ymin = ~.fitted - 1.96 *.se.fit,
                  ymax = ~.fitted + 1.96 * .se.fit,
                  name = "Standard Error") %>% 
      layout(xaxis = list(title = "Rate of Suicice(per 100k)"),
             yaxis = list(title = "GDP per Capita")) %>% 
    print(p)
  })
})
)

scatter <- master %>% 
  group_by(year) %>% 
  select(country, year, suicides_no, gdp_per_capita....)

gdp_plot <- plot_ly(data = master, x = ~suicides_no, y= ~gdp_per_capita....)

scatter <- master %>% 
  group_by(country.year) %>% 
  summarise(total_suicides = sum(suicides_no), total_pop = sum(population))

test1 <- master %>% 
  select(country.year, gdp_per_capita....)

test2 <- distinct(test1)

test3 <- left_join(scatter, test2)
  
good <- test3 %>% 
  mutate(suicide_rate = (total_suicides / total_pop)*100000)

plot_ly(data = test4, x=~suicide_rate, y=~gdp_per_capita....)

asdf <- test4 %>% 
  filter(str_detect(country.year, ""))

country_dataset <- master %>% 
  select(country) %>% 
  distinct(country)
  
country_list <- as.list(country_dataset)
