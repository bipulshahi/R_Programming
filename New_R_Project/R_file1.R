#Declare a variable
#Variable >> value which can be reused for n number of times

height = 4
width = 8

print(height)
print(width)

area = height * width
print(area)

print(ls())    #to list out all existing variable

rm(area)     #to remove an existing variable

print(ls())
print(area)


#Types of Data

name = "Bipul"    #character
age = 33          #Number
married = TRUE    #Logical

class(name)
class(age)
class(married)

#to validate the types of data
print(is.numeric(name))
print(is.numeric(age))
print(is.numeric(married))

print(is.character(name))
print(is.character(age))
print(is.character(married))

print(is.logical(name))
print(is.logical(age))
print(is.logical(married))

#to convert the data type
as.numeric("55")
as.character(55)

as.numeric(TRUE)
as.character(TRUE)
as.numeric(FALSE)
as.character(FALSE)

as.numeric("Bipul")


