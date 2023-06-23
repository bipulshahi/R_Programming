
df <- read.csv('/Users/bipulkumar/Downloads/Country-data.xls')
head(df)

df1 <- df[, -1]

losses <- vector()
for (i in 1:11) {
  model <- kmeans(df1, centers = i)
  losses <- c(losses, model$tot.withinss)
}

plot(1:11, losses, type = 'b', pch = 16, xlab = "Number of Clusters (k)", ylab = "Total Within-Cluster Sum of Squares")

k_optimal <- 3  # Set the optimal number of clusters based on the elbow curve

model1 <- kmeans(df1, centers = k_optimal)
cluster_centers <- data.frame(model1$centers)

df$labels <- as.factor(model1$cluster)

cluster0 <- df[df$labels == 1, ]

cluster0$country

nrow(cluster0)

### 4 clusters ###

df2 <- df[, -1]

model2 <- kmeans(df2, centers = 4)
cluster_centers2 <- data.frame(model2$centers)

df$clusters <- as.factor(model2$cluster)

c0 <- df[df$clusters == 1, ]

c0$country

nrow(c0)
