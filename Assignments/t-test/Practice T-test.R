#Jonathan Jimenez
install.packages("ggplot2movies")
install.packages("nycflights13")
install.packages("here")
install.packages("readr")

library(here)
library(tidyverse)
library(infer)
library(moderndive)
library(nycflights13)
library(ggplot2movies)

library(readr)
game <- read_csv(here("Assignments","t-test","imdb_video_game_rating.csv"))
game
game$year = as.numeric(as.character(game$year))

game %>%
  na.omit()

str(game)

game_fil <- game %>%
  select(-plot) %>%
  select(-directors) %>%
  select(-year) %>%
  select(-title) %>%
  select(-...1) %>%
  select(-votes)%>%
  filter(genre == c("Action, Adventure, Drama", "Action, Adventure, Fantasy"))
game_fil

game_fil %>% 
  sample_n(size = 6) %>% 
  arrange(genre)

ggplot(game_fil, aes(x = genre, fill = rating)) +
  geom_bar() +
  labs(x = "Genre of Games")

game_fil %>% 
  group_by(genre, rating) %>% 
  tally()

game_fil %>% 
  specify(formula = rating ~ genre)

game_fil %>% 
  specify(formula = rating ~ genre) %>% 
  hypothesize(null = "independence")

game_fil_generate <- game_fil %>% 
  specify(formula = rating ~ genre) %>% 
  hypothesize(null = "independence") %>% 
  generate(reps = 1000, type = "permute")
nrow(game_fil_generate)

null_distribution <- game_fil %>% 
  specify(formula = rating ~ genre) %>% 
  hypothesize(null = "independence") %>% 
  generate(reps = 1000, type = "permute") %>% 
  calculate(stat = "diff in means", order = c("Action, Adventure, Drama", "Action, Adventure, Fantasy"))
 null_distribution

 obs_diff_means <- game_fil %>% 
   specify(rating ~ genre) %>% 
   calculate(stat = "diff in means", order = c("Action, Adventure, Drama", "Action, Adventure, Fantasy"))
 obs_diff_means

visualize(null_distribution, bins = 10)

visualize(null_distribution, bins = 10) + 
  shade_p_value(obs_stat = obs_diff_means, direction = "right")

null_distribution %>% 
  get_p_value(obs_stat = obs_diff_means, direction = "right")










