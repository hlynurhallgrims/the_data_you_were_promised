library(ggplot2)
library(tibble)
library(dplyr)
ble <- Sys.setlocale("LC_TIME", "en_US.UTF-8")

gogn <- 
  tribble(~dags, ~flag,
          as.Date("2020-02-11"), "action",
          as.Date("2020-03-03"), "email",
          as.Date("2020-03-05"), "email",
          as.Date("2020-06-22"), "email",
          as.Date("2020-06-23"), "email",
          as.Date("2020-07-02"), "email",
          as.Date("2020-07-30"), "email",
          as.Date("2020-07-31"), "email",
          as.Date("2020-08-07"), "email",
          as.Date("2020-08-12"), "email",
          as.Date("2020-08-14"), "email",
          as.Date("2020-08-21"), "email",
          as.Date("2020-08-27"), "email",
          as.Date("2020-09-01"), "email",
          as.Date("2020-12-02"), "email",
          as.Date("2021-01-25"), "action")



ggplot(data = gogn, aes(x = dags, y = 0, color = flag)) +
  theme_minimal() +
  geom_point() +
  scale_x_date(date_breaks = "1 month", minor_breaks = NULL, 
               date_labels = "%b %y") +
  scale_y_continuous(breaks = 0, minor_breaks = NULL, labels = NULL) +
  coord_cartesian(xlim = c(as.Date("2020-01-01"), as.Date("2021-02-01")),
                  ylim = c(-0.0125, 0.0125)) +
  geom_vline(xintercept = as.Date("2020-01-01")) +
  geom_vline(xintercept = as.Date("2021-01-01")) +
  geom_segment(x = as.Date("2020-02-11"), xend = as.Date("2020-02-11"),
               y = 0.01, yend = 0,
               color = rvk::rvk_palettur$value[4],
               show.legend = FALSE) +
  geom_label(x = as.Date("2020-02-11"), y = 0.01, 
             color = rvk::rvk_palettur$value[4], 
             label = "We requested the data",
             show.legend = FALSE) +
  geom_segment(x = as.Date("2021-01-25"), xend = as.Date("2021-01-25"),
               y = 0.01, yend = 0,
               color = rvk::rvk_palettur$value[4],
               show.legend = FALSE) +
  geom_label(x = as.Date("2021-01-25"), y = 0.01, 
             color = rvk::rvk_palettur$value[4],
             label = "We got the data", 
             show.legend = FALSE) +
  labs(y = NULL,
       x = NULL, 
       color = NULL) +
  theme(legend.position = "bottom") +
  scale_color_manual(values = rvk::rvk_palettur$value[c(4, 3)]) +
  geom_rect(xmin = as.Date("2020-03-10"), xmax = as.Date("2020-06-15"),
            ymin = -0.015, ymax = 0.015, alpha = 0.02, color = NA) +
  geom_text(x = as.Date("2020-04-28"), y = 0.001, label = "Covid dashboard \n becomes our priority",
            color = "black", check_overlap = TRUE) +
  geom_rect(xmin = as.Date("2020-09-05"), xmax = as.Date("2020-11-30"),
            ymin = -0.015, ymax = 0.015, alpha = 0.02, color = NA) +
  geom_text(x = as.Date("2020-10-17"), y = 0.001, label = "Lawyer stuff: API fee",
            color = "black", check_overlap = TRUE)


ggsave(filename = "timeline.png", height = 3, width = 10, dpi = 300)


# Án rect -------------------------------------------------------------------------------------

ggplot(data = gogn, aes(x = dags, y = 0, color = flag)) +
  theme_minimal() +
  geom_point() +
  scale_x_date(date_breaks = "1 month", minor_breaks = NULL, 
               date_labels = "%b %y") +
  scale_y_continuous(breaks = 0, minor_breaks = NULL, labels = NULL) +
  coord_cartesian(xlim = c(as.Date("2020-01-01"), as.Date("2021-02-01")),
                  ylim = c(-0.0125, 0.0125)) +
  geom_vline(xintercept = as.Date("2020-01-01")) +
  geom_vline(xintercept = as.Date("2021-01-01")) +
  geom_segment(x = as.Date("2020-02-11"), xend = as.Date("2020-02-11"),
               y = 0.01, yend = 0,
               color = rvk::rvk_palettur$value[4],
               show.legend = FALSE) +
  geom_label(x = as.Date("2020-02-11"), y = 0.01, 
             color = rvk::rvk_palettur$value[4], 
             label = "We requested the data",
             show.legend = FALSE) +
  geom_segment(x = as.Date("2021-01-25"), xend = as.Date("2021-01-25"),
               y = 0.01, yend = 0,
               color = rvk::rvk_palettur$value[4],
               show.legend = FALSE) +
  geom_label(x = as.Date("2021-01-25"), y = 0.01, 
             color = rvk::rvk_palettur$value[4],
             label = "We got the data", 
             show.legend = FALSE) +
  labs(y = NULL,
       x = NULL, 
       color = NULL) +
  theme(legend.position = "bottom") +
  scale_color_manual(values = rvk::rvk_palettur$value[c(4, 3)])

ggsave(filename = "timeline_an_rect.png", height = 3, width = 10, dpi = 300)


# Án rect og án emaila ------------------------------------------------------------------------

gogn %>% 
  filter(flag != "email") %>% 
  ggplot(aes(x = dags, y = 0, color = flag)) +
  theme_minimal() +
  geom_point() +
  scale_x_date(date_breaks = "1 month", minor_breaks = NULL, 
               date_labels = "%b %y") +
  scale_y_continuous(breaks = 0, minor_breaks = NULL, labels = NULL) +
  coord_cartesian(xlim = c(as.Date("2020-01-01"), as.Date("2021-02-01")),
                  ylim = c(-0.0125, 0.0125)) +
  geom_vline(xintercept = as.Date("2020-01-01")) +
  geom_vline(xintercept = as.Date("2021-01-01")) +
  geom_segment(x = as.Date("2020-02-11"), xend = as.Date("2020-02-11"),
               y = 0.01, yend = 0,
               color = rvk::rvk_palettur$value[4],
               show.legend = FALSE) +
  geom_label(x = as.Date("2020-02-11"), y = 0.01, 
             color = rvk::rvk_palettur$value[4], 
             label = "We requested the data",
             show.legend = FALSE) +
  geom_segment(x = as.Date("2021-01-25"), xend = as.Date("2021-01-25"),
               y = 0.01, yend = 0,
               color = rvk::rvk_palettur$value[4],
               show.legend = FALSE) +
  geom_label(x = as.Date("2021-01-25"), y = 0.01, 
             color = rvk::rvk_palettur$value[4],
             label = "We got the data", 
             show.legend = FALSE) +
  labs(y = NULL,
       x = NULL, 
       color = NULL) +
  theme(legend.position = "bottom") +
  scale_color_manual(values = rvk::rvk_palettur$value[c(4, 3)])

ggsave(filename = "timeline_an_rect_an_emaila.png", height = 3, width = 10, dpi = 300)
