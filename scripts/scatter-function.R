library(stringr)
library(dplyr)
library(plotly)

# Load in data as "master"
master <- read.csv("./data/master.csv", stringsAsFactors = F,
                   fileEncoding = "UTF-8-BOM")

# Make dataframe grouped by year, country, g, taking total suicides and population
scatter_data <- master %>%
  group_by(year, country, gdp_per_capita....) %>%
  summarise(total_suicide = sum(suicides_no), total_pop = sum(population))

select_values <- scatter_data$country

scatter_plot <- function(df, country_var) {
  # Calculate suicide rate
  scatter_data <- df %>%
    mutate(suicide_per_100k = (total_suicide / total_pop) * 100000)

  # Filter dataset based on selected country by the user
  filtered_data <- scatter_data %>%
    filter(str_detect(country, country_var))


  # Plotting using Plotly
  p <- plot_ly(data = filtered_data, x = ~suicide_per_100k) %>%
    add_markers(y = ~gdp_per_capita....,
                text = paste0(
                  "Year:", filtered_data$year
                )) %>%
    colorbar(title = "Economics and Suicide Rates") %>%
    layout(xaxis = list(title = "Rate of Suicide (per 100k)"),
           yaxis = list(title = "GDP per Capita"),
           title = paste0("GDP and Suicide Rates in ", country_var))
  return(p)

}

new <- function(df, country_var) {
  # Calculate suicide rate
  scatter_data <- df %>%
    mutate(suicide_per_100k = (total_suicide / total_pop) * 100000)

  # Filter dataset based on selected country by the user
  filtered_data <- scatter_data %>%
    filter(str_detect(country, country_var))


  # Plotting using Plotly
  p <- plot_ly(data = filtered_data, x = ~year) %>%
    add_markers(y = ~suicide_per_100k) %>%
    colorbar(title = "Suicides by year") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Suicides (per 100K)"),
           title = paste0("Suicides per 100K in ", country_var))
  return(p)
}
