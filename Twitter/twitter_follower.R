library(tidyverse)
library(rtweet)
library(reshape2)
library(dplyr)
library(igraph)
library(rjson)

setwd("D:/Study/DATA419/Group Project/Twitter")

artists <- c('BLACKPINK', 'justinbieber', 'BTS_twt', 'marshmello', 'Eminem', 'edsheeran', 
             'taylorswift13', 'billieeilish', 'katyperry', 'IAmAlanWalker', 'sanbenito',
             'rihanna', 'onedirection', 'xxxtentacion', 'daddy_yankee', 'maroon5', 'shakira', 
             'ozuna', 'BrunoMars', 'selenagomez')
artists_2 <- c('FKAtwigs', 'andygrammer', 'c_woodzofficial', 'beforeyouexit', 'rrr001222', 
               'CAVETOWN', 'clairo', 'oneruel', 'Olivertree', 'TessaViolet', "alinabaraz",
               'CigsAfterSexx', 'KygoMusic', 'ninanesbitt', 'cleanbandit', 'chaseatlantic', 'tatemcrae', 
               'hellohonne', 'JorjaSmith', 'kimpetras')

artist_name <- artists_2[12]
followers <- get_followers(user=artist_name, n = 50000, retryonratelimit = TRUE, verbose = TRUE)
followers_1 <- get_followers(user=artist_name, cursor = next_cursor)
followers_2 <- get_followers(user=artist_name, cursor = follower_1)
rate <- rate_limit()
filter(rate,rate$query=='followers/ids')
#rtweet.retryonratelimit = TRUE
write.csv(followers, str_c(artist_name, "_followers.csv"))

for ( artist_name in artists_2[2:20]) {
  followers <- get_followers(artist_name, n = 50000, retryonratelimit = TRUE, verbose = TRUE)
  write.csv(followers, str_c(artist_name, "_followers.csv"))
}
