library(ggplot2)
library(dplyr)
library(cluster)

df <- data.frame(
  x = c(12, 24, 28, 33, 18, 29, 52, 45, 24, 55, 51, 61, 53, 69, 72, 64, 49, 58),
  y = c(36, 39, 30, 52, 54, 46, 55, 59, 63, 70, 66, 63, 58, 23, 14, 8, 19, 7)
)

model1 <- kmeans(df, centers = 3)
df$label <- model1$cluster

centers <- model1$centers

ggplot(df, aes(x, y, color = factor(label))) +
  geom_point() +
  geom_point(data = data.frame(centers), aes(x, y), color = "red", shape = 4, size = 5) +
  scale_color_discrete(name = "Cluster") +
  theme_minimal()
