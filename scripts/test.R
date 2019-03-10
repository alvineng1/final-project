# Interactive MAP
library(dplyr)
library(leaflet)
library(ggplot2)
library(ggmap)

# load data 

source("api-key.R")

raw_data <- read.csv("data/master.csv", stringsAsFactors = F) %>% 
  mutate(
    lat = 0,
    long = 0
  )

# regster api 

register_google(key = google_api)

# Get addresses using the geocode function 

raw_data[, c("long", "lat")] <- geocode(raw_data$ï..country)

# save raw_data df 

write.csv(raw_data, "master_df_lat_long.csv", row.names = F)

# read in new df 

data <- read.csv("data/master_df_lat_long.csv", stringsAsFactors = F)

# create a map that takes in the raw data and plots suicides 



Interactive_map <- data %>% 
  leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = data$long, lat = data$lat)


what <- data %>% 
  filter(year == 2000) %>% 
  group_by(ï..country) %>% 
  summarise(
    sum_suicide = sum(suicides_no), 
    long = max(long), 
    lat = max(lat)
  )



test <- function(df, year){
  test <- df %>% 
    filter(year == year) %>% 
    group_by(ï..country) %>% 
    summarise(
      suicide_num = sum(suicides_no), 
      long = max(long), 
      lat = max(lat) 
    )
  map <- test %>% 
    leaflet() %>% 
    addTiles() %>% 
    addMarkers(lng = data$long, lat = data$lat, 
               popup = paste0(
                 test$ï..country, "<br>", 
                 year,"<br>", 
                 test$suicide_num, "<br>"
               ), 
               clusterOptions = markerClusterOptions())
  return(map)
} 

info <- sprintf(
  "Country: %s<br/>Number Sucide: %.f people",
  what$ï..country, what$sum_suicide
) %>% lapply(HTML)

bin <- c(1, 10000, 20000)
pal <- colorBin(palette = "YlOrRd", domain = what$sum_suicide, bins = bin)

test_map <- leaflet(data = what) %>%
  addProviderTiles(providers$Stamen.Toner) %>%
  addCircleMarkers(
    lat = ~lat,
    lng = ~long,
    radius = ~ sqrt(sum_suicide) / 10,
    color = ~ pal(sum_suicide),
    stroke = FALSE,
    fillOpacity = 0.6,
    label = info
  ) %>%
  addLegend(
    position = "bottomright", pal = pal,
    values = ~sum_suicide, title = "suicide"
  )
test_map

test(data, 2000)

geocode("singapore")

# 3. Map (Bryce and Alvine)
# >> filter by year 
# >> gradient of map based on suicide rates