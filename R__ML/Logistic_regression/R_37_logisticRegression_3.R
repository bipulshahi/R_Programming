churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

churn1$Churn = ifelse(churn1$Churn == "Yes" , 1 , 0)
View(churn1)

library(caTools)

split = sample.split(churn1$Churn,SplitRatio = 0.75)

train = churn1[split,]   #=> xtrain, ytrain
test = churn1[!split,]   #=> xtest, ytest

nrow(train)
nrow(test)

model_log1 = glm(Churn~gender+Partner+InternetService+MonthlyCharges , data=train,
                family = "binomial")

summary(model_log1)

result_log_train = predict(model_log1, newdata=train,type="response")
result_log_test = predict(model_log1, newdata=test,type="response")

result_log_train
result_log_test

range(result_log_train)
range(result_log_test)

table(train$Churn , result_log_train > 0.5)
table(test$Churn , result_log_test > 0.5)

table(train$Churn , result_log_train > 0.29)
table(test$Churn , result_log_test > 0.29)

#overall accuracy
train_accuracy = (2720+957)/(2720+957+1160+445)

print(train_accuracy)
train_accuracy_0 = 2720/(2720+1160)
train_accuracy_1 = 957/(957+445)
print(train_accuracy_1)
print(train_accuracy_0)

test_accuracy = (889+308)/(889+308+405+159)
print(test_accuracy)
test_accuracy_0 = 889/(889+405)
test_accuracy_1 = 308/(308+159) 
print(test_accuracy_0)
print(test_accuracy_1)


#PaymentMethod,techsupport,tenure,paperlessbilling
