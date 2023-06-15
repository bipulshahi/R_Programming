library(ggplot2)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

ggplot(data=churn1,aes(x=SeniorCitizen)) + geom_bar(fill="aquamarine",
                                                    col="black")

ggplot(data=churn1,aes(x=SeniorCitizen,
                       fill=InternetService)) + geom_bar()