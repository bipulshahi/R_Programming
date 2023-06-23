churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')
head(churn1,10)

#Using ifelse function => conver Yes into 1 and No into 0 i.e binomial conversion
churn1$Churn = ifelse(churn1$Churn == "Yes" , 1 , 0)
View(churn1)

#dplyr package
#library(dplyr)
#churn1 %>% mutate(Churn = if_else(Churn == "Yes" , 1 , 0))

#logistic Regression for churn CLassification
#generalized linear model - function used for logistic regression

#Create a model to predict churn using monthly charges
log_model1 = glm(Churn~MonthlyCharges , data = churn1 , family = "binomial")
summary(log_model1)

#Predict
#Using type = "response" returns the predicted probabilities instead of the predicted classes
predict(log_model1, data.frame(MonthlyCharges=50) , type="response")

predict(log_model1, data.frame(MonthlyCharges=70) , type="response")

predict(log_model1, data.frame(MonthlyCharges=20:100) , type="response")

predict(log_model1, data.frame(MonthlyCharges=150) , type = "response")

#type = "link", which is default one alse, returns the predicted values as the log odds or 
#logit of the predicted probabailites
predict(log_model1, data.frame(MonthlyCharges=150) , type = "response") 

#predict(log_model1, data.frame(MonthlyCharges=150) , type = "terms") 

#Create a model using Churn and tenure
log_model2 = glm(Churn~tenure, data = churn1 , family = "binomial")
summary(log_model2)


predict(log_model2, data.frame(tenure=10) , type="response")
predict(log_model2, data.frame(tenure=10:70) , type="response")

