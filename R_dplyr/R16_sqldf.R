#R + sql  = sqldf
#select
#where
#and
#or
#count
#groupby

#import sqldf library
library(sqldf)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

head(churn1)

cid = sqldf("select customerID from churn1")
head(cid)

c_multiple_column = sqldf("select customerID,gender,MonthlyCharges,TotalCharges from churn1")
head(c_multiple_column)

#All information
c_all = sqldf("select * from churn1")
c_all

#Select samples with tenure more then 50
c_high_tenure = sqldf("select * from churn1 where tenure > 50")
head(c_high_tenure)

#select samples od DSL internet service
sqldf("select * from churn1 where InternetService = 'DSL'") -> c_dsl
head(c_dsl)

table(c_dsl$InternetService)

#to access male customers with One year contract
c_m_o = sqldf("select * from churn1 where gender='Male' and Contract='One year'")
head(c_m_o)

#access sample with senior citizen 1, internet service 'fiber optic' and techsupport yes
c_2 = sqldf("select * from churn1 where SeniorCitizen=1 and TechSupport='Yes' and InternetService='Fiber optic'")
head(c_2)

#acess sample with either one year or two year contract
c_3 = sqldf("select * from churn1 where Contract='One year' or Contract='Two year'")
head(c_3)

#access customer with either electronic check or mailed check payment method
c_4 = sqldf("select * from churn1 where PaymentMethod='Electronic check' or PaymentMethod='Mailed check'")
head(c_4)

#query to count sample in female category
sqldf("select count(gender) from churn1 where gender = 'Female'")

#query to count sample in male category
sqldf("select count(gender) from churn1 where gender = 'Male'")


#average tenure of each type of payment method
sqldf("select avg(tenure) from churn1")
sqldf("select avg(tenure),PaymentMethod from churn1 group by PaymentMethod")

#average monthly charges for each type of contract
sqldf("select avg(MonthlyCharges), Contract from churn1 group by Contract")



