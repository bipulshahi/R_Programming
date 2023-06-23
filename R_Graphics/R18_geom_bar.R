library(ggplot2)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

ggplot(data=churn1,aes(x=SeniorCitizen)) + geom_bar(fill="aquamarine",
                                                    col="black")

ggplot(data=churn1,aes(x=SeniorCitizen,
                       fill=InternetService)) + geom_bar()

ggplot(data=churn1,aes(x=SeniorCitizen,
                       fill=InternetService)) + geom_bar(position="dodge")

ggplot(data=churn1,aes(x=SeniorCitizen,
                       fill=PaymentMethod)) + geom_bar(position="dodge")

ggplot(data=churn1,aes(x=gender)) + geom_bar()

ggplot(data=churn1,aes(x=gender,fill=gender)) + geom_bar()

ggplot(data=churn1,aes(x=gender)) + geom_bar(fill="aquamarine3",col="black")

#Choice of Internet service with respect to gender 
ggplot(data=churn1,aes(x=gender,
                       fill=InternetService)) + geom_bar(position="dodge")

#Choice of Streaming movies with respect to gender 
ggplot(data=churn1,aes(x=gender,
                       fill=StreamingMovies)) + geom_bar(position="dodge")


ggplot(data=churn1,aes(x=Dependents,fill=DeviceProtection)) + geom_bar(position="dodge")

