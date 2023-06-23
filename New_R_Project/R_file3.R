#scaler -> a = 7
#vector -> b = [4,6,7,9] -> 1 Dimensional
#Matrix -> c = [[4,6,7,9] , [3,8,9,5]] -> 2 Dimensional -> Rows and Columns

newmat1 = matrix(1:9 , nrow=3)
newmat1

newmat2 = matrix(1:9 , ncol=3)
newmat2

newmat3 = matrix(1:9 , nrow=3 , byrow=TRUE)
newmat3

#Recycling
newmat4 = matrix(1:3 , nrow=3 , ncol=3)
newmat4

newmat5 = matrix(1:3 , nrow=4 , ncol=4)
newmat5

#Binding :- Column Binding & Row Binding
newmat6 = matrix(1:4 , nrow=2)
newmat6
newmat7 = matrix(5:8 , nrow=2)
newmat7
row_bind = rbind(newmat6 , newmat7)   #rbind :- binds the matrix row wise
row_bind

newmat6 = matrix(1:4 , nrow=2)
newmat6
newmat7 = matrix(5:8 , nrow=2)
newmat7
col_bind = cbind(newmat6 , newmat7)   #cbind :- binds the matrix column wise
col_bind

#Naming of a matrix
newmat6 = matrix(1:4 , nrow=2)

rownames(newmat6) = c("row1" , "row2") #Naming of rows
newmat6

colnames(newmat6) = c("C1" , "C2")      #Naming of columns
newmat6

newmat7 = matrix(5:8 , nrow=2 , 
                 dimnames=list(c("R1","R2"),c("C1","C2")))
newmat7

#Coercion  :- Matrix is homogeneous
newmat8 = matrix(c("A","B","C","D") , nrow=2)
newmat8

newmat9 = rbind(newmat7,newmat8)
newmat9

#Subsetting
newmat9

newmat9[1,1]    #name_of_matrix[row_index,col_index]
newmat9[3,2]

newmat9[3 , ]    #Return 3rd row with all columns

newmat9[ , 2]     #Return 2nd column with all rows

newmat9[3]
newmat9[6]
newmat9[7]

#subset of multiple rows and columns
newmat10 = matrix(1:36 , nrow = 6)
newmat10

newmat10[2 , c(2:4)]
newmat10[2 , c(2,3,4)]

newmat10[2 , c(2:4)]

newmat10[c(2:5),c(2:4)]

#Subset using row names and column names
rownames(newmat10) = c('R1','R2','R3','R4','R5','R6')
colnames(newmat10) = c('C1','C2','C3','C4','C5','C6')
newmat10

newmat10["R2","C3"]
newmat10["R4",]
newmat10[,"C5"]
newmat10[c("R2","R3","R4","R5") , c("C3","C4","C5")]

#Subset using Logical
newmat10
newmat10[c(TRUE,FALSE) , c(FALSE,TRUE)]

newmat10[c(F,F,T,F,F,F) , c(F,F,T,F,F,F)]

#Matrix Arithmetic
m1 = matrix(c(20,30,40) , nrow=3)
m2 = matrix(c(70,80,90) , nrow=3)
m3 = cbind(m1,m2)
colnames(m3) = c('C1','C2')
rownames(m3) = c('R1','R2')
m3

m3 / 2
m3 * 3
m3 + 5
m4 = m3 -7 
m4

m5 = m3 + m4
m5

m6 = matrix(c(5,3,2) , nrow=3)
m6

m5 - m6   #will not operate as shapes of m5 and m6 are different

length(m5)    #number of elements in a matrix
dim(m5)       #dimensions of a matrix
nrow(m5)      #number of row of a matrix
ncol(m5)      #number of columns in a matric
sum(m5)       #sum of all existing value in a matrix
