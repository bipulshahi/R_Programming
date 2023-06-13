#Name a vector

suits = c("spades" , "hearts" , "diamonds" , "clubs")
suits

remain = c(11,12,11,13)
remain

names(remain) = suits
remain

remain_x = c(spades = 11 , hearts = 12 , diamonds = 11 , clubs = 13)
remain_x

remain_y = c("spades" = 11 , "hearts" = 12 , "diamonds" = 11 , "clubs" = 13)
remain_y

val = c(1:9)
val

#Slicing
val[2:6]
remain[1:3]

#length of a vector
length(remain)
length(val)

#Coercion
drawn_ranks = c(7,5,"A",10,"K",3,2,"Q")
drawn_ranks

#Vector Arthematic
#Computations are performed element wise
earnings = c(50,100,30)
earnings * 3
earnings / 3
earnings - 20
earnings + 100
earnings ^ 2

expenses = c(30,40,70)
earnings - expenses

earnings * c(1,2,3)

bank = earnings - expenses
bank
sum(bank)

earnings > expenses

#Subsetting
remain
remain['hearts']

remain_black = remain[c(1,4)]
remain_black 

remain[c("hearts","clubs")]

#Subset all but some
remain
remain[1]
remain[-1]
remain[-2]

remain[-c(1,3)]

remain[-'hearts']     #Invalid argument

#Subset using logical vector
remain[c(F,T,F,T)]

#Recycling
remain[c(T)]
remain[c(T,F)]
remain[c(T,F,F)]


