library(tidyverse)
df = read.csv('/pine/scr/a/m/amjada/eff_sim/metrics_10k.csv')

df_mean <- 
  df %>% 
  group_by(generation) %>% 
  summarise(mean_m1 = mean(m1_count)*10, mean_m2 = mean(m2_count),
            mean_m3 = mean(m3_count), mean_rf = mean(mean_fitness)
  )

ggplot(data=df_mean, aes(x=generation)) + 
  geom_point(aes(y=mean_rf), color = 'red', size=0.05) +
  geom_point(aes(y=mean_m1), color = 'blue', size=0.5) +
  ylim(c(0,5e6))