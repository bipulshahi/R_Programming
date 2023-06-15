#Geom_Histogram

library(ggplot2)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

ggplot(data=churn1,aes(x=tenure)) + geom_histogram()

ggplot(data=churn1,aes(x=tenure)) + geom_histogram(bins=50,fill="green")


ggplot(data=churn1,aes(x=tenure)) + geom_histogram(fill="green",col="blue")


ggplot(data=churn1,aes(x=tenure, fill=Partner)) + geom_histogram()


ggplot(data=churn1,aes(x=tenure, fill=Partner)) + geom_histogram(position = "identity")

ggplot(data=churn1,aes(x=tenure, fill=OnlineSecurity)) + geom_histogram(position = "identity")


ggplot(data=churn1,aes(x=tenure, fill=Contract)) + geom_histogram(position = "identity")

ggplot(data=churn1,aes(x=tenure, fill=Churn)) + geom_histogram(position = "identity")


ggplot(data=churn1,aes(x=MonthlyCharges, 
                       fill=Contract)) + geom_histogram(position = "identity")

ggplot(data=churn1,aes(x=MonthlyCharges, 
                       fill=Contract)) + geom_histogram(bins=50)

ggplot(data=churn1,aes(x=MonthlyCharges, 
                       fill=Contract)) + geom_histogram(fill="coral",
                                                        col="red")

ggplot(data=churn1,aes(x=MonthlyCharges, 
                       fill=PhoneService)) + geom_histogram()

ggplot(data=churn1,aes(x=MonthlyCharges, 
                       fill=InternetService)) + geom_histogram()

ggplot(data=churn1,aes(x=MonthlyCharges, 
                       fill=StreamingTV)) + geom_histogram()

ggplot(data=churn1,aes(x=TotalCharges)) + geom_histogram()

ggplot(data=churn1,aes(x=TotalCharges)) + geom_histogram(bins=50)

ggplot(data=churn1,aes(x=TotalCharges)) + geom_histogram(fill="cyan",
                                                         col="gold")

ggplot(data=churn1,aes(x=TotalCharges,
                       fill=DeviceProtection)) + geom_histogram()


