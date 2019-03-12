library(countrycode) # convert country names into codes
library(tidyr)


# Making a map function, dataframe and year variable as parameters
map_function <- function(df, year_var){
  # Read dataset that has country data
  # From https://github.com/datasets/country-codes/blob/master/data/country-codes.csv
  countries_full <-  read.csv(
    "data/countries.csv", na.strings = c("", "NA"), stringsAsFactors = F
  )
  
  # Add country code to country dataset
  countries_full$code <- countrycode(
    countries_full$official_name_en, 'country.name', 'iso3c'
  )
  
  # rename columns of country dataset (more user-friendly)
  countries_list_raw <- countries_full %>%
    select(code, official_name_en)
  colnames(countries_list_raw)[2] <- "countries"
  
  #remove blank rows of insignificant countries
  countries_list <- drop_na(countries_list_raw)
  
  # make a dataset grouped by country and summing up suicides
  test <- df %>% 
    filter(year == year_var) %>% 
    group_by(ï..country) %>% 
    summarise(
      sum_suicide = sum(suicides_no)
    )
  test$code <- countrycode(test$ï..country, 'country.name', 'iso3c')
  
  # join two datasets for combined data and all countries
  full_test <- countries_list %>%
    full_join(test) %>%
    select(code, countries, sum_suicide)
  
  
  # replace NA values with "data unavailable"
  full_test$sum_suicide[is.na(full_test$sum_suicide)] <- 0
  
  
  l <- list(color = toRGB("grey"), width = 0.5)
  
  # specify map projection/options
  g <- list(
    showframe = FALSE,
    showcoastlines = FALSE,
    projection = list(type = 'Mercator')
  )
  
  # Making the plotly map
  p <- plot_geo(full_test) %>%
    add_trace(
      z = ~sum_suicide,
      color = ~sum_suicide,
      colors = 'Blues',
      text = paste0(
        "Country: ", full_test$countries,
        "\nNumber of Suicides: ", full_test$sum_suicide, " people"
      ),
      locations = ~code,
      marker = list(line = l)
    ) %>%
    colorbar(title = "Number of Suicides") %>%
    layout(
      title = paste0("Suicides in each country in year ", year_var),
      geo = g
    )
  return(p)
}

map_function(data, 2000)
