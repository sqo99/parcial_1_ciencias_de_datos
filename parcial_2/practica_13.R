# librerias
library(tidyverse)
library(rtweet)
library(wordcloud2)

# Calentamiento global
# - 5 usuarios mas populares
# - los tweets mas populares sobre este tema
# - wordcloud

query <- search_tweets(q = "Calentamiento global", n = 1500)

# 5 usuarios más populares
query %>%
  top_n(5, followers_count) %>%
  arrange(desc(followers_count)) %>%
  select(screen_name, followers_count, location, text)

# tweets más populares
ggplot(filter(query, !is_retweet))+
  geom_histogram(aes(x = retweet_count), bins=30)

# wordcloud
wordcloud2(demoFreq, size = 1, shape = 'star')
wordcloud2(demoFreq, size = 0.5, shape = 'triangle-forward',
           color = "random-dark", ellipticity = 0.5)
