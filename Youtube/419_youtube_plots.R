library(tidyverse)
library(scales)
library(forcats)
library(grid)
library(gridExtra)
# ggpubr was tested while trying to organise plots
# unsure if it's functions are still in the final layout
library(ggpubr)

# load files
alan_walker        <- read_csv("~/youtube_plots_data/Alan Walker.csv")
alina_baraz        <- read_csv("~/youtube_plots_data/Alina Baraz.csv")
andy_grammer       <- read_csv("~/youtube_plots_data/Andy Grammer.csv")
bad_bunny          <- read_csv("~/youtube_plots_data/Bad Bunny.csv")
bts                <- read_csv("~/youtube_plots_data/BANGTANTV.csv")
before_you_exit    <- read_csv("~/youtube_plots_data/Before You Exit.csv")
billie_eilish      <- read_csv("~/youtube_plots_data/Billie Eilish.csv")
blackpink          <- read_csv("~/youtube_plots_data/BLACKPINK.csv")
bruno_mars         <- read_csv("~/youtube_plots_data/Bruno Mars.csv")
cavetown           <- read_csv("~/youtube_plots_data/cavetown.csv")
chase_atlantic     <- read_csv("~/youtube_plots_data/CHASE ATLANTIC.csv")
cigarettesaftersex <- read_csv("~/youtube_plots_data/CigarettesAfterSex.csv")
claire_cottrill    <- read_csv("~/youtube_plots_data/Claire Cottrill.csv")
clean_bandit       <- read_csv("~/youtube_plots_data/Clean Bandit.csv")
daddy_yankee       <- read_csv("~/youtube_plots_data/Daddy Yankee.csv")
ed_sheeran         <- read_csv("~/youtube_plots_data/Ed Sheeran.csv")
eminem             <- read_csv("~/youtube_plots_data/EminemMusic.csv")
fka_twigs          <- read_csv("~/youtube_plots_data/FKA twigs.csv")
honne              <- read_csv("~/youtube_plots_data/H O N N E.csv")
jorja_smith        <- read_csv("~/youtube_plots_data/Jorja Smith.csv")
justin_bieber      <- read_csv("~/youtube_plots_data/Justin Bieber.csv")
katy_perry         <- read_csv("~/youtube_plots_data/Katy Perry.csv")
kim_petras         <- read_csv("~/youtube_plots_data/Kim Petras.csv")
kygo               <- read_csv("~/youtube_plots_data/KygoMusic.csv")
maroon_5           <- read_csv("~/youtube_plots_data/Maroon 5.csv")
marshmello         <- read_csv("~/youtube_plots_data/Marshmello.csv")
nina_nesbitt       <- read_csv("~/youtube_plots_data/Nina Nesbitt.csv")
oliver_tree        <- read_csv("~/youtube_plots_data/Oliver Tree.csv")
one_direction      <- read_csv("~/youtube_plots_data/One Direction.csv")
ozuna              <- read_csv("~/youtube_plots_data/Ozuna.csv")
rihanna            <- read_csv("~/youtube_plots_data/Rihanna.csv")
ruel               <- read_csv("~/youtube_plots_data/RUEL.csv")
selena_gomez       <- read_csv("~/youtube_plots_data/Selena Gomez.csv")
shakira            <- read_csv("~/youtube_plots_data/Shakira.csv")
tate_mcrae         <- read_csv("~/youtube_plots_data/Tate McRae.csv")
taylor_swift       <- read_csv("~/youtube_plots_data/Taylor Swift.csv")
tessa_violet       <- read_csv("~/youtube_plots_data/Tessa Violet.csv")
woodz              <- read_csv("~/youtube_plots_data/WOODZ.csv")
xxxtentacion       <- read_csv("~/youtube_plots_data/XXXTENTACION.csv")
ramdaram           <- read_csv("~/youtube_plots_data/람다람.csv")

