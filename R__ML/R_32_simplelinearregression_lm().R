#Simple linear Regression

df = read.csv('/Users/bipulkumar/Downloads/Adv.csv')
head(df)

library(ggplot2)
library(caret)
#caret -> createDataPartition , R2

#Split the data into training and test sets
#return indexes of 78% of total data in sales column
train_index = createDataPartition(df$Sales , p = 0.78 , list=FALSE)
#use train_idex to sperate data for training purpose
train_data = df[train_index ,]
test_data = df[-train_index ,]  #test data => the data values are not included in train data


#Simple linear Regression
#fit the linear ression model with one variable (TV)
#lm => linear model => target ~ feature, data
model1 = lm(Sales ~ TV , data = train_data)
summary(model1)

#mean_absolute_error
#predict - model , data value for making prediction
#Predictions on train data
Ytrainpred = predict(model1 , newdata=train_data)
#predictions on test data
Ytestpred = predict(model1 , newdata = test_data)


mae_train = mean(abs(train_data$Sales - Ytrainpred))    #real label - predicted
print(mae_train)
mae_test = mean(abs(test_data$Sales - Ytestpred))    #real label - predicted
print(mae_test)

#Calculating R2 evaluation metrics
#R2(Real value , Predicted value)
r2_score_train = R2(train_data$Sales,Ytrainpred)           #R2 function is present in caret library
print(r2_score_train)

r2_score_test = R2(test_data$Sales,Ytestpred)           #R2 function is present in caret library
print(r2_score_test)


#Suppose tv expense is 65.9 then what will be sales
newdata = data.frame(TV = 65.9)

predict(model1 , newdata = newdata)

#plot the residuals
ggplot(train_data , aes(x = Sales , 
                        y=Ytrainpred)) + geom_point() + ggtitle("Train: Actual vs Predicted")

ggplot(train_data , aes(x=TV , 
                        y=Sales)) + geom_point() + geom_smooth(method = "lm",
                                                               se=FALSE)
