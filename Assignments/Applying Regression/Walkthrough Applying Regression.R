#Jonathan Jimenez
#Applying Linear Regression

install.packages("tidyverse")
install.packages("moderndive")
install.packages("skimr")

library(tidyverse)
library(moderndive)
library(skimr)

#Loading and Exploring Our Data
#Selecting specific variables 
evals_reg <- evals %>%
  select(ID, score, bty_avg, age)

#glimpse
glimpse(evals_reg)
summary(evals_reg)
#ST(something)?

#Random Sample
evals_reg %>%
  sample_n(size = 5)

#summary
evals_reg %>%
  summarize(mean_bty_avg = mean(bty_avg), mean_score = mean(score),
            median_bty_avg = median(bty_avg), median_score = median(score))

#selecting two variables and "skiming"
evals_reg %>% select(score, bty_avg) %>% skim()

#Get_correlation
evals_reg %>% 
  get_correlation(formula = score ~ bty_avg)
#cor()
evals_reg %>%   summarize(correlation = cor(score, bty_avg))

#Graph
ggplot(evals_reg, aes(x = bty_avg, y = score)) +
  geom_point() +
  labs(x = "Beauty Score", 
       y = "Teaching Score",
       title = "Scatterplot of relationship of teaching and beauty scores")

#Jitter adding 
ggplot(evals_reg, aes(x = bty_avg, y = score)) +
  geom_jitter() +
  labs(x = "Beauty Score", y = "Teaching Score",
       title = "Scatterplot of relationship of teaching and beauty scores")

#Best fitting line
ggplot(evals_reg, aes(x = bty_avg, y = score)) +
  geom_point() +
  labs(x = "Beauty Score", y = "Teaching Score",
       title = "Relationship between teaching and beauty scores") +  
  geom_smooth(method = "lm", se = FALSE)

#Regression Table
# Fit regression model:
score_model <- lm(score ~ bty_avg, data = evals_reg)
# Get regression table:
get_regression_table(score_model)

#R^2
summary(score_model)

#Regression test with age and beauty
evals_reg %>% get_correlation(formula = age ~ bty_avg)

#regression modle with age and beauty
# Fit regression model:
score_model_multiple <- lm(score ~ bty_avg + age, data = evals_reg)
# Get regression table:
get_regression_table(score_model_multiple)

#summary
summary(score_model_multiple)







