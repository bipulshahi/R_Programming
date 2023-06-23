#Data Frame - Data sets
#Observations : - Data Samples or rows
#Data features or properties : - Columns >> variables
#Matrix >> 2 D >> Homogeneous
#List >> 1D >> Heterogeneous
#2D , Heterogeneous  >> Data Frame
#Dataframe :- Elements in any single column will be of same type
#CSV file : - to import a data set
#Relational Database : SQL
#Softwares :- Excel, SPSS etc...

names <- c("John","Bipul","Joy","Ravi","Julie")
age <- c(23,18,16,21,13)
adult <- c(TRUE,FALSE,FALSE,TRUE,FALSE)

df = data.frame(names,age,adult)
df

#names() - can change the column name of a dataframe
names(df) <- c("Names","Ages","Adults")
df

str(df)

df2 <- data.frame(Name = names,Age = age, Adult = adult)
df2

str(df2)

df2['Adult']
df2[c('Name','Age')]

#Insert a new column as Gender
df2['Gender'] <- c('Male','Male','Male','Male','Female')
df2

str(df)
str(df2)

df2$Gender <- factor(df2$Gender)
str(df2)

#Subsetting in a data frame
df2[2]   #will return the 2nd column

df2[2,1]   #df[row,column] :- 2 represents 2nd row & 1 represents 1st value in second row
df2
df2[2,2]
df2[2,3]
df2[2,4]

df2[3,"Gender"]
df2[3 , "Age"]

df2[4, "Name"]

#To access all the values of 3 row
df2[3 , ]
#to access row 1 to 3
df2[1:3 , ]
#To access 1 & 3 row
df2[c(1,3) , ]

df2[c(1,3) , c("Name","Adult")]

df2$Age

df2[['Age']]

df2[[2]]

#Adding a column in a  data frame
df2
df2[['Height']] = c("5'3" , "5'2" , "5'9" , "5'7" , "5'6")
str(df2)

#cbind :- Column bind
df
height <-  c("5'3" , "5'2" , "5'9" , "5'7" , "5'6")
df3 <- cbind(df,height)
str(df3)


#add a new observation i.e adding a new row into the data frame
google <- list("Google", 20 ,"True","5.1")
google

#rbind :- bind information as rows
df4 <- rbind(df3,google)
df4

str(df4)

#Sorting
sort(df4$Ages)   #sort the values in asscending order

order(df4$Ages)  #order will return the index of sorted values in ascending order

#to set the rank as per sorted output
df4$ageRank <- rank(df4$Ages)
df4

#Rearrange whole data as per order
ord <- order(df4$Ages)
ord

df4[ord , ]

df4[order(df4$Ages , decreasing = T), ]

