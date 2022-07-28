library(tidyverse)

# Merge together the lists to create a single table with all subset IDs and grouping factors
getwd()

# Load lists
load(file="data/ID_lists/total_ADNI_list.Rdata")
load(file="data/ID_lists/texture_subset_list.Rdata")
load(file="data/ID_lists/model_train_list.Rdata")
load(file="data/ID_lists/Tx_group_compare_list.Rdata")
load(file="data/ID_lists/Tx_model_list.Rdata")
load(file="data/ID_lists/pred_cog_change_list.Rdata")
load(file="data/ID_lists/pred_age_list.Rdata")

merge1 <- merge(total_ADNI_list, texture_subset_list,
      # , , , , , 
      by=c('PTID','VISCODE'),
      all = TRUE)

merge2 <- merge(merge1, model_train_list,
                by=c('PTID','VISCODE'),
                all = TRUE)

merge3 <- merge(merge2, Tx_group_compare_list,
                by=c('PTID','VISCODE'),
                all = TRUE)

merge4 <- merge(merge3, Tx_model_list,
                by=c('PTID','VISCODE'),
                all = TRUE)

merge5 <- merge(merge4, pred_cog_change_list,
                by=c('PTID','VISCODE'),
                all = TRUE)

merge6 <- merge(merge5, pred_age_list,
                by=c('PTID','VISCODE'),
                all = TRUE)

full_id_list <- merge6 %>%
replace(is.na(merge6), "N")

save(full_id_list,file = 'data/ID_lists/full_id_list.Rdata')
write.csv(full_id_list, file = 'data/ID_lists/full_id_list.csv', row.names = FALSE)
