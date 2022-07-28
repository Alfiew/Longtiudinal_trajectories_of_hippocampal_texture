library(tidyverse)

ta_data_dir <- "data" # Assumes R project is in ADNI/texture_analysis_processing/code

ta_data_1 <- read.csv(paste0(ta_data_dir, "/ta_stats_ASHST1_z_denoise_2.csv"))
ta_data_2 <- read.csv(paste0(ta_data_dir, "/ta_stats_ASHST1_z_denoise_tail25k.csv"))

ta_data <- rbind(ta_data_1, ta_data_2) %>% distinct()

write.csv(ta_data, file = paste0(ta_data_dir, "/ta_stats_z_denoise.csv"),row.names = FALSE)
