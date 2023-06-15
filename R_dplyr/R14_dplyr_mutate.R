#mutate() - to add a new column info

library(dplyr)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

#Create a age column with value between 16 and 55 in case seniorCitizen value is 0
#else age column can have value between 56 and 100.

churn1 = mutate(churn1, Age=ifelse(SeniorCitizen==0, sample(x=16:55), sample(x=56:100)))
head(churn1)

#customer_category = "Low Paying" if monthlycharges < 45
#customer_category = "Medium Paying" if monthlycharges < 90
#customer_category = "High Paying" if monthlycharges > 90
churn1 = mutate(churn1,Customer_Category=ifelse(MonthlyCharges>90,"High Paying", ifelse(MonthlyCharges<45, "Low Paying", "Medium Paying")))
head(churn1)

#add a column months dividing total charges by monthly charges
round(churn1$TotalCharges/churn1$MonthlyCharges)
mutate(churn1, months = round(churn1$TotalCharges/churn1$MonthlyCharges))

