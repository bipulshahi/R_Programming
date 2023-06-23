library(ggplot2)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

churn1$SeniorCitizen = as.factor(churn1$SeniorCitizen)
ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = SeniorCitizen)) + geom_boxplot(fill="palegreen",
                                                           outlier.color = "orange")

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = SeniorCitizen)) + geom_boxplot(fill="palegreen",
                                                           outlier.color = "orange",
                                                           outlier.shape = 3)

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = Dependents)) + geom_boxplot()

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = Dependents)) + geom_boxplot(fill="yellowgreen")

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = InternetService)) + geom_boxplot(fill="violetred")

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = PaymentMethod)) + geom_boxplot(fill="tomato3")

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = PaymentMethod,
                        fill=gender)) + geom_boxplot()

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = PaymentMethod,
                        fill=PaperlessBilling)) + geom_boxplot()

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = PaymentMethod,
                        fill=Churn)) + geom_boxplot()

ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = PaymentMethod,
                        fill=TechSupport)) + geom_boxplot()


ggplot(data=churn1, aes(y = MonthlyCharges,
                        x = PaymentMethod,
                        fill=InternetService)) + geom_boxplot()
