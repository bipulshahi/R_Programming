#install.packages("dplyr")

library(dplyr)

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

#select() - to select a column 
c2 = select(churn1,2)        #select 2nd column
head(c2)

c6 = select(churn1,6)
head(c6)

c_bunch = select(churn1,1,4,7,11)
head(c_bunch)

c_5_10 = select(churn1,5:10)
c_5_10

c_gender = select(churn1,gender)
head(c_gender)

c_partner = select(churn1,Partner)
c_partner

#gender, partner , tenure
c_gpt = select(churn1,gender,Partner,tenure)
head(c_gpt)

#access all columns from gender to contract
c_gender_contract = select(churn1,gender:Contract)
head(c_gender_contract)

#Select all columns with word "Stream"
c_stream = select(churn1 , starts_with("Stream"))
head(c_stream)

#ends_with => Monthly Charges & Total charges
c_charges = select(churn1, ends_with("Charges"))
head(c_charges)



