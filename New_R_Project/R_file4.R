#Factor :- Categorical Values

blood = c("A" , "B" , "AB" , "A" , "AB" , "O" ,"B")
blood

blood_factor = factor(blood)
blood_factor

str(blood)  #Structure of blood vector
str(blood_factor)


#Change the levels 
blood_factor2 = factor(blood , levels = c("O" , "B" , "AB" , "A"))
blood_factor2

str(blood_factor2)

#Renaming the Levels
blood_factor3 = factor(blood)
blood_factor3
levels(blood_factor3) = c("B_A" , "B_AB" , "B_B" , "B_O")
blood_factor3
str(blood_factor3)

blood_factor4 = factor(blood , labels = c("B_A" , "B_AB" , "B_B" , "B_O"))
blood_factor4


#Renaming :using both levels and labels
blood = c("A" , "B" , "AB" , "A" , "AB" , "O" ,"B")
blood_factot5 = factor(blood)
blood_factot5

blood_factor6 = factor(blood , levels=c("A" ,"B" ,"AB","O") , labels=c("BA","BB","BAB","BO"))
blood_factor6

str(blood)
str(blood_factor6)

#Nominal
blood = c("A" , "B" , "AB" , "A" , "AB" , "O" ,"B")
blood_factor5 = factor(blood)
blood_factor5

blood_factor5[4] < blood_factor5[5]

#ordinal
cloths = c("M","L","M","S","L","M","S","S","L")
cloth_factor = factor(cloths , ordered = TRUE , levels=c("S","M","L"))
cloth_factor

cloth_factor[1] < cloth_factor[2]

cloth_factor[5] < cloth_factor[6]
