library(readr)    
library(tidyr)     
library(ggplot2)   

data <- read.csv("C:/Users/이보나/Downloads/before_after_long.csv")

data_ <- pivot_wider(data, names_from = time, values_from = value)

head(data_)

shapiro.test(data_$t_after - data_$t_before)

t.test(data_$t_before, data_$t_after, paired = TRUE)

ggplot(data, aes(x = time, y = value, group = ID)) +
  geom_line(aes(color = ID), linewidth = 1) +
  geom_point(size = 2) +
  theme_minimal() +
  labs(title = "Before and After Line Plot", x = "Time", y = "Value")
