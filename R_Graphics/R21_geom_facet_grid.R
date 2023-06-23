#facet_grid()

library(ggplot2)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

g1 = ggplot(data=churn1,aes(x=tenure,fill=InternetService)) + geom_histogram()
g1 + facet_grid(~InternetService)


g2 = ggplot(data=churn1,aes(x=PaymentMethod,fill=Contract)) + geom_bar()
g2 + facet_grid(~Contract)


g3 = ggplot(data=churn1,aes(x=Contract,fill=PaymentMethod)) + geom_bar()
g3 + facet_grid(~PaymentMethod)

#point plot => total charges vs tenure and facet with respect to Contract
#use smoothing as well
g4 = ggplot(data=churn1, aes(y=TotalCharges, x=tenure,
                             col=Contract)) + geom_point() + geom_smooth(col="black")
g4 + facet_grid(~Contract)


#box plot for Monthly charges vs Payment method 
#and facet grid and color with respect to Internet service
g5 = ggplot(data=churn1, aes(y=MonthlyCharges, x=PaymentMethod, 
                             fill=PaymentMethod)) + geom_boxplot()
g5 + facet_grid(~InternetService)

g5 = ggplot(data=churn1, aes(y=MonthlyCharges, x=PaymentMethod, 
                             fill=InternetService)) + geom_boxplot()
g5 + facet_grid(~InternetService)


