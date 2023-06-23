library(rpart)
library(rpart.plot)
library(datasets)

# Load the wine dataset
data = read.csv('/Users/bipulkumar/Downloads/wine.csv')
head(data)
dim(data)
# Create a data frame from the dataset
X <- data[, -14]
Y <- data[, 14]

# Split the data into training and testing sets
set.seed(123)
split <- sample.split(Y, SplitRatio = 0.8)
xtrain <- X[split, ]
xtest <- X[!split, ]
ytrain <- Y[split]
ytest <- Y[!split]

# Fit the decision tree models
model1 <- rpart(ytrain ~ ., data = cbind(xtrain, ytrain))
model2 <- rpart(ytrain ~ ., data = cbind(xtrain, ytrain), control = rpart.control(maxdepth = 3))
model3 <- rpart(ytrain ~ ., data = cbind(xtrain, ytrain), control = rpart.control(minsplit = 7))
model4 <- rpart(ytrain ~ ., data = cbind(xtrain, ytrain), control = rpart.control(maxdepth = 3, minsplit = 4))

# Print the accuracy scores
print(paste("Model 4 Training Accuracy:", sum(round(predict(model4, xtrain)) == ytrain) / length(ytrain)))
print(paste("Model 4 Testing Accuracy:", sum(round(predict(model4, xtest)) == ytest) / length(ytest)))

# Plot the decision tree
rpart.plot(model1)
rpart.plot(model2)
rpart.plot(model3)
rpart.plot(model4)
