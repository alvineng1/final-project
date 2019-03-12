### MAKES NEW DATASET WITH FILTERED COUNTRY CODES AND NAMES


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

write.csv(countries_list, "./data/countries_list.csv", row.names = F)
