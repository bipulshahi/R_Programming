#Create a model using TV , Radio & Newspaper 
#and give evaluation metrices

#Multiple Linear Regression

df = read.csv('/Users/bipulkumar/Downloads/Adv.csv')
head(df)

library(ggplot2)
library(caret)

#Split the data into training and test sets
#return indexes of 78% of total data in sales column
train_index = createDataPartition(df$Sales , p = 0.78 , list=FALSE)
#use train_idex to sperate data for training purpose
train_data = df[train_index ,]
test_data = df[-train_index ,]  #test data => the data values are not included in train data

model2 = lm(Sales ~ TV+Radio+Newspaper, data=train_data)
summary(model2)

Ytrainpred = predict(model2 , newdata=train_data)
#predictions on test data
Ytestpred = predict(model2 , newdata = test_data)


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
