#Plot
#bar plot
#histogram
#density plot

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

churn1$gender = as.factor(churn1$gender)
plot(churn1$gender)

churn1$Dependents = as.factor(churn1$Dependents)
plot(churn1$Dependents,col="coral",xlab="Dependents",
     main="Distribution of Dependents")


churn1$PhoneService = as.factor(churn1$PhoneService)
plot(churn1$PhoneService,col="aquamarine4",
     xlab = "PhoneService",
     main = "Distribution of PhoneService")



#Internet service
churn1$InternetService = as.factor(churn1$InternetService)
plot(churn1$InternetService, col='orange',
     xlab= "InternetService",
     main = "Distribution of Internet Service")


#Contract
churn1$Contract = as.factor(churn1$Contract)
plot(churn1$Contract, col='green3',
     xlab= "Contract",
     main = "Distribution of Contract")


#histogram
hist(churn1$tenure,col="olivedrab",breaks=30)

hist(churn1$MonthlyCharges,col="pink",breaks=50)

#Density plot
plot(density(churn1$tenure),col='blue')

plot(density(churn1$MonthlyCharges),col='blue')







