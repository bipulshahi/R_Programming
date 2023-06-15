#pipe operator - for combining different functions 

#select <====>  filter  <====> summarise

# %>%

library(dplyr)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

c_15 = churn1 %>% select(1:5)
c_15

#combine select & filter function
#1st 5 columns of male customers
c15_male = churn1 %>% select(1:5) %>% filter(gender == "Male")
head(c15_male)

#Average monthly charges paid by male & female for DSL InternetService

churn1 %>% filter(InternetService=="DSL") %>% group_by(gender) %>% summarise(mean_mc=mean(MonthlyCharges))

churn1 %>% select(1,2,"MonthlyCharges","PaymentMethod") %>% filter(gender == "Male" & MonthlyCharges>100)

#Average tenure of each payment method
churn1 %>% group_by(PaymentMethod) %>% summarize(mean_tenure= mean(tenure))

churn1 %>% group_by(PaymentMethod) %>% summarize(mean_tenure= mean(tenure)) %>% arrange(desc(PaymentMethod))
churn1 %>% group_by(PaymentMethod) %>% summarize(mean_tenure= mean(tenure)) %>% arrange(desc(mean_tenure))

#Select first two columns and 10 to 21 column for One year and two year contract
#arrannge() will put the things in ascending order => using desc() => we can arrange in descending order
c_ot = churn1 %>% select(1,2,10:21) %>% filter(Contract== "One year" | Contract == "Two year") %>% arrange(Contract)
c_ot

#Average tenure of different types of techsupport in case of paperbilling is yes
churn1 %>% group_by(TechSupport) %>% filter(PaperlessBilling == "No") %>% summarize(mean_tenure = mean(tenure))

