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
library(readr)

#Read in
game <- read_csv(here("Assignments","Visualization Data","imdb_video_game_rating.csv"))
game

#Filtter
game_fil <- game %>%
  select(-plot) %>%
  select(-genre) %>%
  select(-votes) %>%
  select(-directors)
game_fil 
game_fil$year <- as.integer(game_fil$year)
game_fil
#tidy
tidy_game <- game_fil%>%
pivot_longer(names_to = "Year",values_to = "Rating", cols = -title)
tidy_game
#GGPLOT
ggplot(data = game_fil) + 
  geom_smooth(mapping = aes(x = year, y = rating), color = "red")


