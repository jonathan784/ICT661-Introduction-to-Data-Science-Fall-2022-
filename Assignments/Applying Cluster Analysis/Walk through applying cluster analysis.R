#Jonathan Jimenez
#ICT 661
#10/27/2022
install.packages("tidyverse")
install.packages("factoextra")
install.packages("here")

library(tidyverse)
library(factoextra)
library(here)

#loading in DF
df <- read_csv(here("activity_data","Twitter_hashtags.csv"))

#select Variables
new_df <- df %>%
  select(avg_hashtags_per_tweet, posts_per_hashtag)
summary(df)

#New DF
new_df <- scale(new_df)

#k-means clister analysis
twitter_clusters <- kmeans(new_df, centers = 2)

twitter_clusters

#Fviz_clustering function
fviz_cluster(twitter_clusters, data = new_df)

#See what is going on 
df$hashtags[c(6,34)]

#k-means with 3 clusters
twitter_clusters <- kmeans(new_df, centers = 3)
fviz_cluster(twitter_clusters, data = new_df)




