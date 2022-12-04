#Jonathan Jimenez
install.packages("tidyverse")
install.packages("moderndive")
install.packages("infer")

library(tidyverse)
library(moderndive)
library(infer)

pennies_sample

ggplot(pennies_sample, aes(x = year)) +
  geom_histogram(binwidth = 10, color = "white")

pennies_mean <- pennies_sample %>% 
  summarize(mean_year = mean(year))
pennies_mean

resample <- pennies_sample %>% 
  rep_sample_n(size = 50, replace = TRUE)

resample

resample %>% 
  summarize(resample_mean = mean(year))

resamples <- pennies_sample %>% 
  rep_sample_n(size = 50, replace = TRUE, reps = 35)
resamples

resampled_means <- resamples %>% 
  group_by(replicate) %>% 
  summarize(mean_year = mean(year))
resampled_means

ggplot(resampled_means, aes(x = mean_year)) +
  geom_histogram(binwidth = 1, color = "white", boundary = 1990) +
  labs(x = "Resample mean year")

# Repeat resampling 1000 times
resamples <- pennies_sample %>% 
  rep_sample_n(size = 50, replace = TRUE, reps = 1000)

# Compute 1000 sample means
resampled_means <- resamples %>% 
  group_by(replicate) %>% 
  summarize(mean_year = mean(year))

resampled_means <- pennies_sample %>% 
  rep_sample_n(size = 50, replace = TRUE, reps = 1000) %>% 
  group_by(replicate) %>% 
  summarize(mean_year = mean(year))
resampled_means

ggplot(resampled_means, aes(x = mean_year)) +
  geom_histogram(binwidth = 1, color = "white", boundary = 1990) +
  labs(x = "sample mean")

resampled_means %>% 
  summarize(mean_of_means = mean(mean_year))

resampled_means %>% 
  summarize(SE = sd(mean_year))

pennies_sample %>% 
  summarize(stat = mean(year))

pennies_sample %>% 
  specify(response = year) %>% 
  calculate(stat = "mean")

pennies_sample %>% 
  specify(response = year)

pennies_sample %>% 
  specify(formula = year ~ NULL)

pennies_sample %>% 
  specify(response = year) %>% 
  generate(reps = 1000, type = "bootstrap")

bootstrap_distribution <- pennies_sample %>% 
  specify(response = year) %>% 
  generate(reps = 1000) %>% 
  calculate(stat = "mean")
bootstrap_distribution

visualize(bootstrap_distribution)

percentile_ci <- bootstrap_distribution %>% 
  get_confidence_interval(level = 0.95, type = "percentile")
percentile_ci

visualize(bootstrap_distribution) + 
  shade_confidence_interval(endpoints = percentile_ci)

visualize(bootstrap_distribution) + 
  shade_ci(endpoints = percentile_ci, color = "hotpink", fill = "khaki")

standard_error_ci <- bootstrap_distribution %>% 
  get_confidence_interval(type = "se", point_estimate = pennies_mean)

standard_error_ci

visualize(bootstrap_distribution) + 
  shade_confidence_interval(endpoints = standard_error_ci)
