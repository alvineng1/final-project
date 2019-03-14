library(dplyr)
library(leaflet)
library(ggplot2)
library(shiny)
library(tidyr)
library(stringr)

master <- read.csv("./data/master.csv", stringsAsFactors = F,
                   fileEncoding = "UTF-8-BOM")

country_dataset <- master %>%
  select(country) %>%
  distinct(country)

country_list <- as.list(country_dataset)