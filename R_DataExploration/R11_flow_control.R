#Flow Control
#if
#ifelse
#repeat
#break
#for
#while
#switch
#continue

#Selector Statements =>
#if
#ifelse
#switch

#Looping Statements =>
#repeat
#while
#for

#User defined functions =>
#count
#Minimum
#Maximum

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')
head(churn1,10)

#Check if 1 row gender is Female make it Male
if (churn1$gender[1] == 'Female'){
  churn1$gender[1] = 'Male'
}
head(churn1,2)

#check if 10th row tenure is more then 50 then give 10% discount on Monthly charges
if(churn1$tenure[10] > 50) {
  churn1$MonthlyCharges[10] <- churn1$MonthlyCharges[10]*0.9
}
head(churn1,10)

#Check if 1st customer churn value is "Yes" then ask to give a feeback
#else thanks for using service
if (churn1$Churn[3] == "Yes"){
  print("Please give feeback to improve our service")
}else{
  print("Thanks for using our network")
}

#Switch...
#if customer 5 is using DSL => give a discount of 10%
#if customer 5 is using Fiber Optics => give a discount of 20%
churn1$MonthlyCharges[5] = switch(churn1$InternetService[5],
                                   "DSL" = churn1$MonthlyCharges[5]*0.9,
                                   "Fiber optic" = churn1$MonthlyCharges[5]*0.8)

#=====================Loop====================================
for (i in 1:10){
  print(i)
}

#Create a loop to count all Male customers
male_count = 0
for (i in 1:nrow(churn1)){
  if (churn1$gender[i] == 'Male'){
    male_count = male_count + 1
  }
}
male_count

#if tenure is more then 50 give 10% discount in monthly charges
for (i in 1:nrow(churn1)){
  if(churn1$tenure[i] > 50) {
    churn1$MonthlyCharges[i] <- churn1$MonthlyCharges[i]*0.9
  }
}

#==================================while loop==============================
#number of payments made through electronic check
count_ec = 0
i = 1
while(i <= nrow(churn1)){
  if (churn1$PaymentMethod[i] == "Electronic check"){
    count_ec = count_ec + 1
  }
  i = i + 1
}
count_ec

#User defined functions
sqr = function(x){
  x ** 2
}
sqr(4)


#create a function which can check a parameter passed is a even number or odd number
num_type = function(x){
if (x %% 2 == 1){
    print("Odd")
}else{
    print("Even")
}
}
num_type(7)
num_type(8)


#Number of Online security , Online Back Up & Device Protections are Yes

num_of_yes = function(x){
  count_yes = 0
  for (i in 1:length(x)){
    if (x[i] == 'Yes'){
      count_yes = count_yes + 1
    }
  }
  count_yes
}
num_of_yes(churn1$PhoneService)
num_of_yes(churn1$OnlineSecurity)
num_of_yes(churn1$OnlineBackup)
num_of_yes(churn1$DeviceProtection)

#=========================================================================
myfunc1 = function(x,y){
  print(x + y)
}
myfunc1(5,4)

#Return
myfunc2 = function(x,y){
  x + y
}
myfunc2(5,4)


#Create a function to return number of churn as Yes in case of one-year-contract

oneyearyes = function(contract,churn){
  count = 0
  for (i in 1:length(contract)){
    if (contract[i] == 'One year' & churn[i] == 'Yes'){
      count = count + 1
    }
  }
  count
}
oneyearyes(churn1$Contract,churn1$Churn)



















