#Jonathan Jimenez
#Importing and Tidying Data
#09/29/2022

install.packages("tidyverse")
install.packages("here")
install.packages("nycflights13")
install.packages("fivethirtyeight")

library(dplyr)
library(ggplot2)
library(readr)
library(tidyr)
library(here)
library(nycflights13)
library(fivethirtyeight)

#Importing Data

library(readr)
dem_score <- read_csv(here("activity_data","dem_score.csv"))
dem_score

#Wrangling Data

#Example 
drinks

#Pipe Oporator
#x %>% 
'f() %>% 
  g() %>% 
  h()

You would read this sequence as:
  
  Take x then
Use this output as the input to the next function f() then
Use this output as the input to the next function g() then
Use this output as the input to the next function h()'

#Filtering Rows
drinks %>%   
filter(country %in% c("USA", "China", "Italy", "Saudi Arabia"))

drinks %>%
filter(country == "USA")

#Selecting Varables
drinks %>%   
select(-total_litres_of_pure_alcohol)

drinks %>% 
select(country, beer_servings, spirit_servings, wine_servings)

#Rename
drinks %>%   
rename(beer = beer_servings, spirit = spirit_servings, wine = wine_servings)

#Bringing the Wrangling Together
drinks_smaller <- drinks %>%
filter(country %in% c("USA", "China", "Italy", "Saudi Arabia")) %>%
select(-total_litres_of_pure_alcohol) %>%  
rename(beer = beer_servings, spirit = spirit_servings, wine = wine_servings)
drinks_smaller

#Tidying Data
drinks_smaller
drinks_smaller_tidy <- drinks_smaller %>%  
 pivot_longer(names_to = "type", values_to = "servings", cols = -country)
drinks_smaller_tidy

drinks_smaller %>%   
  pivot_longer(names_to = "type",               
               values_to = "servings",                
               cols = c(beer, spirit, wine))

#Case Study
guat_dem <- dem_score %>%   
  filter(country == "Guatemala")SS
guat_dem

#Tidying the Case Study
guat_dem_tidy <- guat_dem %>%   
  pivot_longer(names_to = "year",values_to = "democracy_score", cols = -country, names_transform = list(year = as.integer))
guat_dem_tidy

#GGPLOT
ggplot(guat_dem_tidy, aes(x = year, y = democracy_score)) +  geom_line() +  labs(x = "Year", y = "Democracy Score")


