artist_names <- c('alan_walker', 'alina_baraz', 'andy_grammer', 'bad_bunny',
                  'bts', 'before_you_exit', 'billie_eilish', 'blackpink',
                  'bruno_mars', 'cavetown', 'chase_atlantic',
                  'cigarettesaftersex', 'claire_cottrill', 'clean_bandit',
                  'daddy_yankee', 'ed_sheeran', 'eminem', 'fka_twigs', 'honne',
                  'jorja_smith', 'justin_bieber', 'katy_perry', 'kim_petras',
                  'kygo', 'maroon_5', 'marshmello', 'nina_nesbitt',
                  'oliver_tree', 'one_direction', 'ozuna', 'ramdaram',
                  'rihanna', 'ruel', 'selena_gomez', 'shakira', 'tate_mcrae',
                  'taylor_swift', 'tessa_violet', 'woodz', 'xxxtentacion')

# list of dataframes
video_stats_list <- list(alan_walker, alina_baraz, andy_grammer, bad_bunny, bts,
                         before_you_exit, billie_eilish, blackpink, bruno_mars,
                         cavetown, chase_atlantic, cigarettesaftersex,
                         claire_cottrill, clean_bandit, daddy_yankee,
                         ed_sheeran, eminem, fka_twigs, honne, jorja_smith,
                         justin_bieber, katy_perry, kim_petras, kygo, maroon_5,
                         marshmello, nina_nesbitt, oliver_tree, one_direction,
                         ozuna, ramdaram, rihanna, ruel, selena_gomez, shakira,
                         tate_mcrae, taylor_swift, tessa_violet, woodz,
                         xxxtentacion)

subscribers <- c(41800000, 373000, 994000, 39500000, 66200000, 582000, 45500000,
                 74100000, 34800000, 2080000, 1490000, 1920000, 1910000,
                 10100000, 36400000, 51800000, 51900000, 678000, 989000,
                 1340000, 68800000, 42800000, 358000, 6470000, 35700000,
                 55200000, 384000, 3550000, 37100000, 34900000, 834000,
                 39100000, 1550000, 30700000, 35700000, 3960000, 46300000,
                 1870000, 488000, 36900000)


# get stats from dataframes
mean_views <- list()
for (i in video_stats_list){
  viewmean <- mean(i$Video_Views, na.rm = TRUE)
  mean_views <- append(mean_views, viewmean)
}
mean_likes <- list()
for (i in video_stats_list){
  likemean <- mean(i$Video_Likes, na.rm = TRUE)
  mean_likes <- append(mean_likes, likemean)
}
mean_comments <- list()
for (i in video_stats_list){
  commentmean <- mean(i$Video_Comments, na.rm = TRUE)
  mean_comments <- append(mean_comments, commentmean)
}


mean_views <- unlist(mean_views)
mean_likes <- unlist(mean_likes)
mean_comments <- unlist(mean_comments)


# combine into new dataframe
stats <- tibble(artist_names,
                mean_views,
                mean_likes,
                mean_comments,
                subscribers)

# normalised by subscriber count
stats <- stats %>% 
  mutate(mean_views_norm = mean_views/subscribers,
         mean_likes_norm = mean_likes/subscribers,
         mean_comments_norm = mean_comments/subscribers)


#plots in 2 cols of 3
# 1, 3, 5 are column for mean stats
# 2, 4, 6 are column for rate stats
# only 1 and 2 need titles, only 5 and 6 need artist names

# mean and rate views
p1 <- stats %>% 
  ggplot() +
  # mean views by artist
  # colored and ordered by number of subscribers
  aes(x = fct_reorder(artist_names, subscribers),
      y = mean_views,
      fill = subscribers) +
  ylab("Mean views") +
  labs(title = "Mean engagement metrics of Youtube channels")+
  # display numbers in short scale
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  scale_fill_gradient(labels = label_number(scale_cut = cut_short_scale())) +
  # hide artist names and ticks, center title
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  geom_col()

p2 <- stats %>% 
  ggplot() +
  aes(x = fct_reorder(artist_names, subscribers),
      y = mean_views_norm,
      fill = subscribers) +
  ylab("Mean view rate") +
  labs(title = "Mean engagement rate metrics of Youtube channels")+
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  scale_fill_gradient(labels = label_number(scale_cut = cut_short_scale())) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  geom_col()


#mean and rate likes
p3 <- stats %>% 
  ggplot() +
  aes(x = fct_reorder(artist_names, subscribers),
      y = mean_likes,
      fill = subscribers) +
  ylab("Mean likes") +
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  scale_fill_gradient(labels = label_number(scale_cut = cut_short_scale())) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank()) +
  geom_col()

