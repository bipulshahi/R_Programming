#read the customer churn data

customer_churn = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')
customer_churn

class(customer_churn)

class(customer_churn$tenure)

class(customer_churn$gender)
is.factor(customer_churn$gender)

#conver character column type into factor
customer_churn$gender = as.factor(customer_churn$gender)   
class(customer_churn$gender)

#store a data column info into a variable
c_device_protection = customer_churn$DeviceProtection
head(c_device_protection)

c_payment = customer_churn$PaymentMethod   #info about all payment methods
head(c_payment,10)

#Take gender column out using index
c_gender = customer_churn[,2]
head(c_gender)

#Access 2nd, 6th and 7th column seperately using c (combine) function
c_267 = customer_churn[,c(2,6,7)]
head(c_267)

#Using column names
c_month = customer_churn[,"MonthlyCharges"]
head(c_month)

#To access continous set of columns
c_38 = customer_churn[,3:8]
head(c_38)

#Similary access row with respect to row numbers
customer_churn[2,]                 #2nd row
customer_churn[c(1,50,100),]       #1st, 50th and 100th row
customer_churn[100:120 , ]         #100th to 120th row

#Rows 50 to 60 for 2nd and 3rd column
customer_churn[50:60 , c(2,3)]

customer_churn[c(100:110 , 150:155) , 5:8]





