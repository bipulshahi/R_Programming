#creating a file in R

loc <- '/Users/bipulkumar/Documents/R_training_Know_hut/'
file.create(paste(loc , "abc.txt"))

#writing a file
write("Hello, This is R Programming" , paste(loc , "abc.txt"))

#renaming a file
file.rename(paste(loc , "abc.txt") , paste(loc , "xyz.txt"))

if (file.exists(paste(loc , "xyz.txt"))){
  read.delim(paste(loc , "xyz.txt") , header=FALSE)
}else{
  print('File is not existing')
}

list.files(loc)

#create a directory
dir.create(paste(loc,'aaa'))
list.files(loc)

#Copying
file.copy(paste(loc , "xyz.txt") , '/Users/bipulkumar/Documents/')


#creating and reading a table data
write.table(iris[1:10 , ], paste(loc , "mytable.txt"))
new.iris <- read.table(paste(loc , "mytable.txt"))
print(new.iris)


#To choose a specific file and read
myfile <- read.delim(file.choose())
print(myfile)


#To read a text file
library(readr)
mydata = read_tsv(paste(loc , "xyz.txt") , col_names=F)
print(mydata)

mydata = read_lines(paste(loc , "xyz.txt"))
print(mydata)

mydata = read_lines(paste(loc , "xyz.txt") , n_max = 1)
print(mydata)

mydata = read_lines(paste(loc , "xyz.txt") , n_max = 2)
print(mydata)


install.packages("xlsx")
library("xlsx")
write.xlsx(iris[1:10 , ] , paste(loc , "my_iris.xlsx") , sheetName="my_data" , append=FALSE)



