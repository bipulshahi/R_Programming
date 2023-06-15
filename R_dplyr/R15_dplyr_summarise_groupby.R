#summarise()
#groupby()

library(dplyr)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

#Average tenure
summarise(churn1,mean_tenure = mean(tenure))
summarise(churn1,min_tenure = min(tenure))
summarise(churn1,max_tenure = max(tenure))

summarise(churn1,max_MC = max(MonthlyCharges))
summarise(churn1,min_MC = min(MonthlyCharges))
summarize(churn1,mean_MC = mean(MonthlyCharges))

summarise(churn1,max_TC = max(TotalCharges))
summarise(churn1,min_TC = min(TotalCharges))
summarize(churn1,mean_TC = mean(TotalCharges))

#Total charges column is having some null values so use na.rm=T to ignore them
summarise(churn1,max_TC = max(TotalCharges,na.rm=T))
summarise(churn1,min_TC = min(TotalCharges,na.rm=T))
summarize(churn1,mean_TC = mean(TotalCharges,na.rm=T))

#Average tenure of DSL,Fiber Optic & No internet service
summarise(group_by(churn1,InternetService),mean_tenure=mean(tenure))

#Average monthly charges for customer with Partner and without partner
summarize(group_by(churn1,Partner), mean_MC = mean(MonthlyCharges))


#Average monthly charges of DSL,Fiber Optic & No internet service
summarize(group_by(churn1,InternetService), mean_MC = mean(MonthlyCharges))

summarize(group_by(churn1,InternetService), min_MC = min(MonthlyCharges))

summarize(group_by(churn1,InternetService), max_MC = max(MonthlyCharges))

