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




