library(tidyverse)
df = read.csv('/pine/scr/a/m/amjada/eff_sim/metrics_100.csv')

df_mean <- 
  df %>% 
  group_by(generation) %>% 
  summarise(mean_m1 = median(m1_count)*10, mean_m2 = median(m2_count),
            mean_m3 = mean(m3_count), mean_rf = median(mean_fitness)
  ) 

ggplot(data=df_mean, aes(x=generation)) + 
  geom_line(aes(y=mean_rf), color = 'red', size=0.05) + 
  labs(title = "Relative fitness 100")

# ggplot(data=df_mean, aes(x=generation)) + 
#   geom_line(aes(y=mean_m1), color = 'blue', size=0.05)