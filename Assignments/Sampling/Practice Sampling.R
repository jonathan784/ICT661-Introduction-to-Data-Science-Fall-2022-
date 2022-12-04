#Jonathan Jimenez
#ICT 662
#11/10/2023

install.packages("tidyverse")
install.packages("moderndive")
install.packages("dslabs")


library(tidyverse)
library(moderndive)
library(dslabs)
library(here)

#Read in Data
library(readr)
game <- read_csv(here("Assignments","Sampling","imdb_video_game_rating.csv"))
game
game$year = as.numeric(as.character(game$year))

game %>%
  na.omit()

str(game)

game_fil <- game %>%
  select(-plot) %>%
  select(-directors) %>%
  filter(title != "God of War")

game_fil %>% 
  summarize(avg_rating = mean(rating))

game_5 <- game_fil %>% 
  rep_sample_n(5)
game_5

game_5 %>% 
  summarize(avg_rating = mean(rating))

game_20 <- game_fil %>% 
  rep_sample_n(20)
game_20

game_20 %>% 
  summarize(avg_rating = mean(rating))

game_20 <- game_fil %>% 
  rep_sample_n(20, reps = 1000) %>%
  summarize(avg_rating = mean(rating))

game_20 %>% 
  summarize(mean(avg_rating))

ggplot(data = game_20) +
  geom_histogram(aes(x = avg_rating))