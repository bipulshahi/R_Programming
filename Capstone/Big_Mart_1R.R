library(dplyr)

# Read the dataset
df <- read.csv("/Users/bipulkumar/Downloads/Big_Mart_Sales_Figure.csv")

head(df)

dim(df)

str(df)

# Check for missing values
colSums(is.na(df))

colSums(df == 0)

colSums(df2 == "")
# Extract the first two characters from Item_Identifier
df$Item_Identifier <- substr(df$Item_Identifier, 1, 2)

length(unique(df$Item_Identifier))

fix_item_iden <- function(x) {
  return(substr(x, 1, 2))
}

fix_item_iden("NCD19")

df$Item_Identifier <- sapply(df$Item_Identifier, fix_item_iden)

length(unique(df$Item_Identifier))
unique(df$Item_Identifier)

table(df$Item_Identifier)

unique(df$Item_Fat_Content)

# Standardize Item_Fat_Content
df$Item_Fat_Content <- ifelse(df$Item_Fat_Content %in% c("Low Fat", "low fat", "LF"), "lf", "reg")

unique(df$Item_Fat_Content)

# Explore Item_Type column
unique(df$Item_Type)

table(df$Item_Type)

unique(df$Outlet_Identifier)
nchar(df$Outlet_Identifier)

substr(df$Outlet_Identifier, 5, nchar(df$Outlet_Identifier))

# Extract the numeric part from Outlet_Identifier
df$Outlet_Identifier <- as.numeric(substr(df$Outlet_Identifier, 5, nchar(df$Outlet_Identifier)))

head(df)

# Convert Outlet_Establishment_Year to the number of years since establishment
df$Outlet_Establishment_Year <- 2022 - df$Outlet_Establishment_Year

head(df)

unique(df$Outlet_Size)

unique(df$Outlet_Location_Type)

unique(df$Outlet_Type)

table(df$Outlet_Size)
table(df$Outlet_Location_Type)
table(df$Outlet_Type)

colSums(is.na(df))
sum(is.na(df$Item_Weight))

aggregate(Item_Weight ~ Item_Identifier, data = df, FUN = mean, na.rm = TRUE)
# Fix missing values in Item_Weight column
avg_it_wt <- tapply(df$Item_Weight, df$Item_Identifier, mean, na.rm = TRUE)
avg_it_wt

fix_item_weight <- function(x) {
  return(ifelse(is.na(x), round(avg_it_wt[as.character(df$Item_Identifier)]), x))
}

df$Item_Weight <- fix_item_weight(df$Item_Weight)
colSums(is.na(df))


# Separate non-consumable items and fix Item_Fat_Content
dfnc <- df[df$Item_Identifier == "NC", ]
dfdr <- df[df$Item_Identifier != "NC", ]

dfnc$Item_Fat_Content <- gsub("lf", "nc", dfnc$Item_Fat_Content)

df2 <- rbind(dfnc, dfdr)

head(df2)

sum(is.na(df2$Outlet_Size))
sum(is.na(df2))

barplot(table(df2$Item_Identifier))

hist(df2$Item_Weight)

barplot(table(df2$Item_Fat_Content))

hist(df2$Item_Visibility)

boxplot(df2$Item_Visibility, 
        main = "Boxplot of Item Visibility",
        ylab = "Item Visibility")

barplot(table(df2$Outlet_Size))
table(df2$Outlet_Size)


excluded_outlet_sizes <- c("High", "Medium", "Small")

# Filter the data samples excluding the specified outlet sizes
filtered_df <- df2[!df2$Outlet_Size %in% excluded_outlet_sizes,]
View(filtered_df)

str(df2)
sum(df2$Outlet_Size == "")

colSums(df2 == "")

outlet_size_counts <- table(df$Outlet_Type, df$Outlet_Size)
outlet_size_counts

df2s0 <- df2[(df2$Outlet_Size == ""), ]
df2s1 <- df2[!(df2$Outlet_Size == ""), ]

