library(dplyr)
library(leaflet)
library(ggplot2)
library(shiny)
library(tidyr)
library(stringr)

# reading in csv file
master <- read.csv("./data/master.csv", stringsAsFactors = F,
                   fileEncoding = "UTF-8-BOM")

# creating country_list through country_dataset for the selectize options
country_dataset <- master %>%
  select(country) %>%
  distinct(country)

country_list <- as.list(country_dataset)