#Create a matrix of size 3,3 and give names to the columns

m1 = matrix(1:9 , nrow=3 , ncol=3)

m1

rownames(m1) <- c("r1","r2","r3")
colnames(m1) <- c("c1","c2","c3")

m1

m2 = matrix(1:9 , nrow=3 , ncol=3 ,
            dimnames = list(c("row1" , "row2" , "row3") , c("col1","col2","col3")))

m2

m3 = matrix(c("a","b","c","d" ,1 ,2,3,4) , nrow=2)
m3

m4 = matrix(list("a","b","c","d" ,1 ,2,3,4) , nrow=2)
m4

#Arrays : - one dimesional
a1 <- c(1:12)
a1

a2 <- array(a1 , dim = c(3,4))
a2

a3 <- array(a1 , dim = c(3,2,2))
a3

a4 <- array(c("a","b","c","d" ,1 ,2,3,4) , dim=c(2,4))
a4

a5 <- array(list("a","b","c","d" ,1 ,2,3,4) , dim=c(2,4))
a5

#Factors
genre <- factor(c("Comedy" , "Action" , "Adventure" , "Action" , "Comedy" , "Adventure" , "Comedy"))
genre

levels(genre)


#we can also set levels by adding levels argument
genre2 <- factor(c("Comedy" , "Action" , "Adventure" , "Action" , "Comedy" , "Adventure" , "Comedy" , "Crime"),
                 levels = c("Comedy" , "Action" , "Adventure" , "Others"))
genre2

levels(genre2)

length(genre)
length(genre2)


#Access a factor
genre[2]
genre2[3]

#Change the value
genre2[3] = "Thriller"
genre2

genre[3] = "Comedy"
genre

genre3 <- factor(c("Comedy" , "Action" , "Adventure" , "Action" , "Comedy" , "Adventure" , "Comedy" , "Crime"),
                 levels = c("Comedy" , "Action" , "Adventure" , "Others" , "Thriller"))
genre3

genre3[5] = "Thriller"
genre3

str(genre)
str(genre2)
str(genre3)

genre
genre2


blood <- c("B" , "AB" , "O" , "A" , "O" , "O" , "A" , "B")
blood_factor <- factor(blood)
blood_factor

levels(blood_factor) <- c("BT_A" , "BT_AB" , "BT_B" , "BT_O")
blood_factor


#labels argument
blood
factor(blood , labels = c("BT_A" , "BT_AB" , "BT_B" , "BT_O"))

#levels function = labels argument
blood <- c("B" , "AB" , "O" , "A" , "O" , "O" , "A" , "B")
blood_factor <- factor(blood)

factor(blood ,
       levels =c("O","A","B","AB"),
       labels =c("BT_O" , "BT_A" , "BT_B" , "BT_AB"))



#Comparasion
tshirt <- c("M" , "S" , "S" , "M" , "L" , "S" , "M" , "L" , "L")
tshirt_factor <- factor(tshirt)
tshirt_factor

tshirt_factor[1] > tshirt_factor[2]

tshirt1 <- c("M" , "S" , "S" , "M" , "L" , "S" , "M" , "L" , "L")
tshirt1_factor <- factor(tshirt1 , ordered=TRUE , levels=c("S" , "M" , "L"))
tshirt_factor
tshirt1_factor[5] > tshirt1_factor[4]



#DAta Frames
name <- c("Anne" , "Pete" , "Frank" , "Julia" , "Cath")
age <- c(28,30,21,39,35)
child <- c(F,T,T,F,T)

df <- data.frame(Name = name,Age = age,Child = child)
df

str(df)

#Subset Data Frame
df[2,2]

df[2,"Age"]

df[2,]

df[,"Age"]

df[c(3,5) ,]

df[c(3,5) , c("Age","Child")]

df[3]

df[2:4 , ]

df$Name
df['Name']
df[1]

#Add columns >>> Add variables
height <- c(163,177,163,166,156)
df$Height <- height
df

weight <- c(74,63,68,55,56)
cbind(df,weight)

#Add rows >> Add Observations
tom <- data.frame(Name = "Tom" , 
                  "Age" = 37 , 
                  "Child" = F , 
                  "Height" = 133)
rbind(df,tom)


#sorting
sort(df$Age)

#ranks
ranks <- order(df$Age)
ranks

df[ranks , ]


df[order(df$Age , decreasing=TRUE) ,]

summary(df)


#Remove any row or column
df[-1,-1]
df[-c(1,3),-c(1,2)]


dim(df)
ncol(df)
nrow(df)
length(df)


#Which data structure will be used to store a dataset?
#Ans .. DataFrame

#Limitations of a dataframe--
#1. Elements in same column should be of same type
#2.All the columns in your dataframe should be of equal length






