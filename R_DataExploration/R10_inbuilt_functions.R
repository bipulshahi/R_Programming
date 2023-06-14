#Inbuilt Function
#table()
#head()
#sample()
#str()
#mean()
#range()

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')
head(churn1,12)

tail(churn1,3)      #number of samples from end

nrow(churn1)          #number of samples or rows

ncol(churn1)        #number of columns

mean(churn1$MonthlyCharges)      #Average monthly charges

min(churn1$MonthlyCharges)      #Minimum monthly charges

max(churn1$MonthlyCharges)      #Maximum monthly charges

range(churn1$MonthlyCharges)       #minum & maximum value

#sample() function will allow to random numbers
#here we can pick 5 random values from a column
sample(churn1$customerID, 5)
sample(churn1$customerID, 20)

#table() - it will help us to find distribution of factor colum
table(churn1$gender)

table(churn1$InternetService)


