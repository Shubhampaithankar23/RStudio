# Load libraries
library(dplyr)
library(ggplot2)

# Load dataset
data("mtcars")

# Data Manipulation
manipulated_data <- mtcars %>%
  select(mpg, cyl, hp, gear) %>%
  filter(hp > 100) %>%
  mutate(Efficiency = mpg / cyl) %>%
  group_by(gear) %>%
  summarise(
    AVG_MPG = mean(mpg),
    AVG_HP = mean(hp),
    Count = n(),
    .groups = 'drop'
  )

# Visualization 1
ggplot(data = manipulated_data, aes(x = factor(gear), y = AVG_MPG, fill = factor(gear))) +
  geom_bar(stat = "identity") +
  labs(
    title = "Average MPG by Gear",
    x = "Gear",
    y = "Average MPG",
    fill = "Gear"
  ) +
  theme_minimal()

# Visualization 2
ggplot(data = manipulated_data, aes(x = AVG_HP, y = Count, color = factor(gear))) +
  geom_point(size = 4) +
  labs(
    title = "Count of Cars vs. Average HP by Gear",
    x = "Average Horsepower",
    y = "Count",
    color = "Gear"
  ) +
  theme_minimal()
