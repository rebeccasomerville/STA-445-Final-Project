
CountryPopulation <- function(InputCountryName) {
  
  if(WorldPopulation %>% 
     filter(CountryName != InputCountryName)){
    return("ERROR: Country not found in dataset.")
  }
  
  else{
    
    CountryData <- WorldPopulation %>% 
    filter(CountryName == InputCountryName)
  
  CountryData <- CountryData %>%
    pivot_longer(
      cols = -CountryName,  
      names_to = "Year",
      values_to = "Population")
  
  CountryData$Year <- as.numeric(CountryData$Year)
  CountryData$Population <- as.numeric(CountryData$Population)
  
  OutputPlot <- ggplot(CountryData, aes(x = Year, y = Population)) +
    geom_line()+ 
    labs(title = paste(InputCountryName, "Population"),
         x = "Year", 
         y = "Total Population")
  
  return(OutputPlot)
  }
}
