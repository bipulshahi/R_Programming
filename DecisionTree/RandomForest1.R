library(randomForest)

# Load the wine dataset
data = read.csv('/Users/bipulkumar/Downloads/wine.csv')
head(data)
dim(data)
# Create a data frame from the dataset
X <- data[, -14]
Y <- data[, 14]

colSums(is.na(data))
# Split the data into training and testing sets
set.seed(123)
split <- sample.split(Y, SplitRatio = 0.8)
xtrain <- X[split, ]
xtest <- X[!split, ]
ytrain <- Y[split]
ytest <- Y[!split]

# Decision Tree Classifier
library(rpart)


dmodel <- rpart(ytrain ~ ., data = cbind(xtrain, ytrain), 
                control = rpart.control(maxdepth = 3 , minsplit = 5))

# Print the accuracy scores
print(paste("dmodel Training Accuracy:", sum(round(predict(dmodel, xtrain)) == ytrain) / length(ytrain)))
print(paste("dmodel Testing Accuracy:", sum(round(predict(dmodel, xtest)) == ytest) / length(ytest)))

# Random Forest Classifier
rmodel <- randomForest(x = xtrain, y = ytrain, ntree = 100, maxdepth = 2)

print(paste("Training accuracy:", sum(round(predict(rmodel, xtrain)) == ytrain) / length(ytrain)))
print(paste("Testing accuracy:", sum(round(predict(rmodel, xtest)) == ytest) / length(ytest)))

# Making Predictions
sample_data <- as.matrix(xtest[2, ])
print(round(predict(rmodel, sample_data)))
ytest[2]
