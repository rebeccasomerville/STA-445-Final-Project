library(readxl)
library(tidyverse)

WorldPopulation <- read_excel('C:/Users/Tammy Somerville/SomervilleWorldPopulation/data-raw/World_Population.xlsx')

WorldPopulation <- WorldPopulation %>%
  filter(Type == "Country/Area") %>%
  select(`Region, subregion, country or area *`, 
         8:ncol(WorldPopulation)) %>%
  rename(CountryName = `Region, subregion, country or area *`)

usethis::use_data(WorldPopulation, overwrite = TRUE)



