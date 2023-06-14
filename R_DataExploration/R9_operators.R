churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')
churn1


churn1$MonthlyCharges[1] = churn1$MonthlyCharges[1] - 1
churn1$TotalCharges[1] = churn1$TotalCharges[1] + 2

#give a discount of 10% to cell 9of total charges
churn1$TotalCharges[9] = churn1$TotalCharges[9]*0.9

#give a discount of 50% to cell 3 of Monthly charges
churn1$MonthlyCharges[3] = churn1$MonthlyCharges[3]/2


#Relational Operators
#All those customers whose tenure is greater then 60
c_tenure = churn1$tenure > 60
head(c_tenure)

c_tenure_60 = churn1[c_tenure,]
c_tenure_60

#find out all custmers whose monthly charges is less then 30 
#and store in c_monthly_less_30
c_monthly_less= churn1$MonthlyCharges < 30
c_monthly_less_30 = churn1[c_monthly_less,]
head(c_monthly_less_30)


#Logical operators  => & , |
#selecting all customers whose gender is Male and are also senior citizens
c_ms <- churn1$gender == 'Male' & churn1$SeniorCitizen == 1
head(c_ms)

#churn1[cms,]
c_ms_data <- subset(churn1 , c_ms == T)
head(c_ms_data)

#selecting all customers whose Internet service is DSL or Fiber optic
c_dsl_fo = churn1$InternetService=="DSL" | churn1$InternetService=="Fiber optic"
churn1[c_dsl_fo,]

#customers who are not senior citizins
c_not_senior <- churn1$SeniorCitizen ==! 1
c_not_senior <- churn1[c_not_senior,]
head(c_not_senior)



