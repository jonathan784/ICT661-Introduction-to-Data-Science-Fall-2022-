#Jonathan Jimenez
#ICT 617
#10/14/2022

install.packages("tidyverse")
install.packages("here")
install.packages("gapminder")

library(tidyverse)
library(gapminder)
library(here)

#Read in
game <- read_csv(here("Assignments","Summarizing and Describing Data","imdb_video_game_rating.csv"))
game

str(game)

class(game)

game

#top part of data
head(game)

#last part
tail(game)

#turn into tibble
as_tibble(game)

names(game)
ncol(game)
length(game)
dim(game)

#copy
my_game <- game

#modify
my_game %>% filter(title == "God of War")

#Use mutate() to Add New Variables
my_game$year <- as.integer(my_game$year)
my_game %>%  mutate(number = year * rating)

#Use arrange() to Order Data by Rows
my_game %>%  arrange(year, title)

#Or maybe you want just the data from 2007, sorted on rating?
my_game %>%  filter(year == 2010) %>%  arrange(rating)

#rating in descending order
my_game %>%  filter(year == 2007) %>%  arrange(desc(rating))

#How many observations do we have per genre?
my_game %>% group_by(genre) %>% tally()

#The count() function is even more convenient in that it does both grouping and counting:\
my_game %>% count(genre)

#Use the n_distinct() function to count the number of distinct genres within each genre
my_game %>% group_by(genre) %>% summarize(n = n(), n_genre = n_distinct(genre))


#computing the average rating expectancy by genre
my_game %>% group_by(genre) %>% summarize(avg_rating = mean(rating))

#summarize_at() applies the same summary function(s) to multiple variables
my_game %>% filter(year %in% c(1998, 2022)) %>% group_by(genre, year) %>% summarize_at(vars(rating, votes), list(~mean(.), ~median(.)))

#Let’s focus just on Asia. What are the minimum and maximum rating seen by year
my_game %>% filter(genre == "Action") %>% group_by(year) %>% summarize(min_rating = min(rating), max_rating = max(rating))
