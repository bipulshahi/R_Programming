df <- read.csv('/Users/bipulkumar/Downloads/mall.csv')
head(df)

df1 <- df[c('Age', 'Annual.Income..k..', 'Spending.Score..1.100.')]

losses <- vector()
for (k in 1:11) {
  model1 <- kmeans(df1, centers = k)
  losses <- c(losses, model1$tot.withinss)
}

plot(1:11, losses, type = 'b', 
     pch = 16, 
     xlab = "Number of Clusters (k)", 
     ylab = "Total Within-Cluster Sum of Squares")

k_optimal <- 6  # Set the optimal number of clusters based on the elbow curve

model2 <- kmeans(df1, centers = k_optimal)
cluster_centers <- data.frame(model2$centers, Label = 1:k_optimal)

df1$Label <- as.factor(model2$cluster)


library(ggplot2)

ggplot(df1, aes(x = Age, y = Annual.Income..k.., color = Label)) +
  geom_point() +
  geom_point(data = cluster_centers, aes(x = Age, y = `Annual.Income..k..`), color = "red", size = 3, shape = 4) +
  labs(color = "Cluster") +
  theme_minimal()

ggplot(df1, aes(x = Annual.Income..k.., y = Spending.Score..1.100., color = Label)) +
  geom_point() +
  geom_point(data = cluster_centers, aes(x = Annual.Income..k.., y = Spending.Score..1.100.),
             color = "red", size = 3, shape = 4) +
  labs(color = "Cluster") +
  theme_minimal()