p4 <- stats %>% 
  ggplot() +
  aes(x = fct_reorder(artist_names, subscribers),
      y = mean_likes_norm,
      fill = subscribers) +
  ylab("Mean like rate") +
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  scale_fill_gradient(labels = label_number(scale_cut = cut_short_scale())) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank()) +
  geom_col()


# mean and rate comments
p5 <- stats %>% 
  ggplot() +
  aes(x = fct_reorder(artist_names, subscribers),
      y = mean_comments,
      fill = subscribers) +
  # horizontal artist labels
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Artists") +
  ylab("Mean comments") +
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  scale_fill_gradient(labels = label_number(scale_cut = cut_short_scale())) +
  geom_col()

p6 <- stats %>% 
  ggplot() +
  aes(x = fct_reorder(artist_names, subscribers),
      y = mean_comments_norm,
      fill = subscribers) +
  # horizontal artist labels
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Artists") +
  ylab("Mean comment rate") +
  scale_y_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  scale_fill_gradient(labels = label_number(scale_cut = cut_short_scale())) +
  geom_col()

# grob and layout
g1 <- ggplotGrob(p1)
g2 <- ggplotGrob(p2)
g3 <- ggplotGrob(p3)
g4 <- ggplotGrob(p4)
g5 <- ggplotGrob(p5)
g6 <- ggplotGrob(p6)
k1 <- rbind(g1, g3, g5)
k2 <- rbind(g2, g4, g6)

# draw first column
grid.newpage()
grid.draw(k1)

#explode displayed layout into grobs
grid.force()
# remove extra legends
grid.remove("guide-box.7-9-7-9")
grid.remove("guide-box.31-9-31-9")
# save currently displayed version
bigplot1 <- grid.grab()

#repeat
grid.newpage()
grid.draw(k2)
grid.force()
grid.remove("guide-box.7-9-7-9")
grid.remove("guide-box.31-9-31-9")
bigplot2 <- grid.grab()


# there is definitely some better way to export images by code
# I just used rstudio export option


# boxplots categorized by less / more popular

stats <- stats %>% mutate(popular = stats$subscribers>=20000000)

# views, comments, likes, then rates for those 3
# vertical boxes, with no x axis labels
# pair of boxes in each plot, 6 plots in a row
# only the last in the row has a legend
b1 <- stats %>% ggplot()+
  aes(mean_views,
      group = popular,
      color = popular)+
  geom_boxplot(show.legend = FALSE) +
  xlab("Mean viewss") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  scale_x_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  coord_flip()

b2 <- stats %>% ggplot()+
  aes(mean_comments,
      group = popular,
      color = popular)+
  geom_boxplot(show.legend = FALSE) +
  xlab("Mean comments") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  scale_x_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  coord_flip()

b3 <- stats %>% ggplot()+
  aes(mean_likes,
      group = popular,
      color = popular)+
  geom_boxplot(show.legend = FALSE) +
  xlab("Mean likes") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  scale_x_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  coord_flip()

b4 <- stats %>% ggplot()+
  aes(mean_views_norm,
      group = popular,
      color = popular)+
  geom_boxplot(show.legend = FALSE) +
  xlab("Mean view rates") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  scale_x_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  coord_flip()

b5 <- stats %>% ggplot()+
  aes(mean_comments_norm,
      group = popular,
      color = popular)+
  geom_boxplot(show.legend = FALSE) +
  xlab("Mean comment rates") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  scale_x_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  coord_flip()

b6 <- stats %>% ggplot()+
  aes(mean_likes_norm,
      group = popular,
      color = popular)+
  geom_boxplot(show.legend = TRUE) +
  xlab("Mean like rates") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  scale_x_continuous(labels = label_number(scale_cut = cut_short_scale())) +
  scale_color_discrete(name = "Artist \npopularity",labels = c("Less", "More")) +
  coord_flip()

# grob, bind, and draw them
bg1 <- ggplotGrob(b1)
bg2 <- ggplotGrob(b2)
bg3 <- ggplotGrob(b3)
bg4 <- ggplotGrob(b4)
bg5 <- ggplotGrob(b5)
bg6 <- ggplotGrob(b6)
k3 <- cbind(bg1, bg2, bg3, bg4, bg5, bg6)

grid.newpage()
grid.draw(k3)
