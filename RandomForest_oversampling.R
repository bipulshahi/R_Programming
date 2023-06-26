library(rpart)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')
head(churn1,10)

churn1 = churn1[,-1]     #removing Id column from the data

#Seperate the data into Churn and non-Churn
churn_data = churn1[churn1$Churn == "Yes" , ]
non_churn_data = churn1[churn1$Churn == "No" , ]

#Over sampling ratio
oversampling_ratio =nrow(non_churn_data)/nrow(churn_data)

k = sample(1:nrow(churn_data) , nrow(churn_data)*oversampling_ratio ,
           replace = TRUE)
oversampled_churn_data = churn_data[k,]

oversampled_data = rbind(oversampled_churn_data,non_churn_data)
table(oversampled_data$Churn)

set.seed(77)
split = sample.split(oversampled_data$Churn , SplitRatio = 0.70)
train_data = oversampled_data[split,]
test_data = oversampled_data[!split,]

model4 = rpart(Churn~. , data = train_data)

rpart.plot(model4)

train_acc = sum(round(predict(model4,train_data)[,2]) == ifelse(train_data$Churn == "Yes" , 1 , 0))/length(train_data$Churn)
print(train_acc)

test_acc = sum(round(predict(model4,test_data)[,2]) == ifelse(test_data$Churn == "Yes" , 1 , 0))/length(test_data$Churn)
print(test_acc)

table(train_data$Churn , round(predict(model4,train_data)[,2]))

table(test_data$Churn , round(predict(model4,test_data)[,2]))



