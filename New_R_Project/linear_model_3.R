install.packages("devtools")
install.packages("datarium")
library(devtools)
library(datarium)
marketing
plot(marketing)

#Prepration of Linear Model for sales value prediction

#Step 1:- Divide the data into train and validation sets
#75% of total sample size
smp_size <- floor(0.75 * nrow(marketing))
smp_size

#genrate 150 random values between 1 to maximum number of sample i.e.200
set.seed(2)
train_index <- sample(seq_len(nrow(marketing)) , size=smp_size)
train_index

#access 75% of data in training and 25% in testing
train_data = marketing[train_index , ]
test_data = marketing[-train_index , ]


#Create a linear model for sales value prediction
my.model1 <- lm(sales ~ youtube + youtube:facebook , 
                data=train_data)
my.model1

summary(my.model1)

#Validation on training data
ytr <- predict(my.model1 , train_data)
train_mae <- mean(abs(train_data$sales - ytr))
train_mae
plot(train_data$sales,type='l',col='red')
lines(ytr)

#Validation on testing data
yts <- predict(my.model1 , test_data)
test_mae <- mean(abs(test_data$sales - yts))
test_mae
plot(test_data$sales,type='l',col='red')
lines(yts)


#Create a linear model for sales value prediction using only youtube & facebook
#newspaper was less significant shown by P value
my.model2 <- lm(sales ~ youtube + facebook , data=train_data)
my.model2

summary(my.model2)

#Validation on training data
ytr <- predict(my.model2 , train_data)
train_mae <- mean(abs(train_data$sales - ytr))
train_mae
plot(train_data$sales,type='l',col='red')
lines(ytr)

#Validation on testing data
yts <- predict(my.model2 , test_data)
test_mae <- mean(abs(test_data$sales - yts))
test_mae
plot(test_data$sales,type='l',col='red')
lines(yts)

#youtube adv cost >> 56.6
#facebook adv cost >> 65.4
#sales ...?
#my.model2 is trained on only two features so only two features can be used for predictiom
predict(my.model2 , data.frame(youtube=c(56.6),facebook=c(65.4)))
predict(my.model2 , data.frame(youtube=c(34.7),facebook=c(20.9)))

#my.model1 was trained on 3 features so minimum 3 features needed to predict outcome
predict(my.model1 , data.frame(youtube=c(34.7),facebook=c(20.9) , newspaper=c(121)))

