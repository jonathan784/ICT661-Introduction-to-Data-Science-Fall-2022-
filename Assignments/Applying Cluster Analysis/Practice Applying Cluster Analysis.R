#Jonathan Jimenez
#ICT 661
#10/28/2022
install.packages("tidyverse")
install.packages("factoextra")
install.packages("here")

library(tidyverse)
library(factoextra)
library(here)

#loading in DF
df <- read_csv(here("Assignments","Applying Cluster Analysis","imdb_video_game_rating.csv"))
df
summary(df)
df$year = as.numeric(as.character(df$year))
summary(df)
#select Variables
new_df <- df %>%
  select(votes, rating)

#New DF
new_df <- scale(new_df)

#k-means cluster analysis
twitter_clusters <- kmeans(new_df, centers = 2)

twitter_clusters

#Fviz_clustering function
fviz_cluster(twitter_clusters, data = new_df)

#k-means with 3 clusters"Imdb_video_game_rating.scv"
twitter_clusters <- kmeans(new_df, centers = 3)
fviz_cluster(twitter_clusters, data = new_df)




