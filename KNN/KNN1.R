#install.packages("kknn")
#library(kknn)
library(caret)
# Load the iris dataset
data(iris)

# Create a dataframe for the features
X <- as.data.frame(iris$Sepal.Length)
X <- cbind(X, iris$Sepal.Width)
X <- cbind(X, iris$Petal.Length)
X <- cbind(X, iris$Petal.Width)

# Create a vector for the labels
Y <- iris$Species

# K-Nearest Neighbors

# Predict the species of a new flower
flower <- c(3.2, 2.2, 2.5, 1.9)

# Calculate the Euclidean distances
dis <- sqrt((X$`iris$Sepal.Length` - flower[1])^2 + (X$`iris$Sepal.Width` - flower[2])^2 + (X$`iris$Petal.Length` - flower[3])^2 + (X$`iris$Petal.Width` - flower[4])^2)
dis

# Add distances and species to the dataframe
X$distances <- dis
X$Species <- Y

# Sort the dataframe by distances
X <- X[order(X$distances), ]

# Get the species counts of the nearest neighbors
nearest_species <- head(X, 5)$Species
species_counts <- table(nearest_species)

# Predicted species of the new flower
predicted_species <- names(species_counts)[which.max(species_counts)]
predicted_species

# Scikit-Learn Algorithm for KNN

library(caret)
library(e1071)
library(reshape2)

# Load iris dataset
data(iris)

# Split the data into features (X) and labels (Y)
X <- iris[, 1:4]
Y <- iris[, 5]

# Split the data into training and testing sets
set.seed(3)
train_indices <- createDataPartition(Y, p = 0.75, list = FALSE)
xtrain <- X[train_indices, ]
xtest <- X[-train_indices, ]
ytrain <- Y[train_indices]
ytest <- Y[-train_indices]

# Train KNN model
model1 <- train(x = xtrain, y = ytrain, method = "knn",
                tuneGrid = data.frame(k = 5))

# Evaluate the model
predicted_species1 <- predict(model1, newdata = xtrain)
predicted_species1
train_accuracy = sum(predicted_species1 == ytrain)/length(ytrain)
print(train_accuracy)

predicted_species2 <- predict(model1, newdata = xtest)
predicted_species2
test_accuracy = sum(predicted_species2 == ytest)/length(ytest)
print(test_accuracy)


# Confusion matrix
confusionMatrix(data = predict(model1, xtrain), reference = ytrain)
confusionMatrix(data = predict(model1, xtest), reference = ytest)

# Tuning of number of neighbors
accuracy_train <- c()
accuracy_test <- c()

for (k in 1:12) {
  model <- train(x = xtrain, y = ytrain, method = "knn", tuneGrid = data.frame(k = k))
  predicted_species1 <- predict(model1, newdata = xtrain)
  predicted_species1
  train_accuracy = sum(predicted_species1 == ytrain)/length(ytrain)
  accuracy_train <- c(accuracy_train, train_accuracy)
  
  predicted_species2 <- predict(model1, newdata = xtest)
  predicted_species2
  test_accuracy = sum(predicted_species2 == ytest)/length(ytest)
  accuracy_test <- c(accuracy_test, test_accuracy)
}

print("Accuracy scores (train):")
print(accuracy_train)
print("Accuracy scores (test):")
print(accuracy_test)

# Plotting accuracy scores
plot(1:12, accuracy_train, type = "l", col = "blue", xlab = "Number of neighbors (k)", ylab = "Accuracy", ylim = c(0, 1))
lines(1:12, accuracy_test, type = "l", col = "red")
legend("topright", legend = c("Training", "Testing"), col = c("blue", "red"), lty = 1)


install.packages("GGally")
library(GGally)

# Create a new dataframe with labels
X_new <- X
X_new$Labels <- Y

# Generate pairplot
ggpairs(X_new, columns = 1:4, aes(color = Labels))


# Feature Selection
xt <- subset(X, select = c("Petal.Length", "Petal.Width"))
yt <- Y


# Split the data into training and testing sets
set.seed(0)
train_indices <- createDataPartition(yt, p = 0.75, list = FALSE)
xtrainS <- xt[train_indices, ]
xtestS <- xt[-train_indices, ]
ytrainS <- yt[train_indices]
ytestS <- yt[-train_indices]

# Tuning of number of neighbors for feature-selected data
accuracy_train <- c()
accuracy_test <- c()

for (k in 1:12) {
  model <- train(x = xtrainS, y = ytrainS, method = "knn", tuneGrid = data.frame(k = k))
  predicted_species1 <- predict(model, newdata = xtrainS)
  predicted_species1
  train_accuracy = sum(predicted_species1 == ytrainS)/length(ytrainS)
  accuracy_train <- c(accuracy_train, train_accuracy)
  
  predicted_species2 <- predict(model, newdata = xtestS)
  predicted_species2
  test_accuracy = sum(predicted_species2 == ytestS)/length(ytestS)
  accuracy_test <- c(accuracy_test, test_accuracy)
}

plot(1:12, accuracy_train, type = "l", col = "blue", xlab = "Number of neighbors (k)", ylab = "Accuracy", ylim = c(0, 1))
lines(1:12, accuracy_test, type = "l", col = "red")
legend("topright", legend = c("Training", "Testing"), col = c("blue", "red"), lty = 1)

model4 <- train(x = xtrainS, y = ytrainS, method = "knn", tuneGrid = data.frame(k = 3))

predicted_species1 <- predict(model4, newdata = xtrainS)
predicted_species1
train_accuracy = sum(predicted_species1 == ytrainS)/length(ytrainS)
print(train_accuracy)

predicted_species2 <- predict(model4, newdata = xtestS)
predicted_species2
test_accuracy = sum(predicted_species2 == ytestS)/length(ytestS)
print(test_accuracy)

# Make predictions
sl <- 3.3
sw <- 3.9
pl <- 4.4
pw <- 4.3

new_data <- data.frame(Sepel.Length = sl,
                       Sepel.Width = sw,
                       Petal.Length = pl, 
                       Petal.Width = pw)
predicted_species <- predict(model1, newdata = new_data)
print("Prediction using model1:")
print(predicted_species)

new_data <- data.frame(Petal.Length = pl, Petal.Width = pw)
predicted_species <- predict(model4, newdata = new_data)
print("Prediction using model4:")
print(predicted_species)
