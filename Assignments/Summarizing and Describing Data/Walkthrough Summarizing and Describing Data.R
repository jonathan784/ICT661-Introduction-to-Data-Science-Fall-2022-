install.packages("tidyverse")
install.packages("here")
install.packages("gapminder")

library(tidyverse)
library(gapminder)
library(here)

str(gapminder)

class(gapminder)

gapminder

#top part of data
head(gapminder)

#last part
tail(gapminder)

#turn into tibble
as_tibble(iris)
iris
names(gapminder)
ncol(gapminder)
length(gapminder)
dim(gapminder)

#copy
my_gap <- gapminder

#Modifying and Summarizing gapminder
my_gap %>% filter(country == "Canada")

my_precious <- my_gap %>% filter(country == "Canada")

#Use mutate() to Add New Variables
my_gap %>%  mutate(gdp = pop * gdpPercap)

#Use arrange() to Order Data by Rows
my_gap %>%  arrange(year, country)
#Or maybe you want just the data from 2007, sorted on life expectancy?
my_gap %>%  filter(year == 2007) %>%  arrange(lifeExp)

#life expectancy in descending order
my_gap %>%  filter(year == 2007) %>%  arrange(desc(lifeExp))

#How many observations do we have per continent?
my_gap %>%  group_by(continent) %>%  summarize(n = n())

my_gap %>% group_by(continent) %>% tally()

#The count() function is even more convenient in that it does both grouping and counting:\
my_gap %>% count(continent)

#Use the n_distinct() function to count the number of distinct countries within each continent
my_gap %>% group_by(continent) %>% summarize(n = n(), n_countries = n_distinct(country))

#computing the average life expectency by continent
my_gap %>% group_by(continent) %>% summarize(avg_lifeExp = mean(lifeExp))

#summarize_at() applies the same summary function(s) to multiple variables
my_gap %>% filter(year %in% c(1952, 2007)) %>% group_by(continent, year) %>% summarize_at(vars(lifeExp, gdpPercap), list(~mean(.), ~median(.)))

#Let’s focus just on Asia. What are the minimum and maximum life expectancies seen by year
my_gap %>% filter(continent == "Asia") %>% group_by(year) %>% summarize(min_lifeExp = min(lifeExp), max_lifeExp = max(lifeExp))


