# DATA419_GroupProject
Fan engagement

## Twitter

`Twitter/Plotting` contains plots of some of the Twitter data.

`Twitter/Top 20`, and `Twitter/bottom 20` contains CSV files of per-tweet engagement metrics for each artist.

The subdirectories of `Twitter/Followers data` contains CSV files for each artist, with 50,000 follower user IDs of that artist.

`Twitter/summary_data` contains CSV files of information about twitter profiles of celebrities, some were not included in the later sample.

`Twitter_Engagement.ipynb` created the plots in `Twitter/Plotting`.

`twitter_data_scraping.Rmd` sampled followers for each celebrity, some of this data was not used in the later sample.

`twitter_follower.R` sampled 50,000 follower IDs and created the CSV files in `Twitter/Followers data`.

`twitter_networkplots.ipynb` creates the plots of the artist follower network in the report.

`twitter_reply_like_count.ipynb` created the CSV files with tweet engagement metrics in `Twitter/Top 20`, and `Twitter/bottom 20`.


## Youtube

The subdirectories of `Youtube/youtube_data/` contain per-artist CSV files, containing information about each video.

`DATA419_GProject_Youtube.ipynb` and  `DATA419_GProject_Youtube.ipynb` created the `Channels_info_famed.csv` and `Channels_info_underrated.csv` files, containing information about each artist's channel.

These notebooks also created the per-artist CSV files.

`419_youtube_plots.R` created these 3 plots, `youtube_boxplots.png`, `youtube_mean_stats.png`, and `youtube_rate_stats.png`.

`all_youtube.csv`, `merged_famed.csv`, and `merged_underrated.csv` are combinations of the CSV files in `Youtube/youtube_data/`.

`Untitled1.ipynb` contains some statistical tests.
