library(tidyverse)
metrics_dataframes = list()
loss_dataframes = list()
fixation_dataframes = list()
dir = '/pine/scr/a/m/amjada/eff_sim/10n'
files = list.files(dir)
print(files)
i <- 1
j <- 1
k <- 1

for (f in files){
  suffix = strsplit(f, "_")[[1]][1]
  if (suffix == "metrics"){
    df <- read.csv(sprintf('%s/%s', dir, f))
    df$run <- rep(i, nrow(df))
    metrics_dataframes[[i]] <- df
    i = i+1
  } else if (suffix == "fixation") {
    df <- read.csv(sprintf('%s/%s', dir, f))
    df$run <- rep(k, nrow(df))
    fixation_dataframes[[k]] <- df
    k = k+1
  }
    
}

metrics_df <- bind_rows(metrics_dataframes)
#loss_df <- bind_rows(loss_dataframes)
fixation_df <- bind_rows(fixation_dataframes)
write.csv(metrics_df, '/pine/scr/a/m/amjada/eff_sim/metrics_10.csv')
write.csv(fixation_df, '/pine/scr/a/m/amjada/eff_sim/fixation_10.csv')