library(readxl)
library(tidyverse)

colnames(worldCupTable) <- c("Year", "Hosts", NA, "Totalattendance", "Matches", 
                             "Averageattendance")

World_Cup <- worldCupTable %>%
  select(Year, Hosts, Totalattendance, Matches, Averageattendance)

World_Cup$Totalattendance <- as.numeric(str_replace_all(
  World_Cup$Totalattendance, ",", ""))

World_Cup$Averageattendance <- as.numeric(str_replace_all(
  World_Cup$Averageattendance, ",", ""))

World_Cup$Year <- as.factor(World_Cup$Year)

World_Cup$Year <- gsub("\\[.*\\]", "", World_Cup$Year)

usethis::use_data(World_Cup, overwrite = TRUE)



