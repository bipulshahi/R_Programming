df <- read.csv('/Users/bipulkumar/Downloads/ML_Studio/All+Data+Files/Call Center Data.csv')
head(df)

plot(df$Experience.in.months, df$Call.Attended.in.a.day, 
     main = "Call Center Data", xlab = "Experience in months", 
     ylab = "Call Attended in a day")

model1 <- kmeans(df[, c("Experience.in.months", 
                        "Call.Attended.in.a.day")], centers = 4)
df$Label <- model1$cluster

cluster_centers <- data.frame(model1$centers)

# Cluster 2 members
cluster_2_members <- df[df$Label == 2, ]
cluster_2_members

plot(df$Experience.in.months, 
     df$Call.Attended.in.a.day, 
     col = df$Label, 
     main = "Clustered Call Center Data", 
     xlab = "Experience in months", 
     ylab = "Call Attended in a day")
points(cluster_centers$`Experience in months`, cluster_centers$`Call Attended in a day`, col = "red", pch = 4)
