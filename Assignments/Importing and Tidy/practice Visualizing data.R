#Jonathan Jimenez
#10/8/2022
#practice visualizing your own data

install.packages("tidyverse")
install.packages("here")
install.packages("nycflights13")
install.packages("fivethirtyeight")
install.packages("tidyverse")

library(tidyverse)
library(tidyverse)
library(here)
library(dplyr)
library(ggplot2)
library(readr)
library(tidyr)
library(here)
library(nycflights13)
library(fivethirtyeight)

#importing
library(readr)
game <- read_csv(here("Assignments","Visualization Data","imdb_video_game_rating.csv"))
game

#Filtter
game$year = as.numeric(as.character(game$year))
game_fil <- game %>%
  select(-genre)%>%
select(-directors)%>%
  select(-plot)%>%
  select(-votes)

game_fil

#Tidying Data
tidy_game <- game_fil %>%
  pivot_longer(names_to = "Year", values_to = "Rating", cols = -title, names_transform = list(year = as.numeric))
  tidy_game
  
#GGPLOT
  ggplot(data = game_fil) + 
    geom_smooth(mapping = aes(x = year, y = rating), color = "red", show.legend = FALSE)
  
  