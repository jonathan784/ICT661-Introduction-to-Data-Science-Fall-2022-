#Jonathan Jimenez
#ICT 662
#11/10/2023

install.packages("tidyverse")
install.packages("moderndive")
install.packages("dslabs")

library(tidyverse)
library(moderndive)
library(dslabs)

str(murders)

states <- murders %>%
  select(-total) %>%
  filter(abb != "DC")

states %>% 
  summarize(avg_pop = mean(population))

states_5 <- states %>% 
  rep_sample_n(5)
states_5

states_5 %>% 
  summarize(avg_pop = mean(population))

states_20 <- states %>% 
  rep_sample_n(20)
states_20

states_20 %>% 
  summarize(avg_pop = mean(population))

states_20 <- states %>% 
  rep_sample_n(20, reps = 1000) %>%
  summarize(avg_pop = mean(population))

states_20 %>% 
  summarize(mean(avg_pop))

ggplot(data = states_20) +
  geom_histogram(aes(x = avg_pop))