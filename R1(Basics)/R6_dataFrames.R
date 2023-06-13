#Data Frames

name = c("Anne" , "Pete" , "Frank" , "Julia" , "Cath")
age = c(28,30,21,39,35)
child = c(F,T,T,F,T)

df = data.frame(name,age,child)
df

df = data.frame(Name = name, Age = age , Child = child)
df

str(df)


#Age value of 3rd person
df[3,2]

#Sample in 3rd Row
df[3,]

#Information in Age column
df[,"Age"]
df[,2]

#Age and child information of 3rd and 5th Person
df[c(3,5),c("Age" , "Child")]
df[c(3,5),c(2,3)]

#Accessing 2nd column using index location
df[2]
df$Age
df["Age"]
