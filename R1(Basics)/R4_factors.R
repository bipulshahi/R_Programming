#Factors
#Categorical Variables
#Limited number of different values
#Belong to Category

#Create a factor
blood = c("B","AB","O","A","O","O","A","B")
blood

blood_factor = factor(blood)
blood_factor

str(blood_factor)

blood_factor2 = factor(blood , 
                       levels = c("O" , "A" , "B" , "AB"))  #levels - define structure of our choice
blood_factor2

str(blood_factor2)

#Rename factor lavels
blood_factor
levels(blood_factor) = c("BT_A","BT_AB","BT_B","BT_O")
blood_factor

blood = c("B","AB","O","A","O","O","A","B")
blood_factor = factor(blood , labels = c("BT_A","BT_AB","BT_B","BT_O"))
blood_factor


#Rename factor levels
blood = c("B","AB","O","A","O","O","A","B")
blood_factor = factor(blood,levels=c("O" , "A" , "B" , "AB"),
                      labels = c("BT_O","BT_A","BT_B","BT_AB"))
blood_factor



#Nominal versus Ordinal
5 < 9
"A" < "D"
"A" > "D"

blood = c("B","AB","O","A","O","O","A","B")
blood_factor = factor(blood)
blood_factor[1] < blood_factor[4]

tshirt = c("M" , "L" , "S" , "S" , "L" , "M" , "L" , "M")
tshirt[1] < tshirt[2]

#Ordered Factor
tshirt_factor = factor(tshirt , ordered = TRUE,
                       levels = c("S" , "M" , "L"))
tshirt_factor
tshirt_factor[1] < tshirt_factor[2]
tshirt_factor[2] < tshirt_factor[3]
tshirt_factor[2] > tshirt_factor[3]

#Conclusion
#Factors for categorical values
#Factors are integer vectors
#change factor levels
#levels() function & labels argument
#ordered factors : ordered = TRUE



