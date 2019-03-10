library(dplyr)

source("./scripts/map_alvine.R")
source("ui.R")

shinyServer(function(input, output) {
  output$plot <- renderLeaflet({
    return(map_function(
      data, input$years
    ))
  })
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
