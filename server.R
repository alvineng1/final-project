master <- read.csv("data/master.csv", stringsAsFactors = F)
library(dplyr)

year_filter <- function(select_year){
  year_df <- master %>% 
  filter(year == select_year)
  return(year_df)
}

year_filter(2000)

test <- function(df, select_year){
  year_df <- df %>% 
    filter(year == select_year)
}


test(master, 2000)
