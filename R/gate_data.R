library(tidyverse)
library(lubridate)
library(rvk) 
library(glue)

read_csv(here::here("data", "pool_api_data.csv")) %>% 
  ggplot(aes(x = hms::hms(hour = hour(time), minutes = minute(time)), 
             y = currentVisitors, color = "1")) +
  geom_line() +
  facet_wrap(~name) +
  rvk::theme_rvk() +
  rvk::scale_color_rvk() +
  theme(legend.position = "none") +
  labs(title = "An example of gate API data collected throughout November 5th",
       x = "Time of day")

ggsave(file = "gate_api.png", height = 5, width = 10, dpi = 300)



tilbuid %>% 
  filter(nafn == "Laugardalslaug") %>% 
  ggplot(aes(x = hms::hms(hour = hour(timi), minutes = minute(timi)), y = currentVisitors, color = "1")) +
  geom_line() +
  facet_wrap(~nafn) +
  rvk::theme_rvk() +
  rvk::scale_color_rvk() +
  theme(legend.position = "none") +
  labs(title = "An example of gate API data collected throughout November 5th",
       x = "Time of day")


ggsave(file = "gate_api_ldl.png", height = 5, width = 10, dpi = 300)
