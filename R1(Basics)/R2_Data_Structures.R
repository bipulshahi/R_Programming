#Data Structures

#vector => Set of homogeneous, linear objects
#List => set of hetrogeneous , linear objects
#Matrix => set of homogenous, 2-dimensional objects
#Array => set of homogenous, multi-dimensional objects

#vector => Set of homogeneous, linear objects

drawn_suits = c("hearts" , "spades" , "diamonds" , "ace" , "Monkey")
drawn_suits
class(drawn_suits)
is.character(drawn_suits)
is.vector(drawn_suits)

remain = c(11,12,14,18)
remain
class(remain)
is.numeric(remain)
is.vector(remain)

logit = c(TRUE,FALSE,T,T,F,F)
logit
class(logit)
is.logical(logit)
is.vector(logit)

vec = c(11,'Hello',T)
vec
class(vec)
is.vector(vec)
is.character(vec)
is.numeric(vec)
is.logical(vec)

#List => set of hetrogeneous , linear objects
mixbag = list(120,"Hello",FALSE)
mixbag
class(mixbag)
mixbag[[1]]
mixbag[[2]]
mixbag[[3]]
class(mixbag[[1]])
class(mixbag[[2]])
class(mixbag[[3]])

#Matrix => set of homogenous, 2-dimensional objects
numbers = c(1:9)
numbers
mat1 = matrix(data = numbers , nrow = 3 , ncol = 3)
mat1

mat2 = matrix(data = numbers , nrow = 3 , ncol = 3 , byrow=T)
mat2

mat2 = matrix(data = numbers , nrow = 3 , ncol = 3 , bycol=T)
mat2

alpha = c('a' ,'b' ,'c' , 'd' , 'e' , 'f')
mat_alpha = matrix(alpha , nrow = 2 , ncol = 3 , byrow=T)
mat_alpha

mat_alpha[2,2]
mat_alpha[1,2]

mat3 = matrix(c(1,2,3,4,5,6) , 2 , 3)
mat3

#Array => set of homogenous, multi-dimensional objects
num1 = c(1:9)
num2 = c(10:18)

array1 = array(data=c(num1,num2) , dim=c(3,3,2))
array1

array1[3,1,2]      #array[row position,column position,layer position]
array1[3,1,1]

array1[,,1]           #all values in 1st Layer
