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


  
  

  
geocode("Ameica")
  
  
  
  
  
# 3. Map (Bryce and Alvine)
# >> filter by year 
# >> gradient of map based on suicide rates
