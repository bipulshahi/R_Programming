library(plotly)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

head(churn1)

plot_ly(data = churn1 , x=~InternetService)

plot_ly(data = churn1 , x=~InternetService , color = ~InternetService)

plot_ly(data = churn1 , x=~InternetService , color = ~gender)

plot_ly(data = churn1 , x=~InternetService , color = ~Contract)

plot_ly(data=churn1,y=~TotalCharges,x=~tenure,
        color = ~InternetService)

plot_ly(data=churn1,y=~TotalCharges,x=~tenure,
        mode="markers",
        color = ~InternetService)

plot_ly(data=churn1 , y=~MonthlyCharges , x=~InternetService, type="box")

plot_ly(data=churn1 , y=~MonthlyCharges , x=~InternetService, type="box",
        color = ~InternetService)

plot_ly(data=churn1 , x = ~MonthlyCharges , type="histogram",
        color=~SeniorCitizen)

plot_ly(data=churn1 , x = ~MonthlyCharges , type="histogram",
        color=~gender)

plot_ly(data=churn1 , x = ~MonthlyCharges , type="histogram",
        color=~Partner)