fix_outlet_size <- function(x) {
  return(ifelse(x %in% c("Grocery Store", "Supermarket Type1"), "Small", "Medium"))
}

df2s0$Outlet_Size <- fix_outlet_size(df2s0$Outlet_Type)
df3 <- rbind(df2s0, df2s1)

sum(is.na(df3))
colSums(df3 == "")

barplot(table(df3$Outlet_Size))

m <- mean(df3$Item_Visibility)
s <- sd(df3$Item_Visibility)
df3 <- subset(df3, Item_Visibility <= m + 2 * s & Item_Visibility >= m - 2 * s)

hist(df3$Item_Visibility)
boxplot(df3$Item_Visibility, 
        main = "Boxplot of Item Visibility",
        ylab = "Item Visibility")

barplot(table(df3$Item_Type))

hist(df3$Item_MRP)

barplot(table(df3$Outlet_Identifier))

barplot(table(df3$Outlet_Establishment_Year))

barplot(table(df3$Outlet_Size))

barplot(table(df3$Outlet_Location_Type))

barplot(table(df3$Outlet_Type))

hist(df3$Item_Outlet_Sales)

# Convert Item_Outlet_Sales to log scale
df3$Item_Outlet_Sales <- log(df3$Item_Outlet_Sales)

# Create dummy variables for categorical features
# Convert non-numerical columns to factors
df3$Item_Identifier <- as.factor(df3$Item_Identifier)
df3$Item_Fat_Content <- as.factor(df3$Item_Fat_Content)
df3$Item_Type <- as.factor(df3$Item_Type)
df3$Outlet_Size <- as.factor(df3$Outlet_Size)
df3$Outlet_Location_Type <- as.factor(df3$Outlet_Location_Type)
df3$Outlet_Type <- as.factor(df3$Outlet_Type)

# Perform one-hot encoding using model.matrix
df4 <- model.matrix(~.-1, data = df3)
View(df4)


# Separate features and labels
X <- df4[, -which(colnames(df4) == "Item_Outlet_Sales")]
Y <- df4[, which(colnames(df4) == "Item_Outlet_Sales")]

library(caTools)
# Split data into training and testing sets
set.seed(42)
split <- sample.split(Y, SplitRatio = 0.8)
xtrain <- X[split, ]
xtest <- X[!split, ]
ytrain <- Y[split]
ytest <- Y[!split]

# Create a linear regression model and evaluate
lm_model <- lm(ytrain ~ ., data = data.frame(xtrain, ytrain))

summary(lm_model)

ypred_train <- predict(lm_model, newdata = data.frame(xtrain))
ypred_test <- predict(lm_model, newdata = data.frame(xtest))

mae_train <- mean(abs(ytrain - ypred_train))
print(mae_train)

mae_test <- mean(abs(ytest - ypred_test))
print(mae_test)

# Prediction
input <- rep(0, ncol(xtrain))
names(input) <- colnames(xtrain)
input

ii <- "Item_IdentifierNC"
input[which(names(input) == ii)] <- 1
input

iw <- 20.5
iv <- 0.032835
im <- 40.2822
oi <- 45
oey <- 20

ifc <- "Item_Fat_Contentnc"
it <- "Item_TypeHousehold"
os <- "Outlet_SizeSmall"
olt <- "Outlet_Location_TypeTier 2"
ot <- "Outlet_TypeSupermarket Type1"

input["Item_Weight"] <- iw
input["Item_Visibility"] <- iv
input["Item_MRP"] <- im
input["Outlet_Identifier"] <- oi
input["Outlet_Establishment_Year"] <- oey

input[which(names(input) == ifc)] <- 1
input[which(names(input) == it)] <- 1
input[which(names(input) == os)] <- 1
input[which(names(input) == olt)] <- 1
input[which(names(input) == ot)] <- 1

print(input)

predicted_sales <- exp(predict(lm_model, newdata = data.frame(t(input))))
print(predicted_sales)

