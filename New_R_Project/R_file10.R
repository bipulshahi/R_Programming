#Loop while loop

i = 0

i == 0
i > -1
i < 5
i < -1
i > 7

while (TRUE){
  print('Hello')
}


i = 0
while (i < 10){
  cat(i , 'Hello' , '\n')
  i = i + 1
}

#Break
i = 0
while (TRUE){
  cat(i , 'Hello World' , '\n')
  i = i + 1
  if (i == 7){
    break
  }
}

i = 0
while (i < 20){
  cat(i , 'Hello World' , '\n')
  i = i + 1
  if (i == 7){
    break
  }
}


#next :- skip the operation of a given condition
i = 0
while(i < 10){
  i = i + 1
  if (i == 5){
    next
  }
  cat(i , 'Hello World' , '\n')
}


#conditions :- If Else...

if (TRUE){
  print("if part will execute as condition in if is true")
}else{
  print("It will not execute")
}

if (FALSE){
  print("This will not execute")
}else{
  print("Else part will execute as condition in if is false")
}


#WAP for login activity
#i.e. if entered login and password is correct then print successfull login
#else wrong credentials

name = readline(prompt = "Enter your name")

print(name)

a = readline(prompt = "Enter 1st number")
b = readline(prompt = "Enter 2nd number")

c = as.integer(a) + as.integer(b)
print(c)

username = readline(prompt = "Enter User name")
userpass = readline(prompt = "Enter User Password")

if ((username == 'abcde') && (userpass == '12345')){
  print('Successfull login')
}else{
  print('Wrong credentials')
}


#WAP to identify even numbers between 1 to 10
for (i in 1:10){
  if (i %% 2 == 0){
    cat(i , 'is Even', '\n')
  }else{
    cat(i , 'is Odd', '\n')
  }
}

#loop :- repeat 
i = 0
repeat{
  print('Hello World')
  i = i+1
  if (i == 7){
    break
  }
}
  

#selection of person without blue or yellow eyes
eye.colors <- c("brown","blue","green","yellow","grey")
eyecolor <- data.frame(personId = 1:100 , 
                       color = sample(eye.colors,100,rep=T))
eyecolor
i = 0
list.of.ids = numeric(0)
repeat{
  i = i + 1
  if (eyecolor$color[i] == "yellow" | eyecolor$color[i] == "blue"){
    next
  }else{
    list.of.ids = c(list.of.ids,eyecolor$personId[i])
  }
  if (i == 100 | length(list.of.ids) == 20){
    break
  }
}
list.of.ids



#when amount of data is large loops increase the run time
y = matrix(rnorm(1000000),nrow=1000)
z = 0*y
time1 = as.numeric(Sys.time())

for (i in 1:1000){
  for(j in 1:1000){
    z[i,j] <- y[i,j]^2
  }
}
time2 = as.numeric(Sys.time())
z = y^2
time3 = as.numeric(Sys.time())

(time2 - time1) / (time3 - time2)



#Switch case
a = 17
b = 5
operation = "sub"
result = switch(
  operation,
  "sum" = a + b,
  "mul" = a * b,
  "div" = a / b,
  "sub" = a - b,
)
result



my.norm <- function(x) {
  return ((x - mean(x))/sd(x))
}

v = c(5,6,2,8,9,4)
my.norm(v)


funct1 <- function(x){
  m = x/2 
  return (3 * sin(m) + x)
}
funct1(0)
funct1(1)
funct1(pi)

#WAP to plot the function f over the interval of -7 to 7
funct1(-7:7)

plot(funct1(-7:7) , type='o')

curve(funct1, -7 , 7)

plot(funct1,-7,7)





# 'A_a' 'A_b' 'A_c' 'B_a' 'B_b' 'B_c' 'C_a' 'C_b' 'C_c'
LETTERS
letters
LETTERS[7]
letters[9]

paste(LETTERS[9] , letters[9] , sep='_')

for (i in 1:3){
  for (j in 1:3){
    print(paste(i,j,sep='_'))
  }
}


for (i in 1:3){
  for (j in 1:3){
    print(paste(LETTERS[i],letters[j],sep='_'))
  }
}


l1 <- list()
for (i in 1:3){
  for (j in 1:3){
    l1 <- c(l1 , paste(LETTERS[i],letters[j],sep='_'))
  }
}
l1

for (a in LETTERS[1:3]){
  for (b in letters[1:3]){
    print(paste(a,'_',b))
  }
}

#plots
x <- rnorm(1000)
y <- rnorm(1000)
x
y

plot(x,y)
abline(h =  1,col='red',lty='dashed',lwd = 5)
abline(h =  -1,col = 'green',lwd = 5)
abline(v =  1 , col = 'darkblue',lwd = 5)
abline(v =  -1 , col='yellow',lty='dashed',lwd = 5)

abline(a =-1 , b = 0.7 , lwd=3)


#Barplot
values <- c(0.4,0.5,0.75,0.2,0.6)
barplot(values , col='red',horiz=T)

group <- letters[1:5]
group
barplot(values , col='blue',names.arg = group)


#Stacked barplot
data <- data.frame(A=c(0.2,0.4),
                   B=c(0.3,0.1),
                   C=c(0.7,0.1),
                   D=c(0.1,0.2),
                   E=c(0.3,0.3))

rownames(data) <- c("G1","G2")
data
as.matrix(data)
barplot(as.matrix(data) , col = c("green","blue"))
legend("topright" , legend=c("G1","G2"),fill=c("green","blue"))



barplot(as.matrix(data) , col = c("green","blue") , beside=T)
legend("topright" , legend=c("G1","G2"),fill=c("green","blue"))


values <- c(0.4,0.5,0.75,0.2,0.6)
pie(values , labels = c("A","B","C","D","E"), 
         edges = 200, radius = 0.8)
