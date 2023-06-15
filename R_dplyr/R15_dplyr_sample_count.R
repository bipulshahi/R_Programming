#sample_n()
#sample_frac()
#count()

library(dplyr)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

#Select 10 random samples from data
random10 = sample_n(churn1, 10)
random10

random100 = sample_n(churn1, 100)
random100

#random 10% of data
random10percent = sample_frac(churn1,0.1)
random10percent

#random 50% of data
random50percent = sample_frac(churn1,0.5)
random50percent

#Count number of male and female customers
count(churn1,gender)

count(churn1,InternetService)

count(churn1,Contract)

count(churn1,PaperlessBilling)
