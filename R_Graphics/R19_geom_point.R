library(ggplot2)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

ggplot(data=churn1,aes(y = TotalCharges, x = tenure)) + geom_point()

ggplot(data=churn1,aes(y = TotalCharges, x = tenure)) + geom_point(col="blue")


ggplot(data=churn1,
       aes(y = TotalCharges, x = tenure , col=Partner)) + geom_point()

ggplot(data=churn1,
       aes(y = TotalCharges, x = tenure , col=gender)) + geom_point()

ggplot(data=churn1,
       aes(y = TotalCharges, x = tenure , col=InternetService)) + geom_point()

ggplot(data=churn1,
       aes(y = TotalCharges, x = tenure , col=OnlineSecurity)) + geom_point()


ggplot(data=churn1, aes(y=TotalCharges,
                        x=MonthlyCharges)) + geom_point(col="orange",
                                                        shape=3)

ggplot(data=churn1, aes(y=TotalCharges,
                        x=MonthlyCharges,
                        col=InternetService)) + geom_point()


ggplot(data=churn1, aes(y=TotalCharges,
                        x=MonthlyCharges,
                        col=InternetService,
                        shape=InternetService)) + geom_point()

ggplot(data=churn1, aes(y=TotalCharges,
                        x=MonthlyCharges,
                        col=InternetService,
                        shape=gender)) + geom_point()

ggplot(data=churn1, aes(y=TotalCharges,
                        x=MonthlyCharges,
                        col=InternetService,
                        shape=InternetService,
                        size=InternetService)) + geom_point()

ggplot(data=churn1, aes(y=TotalCharges,
                        x=MonthlyCharges,
                        col=InternetService,
                        shape=gender,
                        size=SeniorCitizen)) + geom_point()

ggplot(data=churn1,aes(y = TotalCharges, 
                       x = tenure)) + geom_point(col="blue") + geom_smooth()

ggplot(data=churn1,aes(y = TotalCharges, 
                       x = MonthlyCharges)) + geom_point() + geom_smooth()

ggplot(data=churn1,aes(y = TotalCharges, 
                       x = MonthlyCharges,
                       col=InternetService)) + geom_point() + geom_smooth()


