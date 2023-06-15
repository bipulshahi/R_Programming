#filter()

library(dplyr)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

#Filter all female customers
c_female = filter(churn1, gender == "Female")
head(c_female)

#filter all data samples with Monthly charges more then 100
c_high_paying_customers = filter(churn1, MonthlyCharges > 100)
head(c_high_paying_customers)

#female custmers paying more then 100
c_h_f = filter(churn1, MonthlyCharges > 100 & gender == 'Female')
head(c_h_f)

#samples with StreamingTV & streamingMovies are "Yes"
c_t_m = filter(churn1, StreamingTV == "Yes" & StreamingMovies == "Yes")
head(c_t_m)

#One year contract of DSL Type service with tenure more then 50..?
c_tic = filter(churn1,Contract == "One year" & InternetService == "DSL" & tenure >50)
head(c_tic)

#Customer paying as Electronic check or Mailed check
c_pay = filter(churn1, PaymentMethod == "Electronic check" | PaymentMethod == "Mailed check")
head(c_pay)

#Female costomer with One year or two year contract
c_con_gen = filter(churn1,gender == "Female" & (Contract == "One year" | Contract == "Two year"))
head(c_con_gen)

#DSL or Fiber Optic customer paying more then 100 as monthly charges 
#and having tenure more then 50

c_complicated = filter(churn1,(InternetService == "DSL" | InternetService == "Fiber optic") & (MonthlyCharges > 100 & tenure>50))
head(c_complicated)










