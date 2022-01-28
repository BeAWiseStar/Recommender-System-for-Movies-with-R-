library(dplyr)
library(tidyr)

genome_scores = read.csv("ml-20m/genome-scores.csv")

genome_tags = read.csv("ml-20m/genome-tags.csv")

#ignore links csv
#links = read.csv("ml-20m/links.csv")

movies = read.csv("ml-20m/movies.csv")

ratings = read.csv("ml-20m/ratings.csv")

#ignore tags csv
#tags = read.csv("ml-20m/tags.csv")


#Preprocessing Pipeline

#1.get max relevant tagId assigned to each movieId from genome_scores


#2.merge genome_scores with movies using movieID into movies


#3.split movies.genres based on "|" then 1 hot encode


#4.merge movies with ratings


#5. remove timestamp