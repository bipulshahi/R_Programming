#Functions
#Two types - 
#Built in - sq(),mean(),max() etc. , directly call by user
#user defined - When we define our own function

sum(4:6)   #sum is a inbuilt function to sum up given sets of values
max(6:22)
max(c(4,8,2,9,3))
min(6:22)
min(c(4,8,2,9,3))
mean(c(4,8,2,9,3))


#User defined function:-
#f = function(arguments){
  #statement
#}

#create a R function to check whether a given number is even or odd..?
evenodd = function(x){
  if((x %% 2) == 0)
    return ("even")
  else
    return("odd")
}

evenodd(5)
evenodd(6)
evenodd(20)
evenodd(21)

#create a function to add two values
addval = function(x,y){
  return (x + y)
}
addval(4,8)
addval(3,2)

#function to calculate area of a circle
areaofcircle = function(radius){
  area = pi*radius^2
  return(area)
}
areaofcircle(3)
areaofcircle(7)


#length & width >> area and perimeter of a rectangle
#Mutiple inputs and Multiple Outputs
rectangle = function(length,width){
  area = length * width
  perimeter = 2 * (length + width)
  result = list("Area" = area , "Perimeter" = perimeter)
  return (result)
}

rectangle(4,5)
rectangle(7,7)



#Inline function in R
f = function(x) x^2 * 3 + x/2
f(4)
f(5)
f(6)

#Order of Arguments
diffval = function(length=7,width=4){
  diff = length - width
  return (diff)
}

diffval(width = 5,length = 6)
diffval(5,6)
diffval()

#create a function with two arguments a and b to check whether a is divisible by b or not
divisible <- function(a,b){
  if (a %% b == 0){
    return (paste(a , "is divisible by" , b))
  }
  else{
    return(paste(a , "is not divisible by" , b))
  }
}
divisible(7,3)
divisible(10,5)

#function def of dot operator
fun = function(n, ...){
  l <- list(n , ...)
  paste(l)
}

fun(5, 6 , "Hello" , 3+6i , TRUE)

#function passed as argument
fun = function(x , fun2){
  return(fun2(x))
}

fun(c(2:5) , sum)
fun(c(8:19) , mean)

#function which can be applied on collection of values :- vectors,matrices,lists
#lapply() - returns a list
#sapply() - returns a vector or matrix


my.data <- data.frame(data1 = rnorm(10),data2 = rnorm(10), data3 = rnorm(10))
lapply(my.data , sum)

sapply(my.data , sum)





A <- matrix(1:9,nrow = 3)
A

B <- matrix(1:16,nrow = 4)
B


C <- matrix(1:8,nrow = 4)
C

my.list <- list(A=A , B=B , C=C)
my.list

lapply(my.list , "[", ,2)   #to extract 2nd column
lapply(my.list , "[", 2,)  #to extract 2nd row


#create a function to return a output as raised to the given value
#2,3 >> 2^3
#5,2 >> 5^2
#7,4 >> 7^4

power <- function(x,pow){
  return(x^pow)
}

power(3,2)
power(5,3)
power(2:7,2)

#inbuilt plot functions
x <- seq(0,10 , length =100)
x
y <- 3 * x + 4 + rnorm(100)
y
plot(x,y)



