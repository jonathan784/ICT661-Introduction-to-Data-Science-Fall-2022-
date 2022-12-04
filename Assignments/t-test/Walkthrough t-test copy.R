#Jonathan Jimenez
install.packages("ggplot2movies")
install.packages("nycflights13")
library(tidyverse)
library(infer)
library(moderndive)
library(nycflights13)
library(ggplot2movies)

promotions %>% 
  sample_n(size = 6) %>% 
  arrange(id)

ggplot(promotions, aes(x = gender, fill = decision)) +
  geom_bar() +
  labs(x = "Gender of name on résumé")

promotions %>% 
  group_by(gender, decision) %>% 
  tally()

promotions %>% 
  specify(formula = decision ~ gender, success = "promoted")

promotions %>% 
  specify(formula = decision ~ gender, success = "promoted") %>% 
  hypothesize(null = "independence")

promotions_generate <- promotions %>% 
  specify(formula = decision ~ gender, success = "promoted") %>% 
  hypothesize(null = "independence") %>% 
  generate(reps = 1000, type = "permute")
nrow(promotions_generate)

null_distribution <- promotions %>% 
  specify(formula = decision ~ gender, success = "promoted") %>% 
  hypothesize(null = "independence") %>% 
  generate(reps = 1000, type = "permute") %>% 
  calculate(stat = "diff in props", order = c("male", "female"))
null_distribution

obs_diff_prop <- promotions %>% 
  specify(decision ~ gender, success = "promoted") %>% 
  calculate(stat = "diff in props", order = c("male", "female"))
obs_diff_prop

visualize(null_distribution, bins = 10)

visualize(null_distribution, bins = 10) + 
  shade_p_value(obs_stat = obs_diff_prop, direction = "right")

null_distribution %>% 
  get_p_value(obs_stat = obs_diff_prop, direction = "right")










