#Interactions

library(devtools)
library(datarium)
marketing
plot(marketing)

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

my.model3 <- lm(sales ~youtube + facebook + youtube:facebook , data=train_data)
my.model3

#Validation on training data
ytr <- predict(my.model3 , train_data)
train_mae <- mean(abs(train_data$sales - ytr))
train_mae
plot(train_data$sales,type='l',col='red')
lines(ytr)

#Validation on testing data
yts <- predict(my.model3 , test_data)
test_mae <- mean(abs(test_data$sales - yts))
test_mae
plot(test_data$sales,type='l',col='red')
lines(yts)

summary(my.model3)

#youtube - 32 , facebook - 12
#sales = b0 + b1x1 + b2x2 + b3x1x2
ss = 7.883 + 0.02086 * 32 + 0.02912 * 12 + 0.0008842 * 32 * 12
ss

#my.model1 was trained on 3 features so minimum 3 features needed to predict outcome
predict(my.model3 , data.frame(youtube=c(32),facebook=c(12)))

