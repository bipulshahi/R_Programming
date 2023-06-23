#Vector -- an array of multiple values

countries <- c('Japan','Russia','France','Germany','Italy')
countries

class(countries)

is.character(countries)
is.vector(countries)

countries[1]
countries[2]
countries[3]

#vector with numeric values
myval = c(11,15,17,19,20)
myval

#Manual addressing of array elements
#names is function to assign some defined address to values in a vector
#Elements in the array countries becomes addresses for elements of myval
names(myval) <- countries
myval
myval["France"]
myval[3]


newarr1 <- c(spades=10 , diamonds=11 , hearts=12 , clubs=9)
newarr1
newarr1["hearts"]

newarr2 <- c("spades"=10 , "diamonds"=11 , "hearts"=12 , "clubs"=9)
newarr2
newarr2["clubs"]

#Structure of vector
str(myval)
str(newarr1)
str(newarr2)

#length of an existing vector
length(myval)
length(newarr1)
length(newarr2)


#Vectors are homogeneous in nature
newarr3 <- c(3,5,"A",8,"B",7,6,"C")
newarr3

#Arithmetic Operations
a = 5
a * 3

newarr4 = c(40,60,80)
newarr4 * 2
newarr4 + 20
newarr4 - 10
newarr4 / 2
newarr4 ^ 3

newarr4 = c(40,60,80)
newarr5 = c(3,5,7)
newarr4 + newarr5
newarr4 * newarr5
newarr4 / newarr5
newarr4 - newarr5
newarr4 ^ newarr5

#sum function
sum(newarr4)
sum(newarr5)

#comparasion operator
x = 17
y = 5
x > y
x < y
x >= y
x <= y
x == y
x != y

#Subsetting
newarr1 <- c(spades=10 , diamonds=11 , hearts=12 , clubs=9)
newarr1

newarr1[2]        #create subset using index
newarr1["hearts"]  #create a subset usinh name

#Subset of Multiple Elements
newarr1[c(2,4)]
newarr1[c("diamonds","clubs")]

newarr1[-2] 
newarr1[-c(2,4)]
newarr1[c(-2,-4)]

newarr1[-"hearts"]  #invalid way to pick some elements by removing any of them


#Subset using Logical vector
newarr1 <- c(spades=10 , diamonds=11 , hearts=12 , clubs=9)
newarr1

newarr1[c(FALSE,TRUE,FALSE,FALSE)]
newarr1[c(FALSE,TRUE,FALSE,TRUE)]
newarr1[c(T,F,T,F)]

newarr1
newarr1[c(FALSE,TRUE)]

newarr1[c(FALSE,TRUE,TRUE)]

newarr1[c(FALSE,TRUE,FALSE)]




