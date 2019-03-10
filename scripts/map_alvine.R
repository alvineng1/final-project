# Interactive MAP
library(dplyr)
library(leaflet)
library(ggplot2)
library(ggmap)

################# prepwork for getting the geocodes ###################


# load data 

# source("api-key.R")
# 
# raw_data <- read.csv("data/master.csv", stringsAsFactors = F) %>% 
#   mutate(
#     lat = 0,
#     long = 0
#   )
# 
# # regster api 
# 
# register_google(key = google_api)
# 
# # Get addresses using the geocode function 
# 
# raw_data[, c("long", "lat")] <- geocode(raw_data$ï..country)
# 
# # save raw_data df 
# 
# write.csv(raw_data, "master_df_lat_long.csv", row.names = F)

##################### end of prepwork ###############################


# read in new df 

data <- read.csv("data/master_df_lat_long.csv", stringsAsFactors = F)

# create a map that takes in the raw data and plots suicides using a function 

map_function <- function(df, year_var){
  test <- df %>% 
    filter(year == year_var) %>% 
    group_by(ï..country) %>% 
    summarise(
      sum_suicide = sum(suicides_no), 
      long = max(long), 
      lat = max(lat)
    )
  info <- sprintf(
    "Country: %s<br/>Number Sucide: %.f people",
    test$ï..country, test$sum_suicide
  ) %>% lapply(HTML)
  
  bin <- c(1, 100, 1000, 10000, 100000)
  pal <- colorBin(palette = "YlOrRd", domain = test$sum_suicide, bins = bin)
  
  test_map <- leaflet(data = test) %>%
    addProviderTiles(providers$Stamen.TonerLite) %>%
    addCircleMarkers(
      lat = ~lat,
      lng = ~long,
      radius = ~ sqrt(sum_suicide) / 15,
      color = ~ pal(sum_suicide),
      stroke = FALSE,
      fillOpacity = 0.6,
      label = info
    ) %>%
    addLegend(
      position = "bottomright", pal = pal,
      values = ~sum_suicide, title = "Suicide"
    )
  return(test_map)
}
  


# info <- sprintf(
#   "Country: %s<br/>Number Sucide: %.f people",
#   what$ï..country, what$sum_suicide
# ) %>% lapply(HTML)
# 
# bin <- c(1, 10000, 20000)
# pal <- colorBin(palette = "YlOrRd", domain = what$sum_suicide, bins = bin)
# 
# 
# 
# test_map <- leaflet(data = what) %>%
#   addProviderTiles(providers$Stamen.Toner) %>%
#   addCircleMarkers(
#     lat = ~lat,
#     lng = ~long,
#     radius = ~ sqrt(sum_suicide) / 10,
#     color = ~ pal(sum_suicide),
#     stroke = FALSE,
#     fillOpacity = 0.6,
#     label = info
#   ) %>%
#   addLegend(
#     position = "bottomright", pal = pal,
#     values = ~sum_suicide, title = "suicide"
#   )