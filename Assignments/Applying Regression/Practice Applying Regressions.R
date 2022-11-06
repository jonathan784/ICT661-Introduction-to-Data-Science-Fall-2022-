#Jonathan Jimenez
#11/04/2022


install.packages("tidyverse")
install.packages("moderndive")
install.packages("skimr")
install.packages("here")
install.packages("dplyr")

library(tidyverse)
library(moderndive)
library(skimr)
library(here)
library(dplyr)

#Read in Data
library(readr)
game <- read_csv(here("Assignments","Applying Regression","imdb_video_game_rating.csv"))
game
game$year = as.numeric(as.character(game$year))

game %>%
  na.omit()
#Loading and Exploring Our Data
#Selecting specific variables 
game_reg <- game %>%
  select(year, votes, rating)

#glimpse
glimpse(game_reg)
summary(game_reg)
#ST(something)?

#Random Sample
game_reg %>%
  sample_n(size = 5)


#selecting two variables and "skiming"
game_reg %>% select(year, rating) %>% skim()


#cor()
game_reg %>% na.omit() %>%
  get_correlation(formula = year ~ rating)

#Graph
ggplot(game_reg, aes(x = year, y = rating)) +
  geom_point() +
  labs(x = "Year", 
       y = "Game Rating",
       title = "Relationship Scatterplot of Year and Ratings")+
        geom_smooth(method = "lm", se = FALSE)


#Regression Table
# Fit regression model:
fit_model <- lm(year ~ rating, data = game_reg)
# Get regression table:
get_regression_table(fit_model)

#R^2
summary(fit_model)

#Multiple Regression
game_reg %>% get_correlation(formula = votes ~ rating)

# Fit regression model:
score_model_multiple <- lm(year ~ rating + votes, data = game_reg)
# Get regression table:
get_regression_table(score_model_multiple)

summary(score_model_multiple)
