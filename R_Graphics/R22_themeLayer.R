#theme layer
#panel background
#plot background
#plot title

library(ggplot2)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

g1 = ggplot(data=churn1, aes(x=tenure)) + geom_histogram(fill="tomato3",
                                                    col="mediumaquamarine")

#labels
g2 = g1+labs(title = "Distribution of tenure")
g3 = g2 + theme(panel.background = element_rect(fill="purple"))
g4 = g3 + theme(plot.background = element_rect(fill="orange"))
g4 + theme(plot.title = element_text(hjust=0.5 , face="bold",
                                     colour = "white"))


#Line plot
t1 = ggplot(data=churn1,aes(y=TotalCharges,x=tenure,
                            col=InternetService)) + geom_smooth()
t2 = t1 + labs(title = "Total charges vs Tenure",x="Tenure",y="Total Charges")
t3 = t2 + theme(panel.background = element_rect(fill="thistle"))
t4 = t3 + theme(plot.title = element_text(hjust=0.5, face = "italic",
                                          colour = "purple"))
t4 + theme(plot.background = element_rect(fill="tomato"))

                                     










