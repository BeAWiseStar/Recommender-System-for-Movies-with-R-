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
genres = c()

#repeat the number of rows times in movies
for(i in 1:length(movies$genres)){
  #split the string in genres by '|' and unlist
  gen = unlist(strsplit(movies$genres[i], fixed = TRUE, split = '|'))
  #repeat the number of genres times. x is the name of genre
  for(x in gen){
    #if x is not in genres vector
    if(!x %in% genres){
      #put x in the vector
      genres = c(genres, x)
      #then append the column to movies dataframe which is initialized by 0
      movies = cbind(movies, rep(0, times = nrow(movies)))
      #change the name of column to x
      colnames(movies)[match(x, genres) + 3] = x
    }
    
    #replace the value to 1 where the row has the genre
    movies[i, which(colnames(movies) == x)] = 1
  }
}

#4.merge movies with ratings


#5. remove timestamp






library(Hmisc)
# in tag there are  38643 tags and 16 missing, 46554 rows and 4 columns
describe(tags)
dim(tags)
# 4000 different relevance and mean of 0.1165, total 1128 distinct tagid, 11709768 rows 3 cols
describe(genome_scores)
dim(genome_scores)
# 1128 distinct tag and tagid 1128 row 2 columns
describe(genome_tags)
dim(genome_tags)
# missing values in tmdbId, display imbd and tmdb for each movieId, 27278 unique move id, 27278 rows and 3 columns
describe(links)
dim(links)
# 27278 different movieid and 1342 distinct genres, movies and links have same size observation, 27278 rows and 3 columns
describe(movies)
dim(movies)
# 10 distinct rating, 20000263 rows and 4 columns
describe(ratings)
dim(ratings)

# only 457 movie id can be found out of 27278 movie id in movies
length(unique(table(tags$movieId[which(tags$movieId %in% movies$movieId)])))


