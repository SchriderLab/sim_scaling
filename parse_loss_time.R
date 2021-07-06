library(tidyverse)
file = "~/Desktop/loss_time.csv"
df = read.csv(file)
df <- 
  df %>%
  mutate(del_generation = as.numeric(del_generation)) %>% 
  mutate(origin_generation = as.numeric(levels(origin_generation))[origin_generation]) %>% 
  mutate(loss_time = del_generation - origin_generation)

ggplot(data = df, aes(x = loss_time)) +
  geom_histogram(aes(y=..count../sum(..count..)), 
                 fill="deepskyblue2", binwidth = 10, boundary = 0) +
  scale_x_continuous(minor_breaks = seq(0, 100, 10)) +
  xlim(0 , 110)