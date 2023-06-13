mat1 = matrix(1:6 , nrow=2 , ncol=3)
mat1

mat2 = matrix(1:3 , nrow=2 , ncol=3)
mat2

mat3 = matrix(1:3 , nrow=2 , ncol=4)
mat3

mat4 = matrix(1:4 , nrow=2 , ncol=3)
mat4

cbind(1:3,1:3)   #column bind
rbind(1:3,1:3)   #row bind

m = matrix(1:6 , nrow = 2)
m

n = matrix((7:12) , nrow = 2)
n

mn_c = cbind(m,n)
mn_c
mn_r = rbind(m,n)
mn_r

#Naming a matrix => rownames() , colnames()

m = matrix(1:6 , nrow = 2)
m

rownames(m) = c('r1' , 'r2')    #naming rows
m

colnames(m) = c('c1','c2','c3')    #naming columns
m

k = matrix(11:22 , nrow = 3,
           dimnames = list(c('r1','r2','r3') ,
                           c('c1','c2','c3','c4')))
k

#Coercion
num = matrix(1:8 , ncol=2)
char = matrix(LETTERS[1:6] , nrow = 4 , ncol = 3)
num
char

cbind(num,char)

#Subsetting in Matrix

m = matrix(sample(1:20 , 12), nrow=3)   #sample() is a inbuilt function, 12 random values between 1 & 20
m

m[1,3]

#Subset column or  a row
m[3,]           #3rd row
m[,3]            #3rd column
m[4]              #4th value in the collection

#subset mutiple elements
m[2, c(2,3)]       #2nd row , 2nd and 3rd column
m[c(1,2) , c(2,3)]
m[c(1,3) , c(1,3,4)]


#subset by name
rownames(m) = c("r1","r2","r3")
colnames(m) = c("a","b","c","d")
m

m[2,2]
m[2,'b']
m['r2',2]
m['r2','b']

#subset with logical vector
m[c(F,F,T), ]     #3rd row
m[ ,c(F,T,F,F)]    #2nd column

m[c(F,T,F) , c(F,F,T,F)]

m > 15
m[m > 15]

#Matrix Arithmetic
#colSums() , rowSums()
#standard arithmetic possible
#Element-wise computation

the_fellowship = c(316,556)
two_towers = c(343,584)
return_king = c(378,742)

lotr_matrix = rbind(the_fellowship,two_towers,return_king)
lotr_matrix

colnames(lotr_matrix) = c("US" , "non-US")
rownames(lotr_matrix) = c("Fellowship" , "Two Towers" , "Return King")
lotr_matrix

lotr_matrix/1.12

lotr_matrix - 50

theater_cut = matrix(c(50,80,100,40,20,70) , nrow=3 , ncol=2)
theater_cut

lotr_matrix - theater_cut

#Recycling
lotr_matrix - c(50,80,100)

#Matrix Multiplication
rates = matrix(c(1.11,0.99,0.82,0.70,0.80,0.90) , nrow=3)
rates

lotr_matrix * rates

#Matrix & Vectors
#Vector = 1D, Matrix = 2D
#Coercion if necessary
#Recycling if necessary
#Elementwise calculations


