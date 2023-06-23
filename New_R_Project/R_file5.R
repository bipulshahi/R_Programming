#vector :- 1D :- Same Type
#Matrix : - 2D :- Same type
#List :- No Coeicion

v1 <- c("Bipul",12,43.0)
v1
class(v1)
is.vector(l1)

l1 <- list("Bipul",12,43.0)
l1
class(l1)
is.list(l1)

#names :- identifier of any given elements in a list
names(l1) <- c("name","Experence","Salary")
l1

l1['name']
l1$name
l1$Salary

#Name List
details <- list("name" = "Bipul",
                "email" = "bipul@abc.com",
                "contact" = 123456)
details
str(details)

#List with a list
details <- list("name" = "Bipul",
                "email" = "bipul@abc.com",
                "contact" = 123456)

job <- list("Position" = "Software Engineer",
            "Salary" = 56)

details <- list("name" = "Bipul",
                "email" = "bipul@abc.com",
                "contact" = 123456,
                "Job" = job)
details
str(details)
details$Job
details$Job$Position
details$Job$Salary

# [ vs [[
details[1]
details[[1]]

details[c(1,3)]
details[c(1,4)]

#1st element of given list is not having any sub list
details[[c(1,4)]]

details[[4]][[1]]
details[[4]][[2]]

#4th element of the list is having a sub list
details[[c(4,1)]]
details[[c(4,2)]]

#Access the values using name
details['name']
details[['name']]

details[c("name","email")]

#Subset by Logical
details[c(TRUE,FALSE,TRUE,FALSE)]
details[[c(TRUE,FALSE,TRUE,FALSE)]]
details[c(FALSE,FALSE,FALSE,TRUE)][[1]][1]

details[c(TRUE, FALSE, FALSE, TRUE)]

details[2:4]
details[2:4][3]
details[2:4][3][[1]]
details[2:4][3][[1]][1]
details[2:4][3][[1]][2]

#Extending a list

countries <- list("Japan","India","Australia","Singapore","USA")
countries
names(countries) <- c('C1','C2','C3','C4','C5')
countries

l1 <- list('abc','xyz')
l1

countries$C1

countries$K1 <- l1
countries


countries$K1[[1]]
countries$K1[[2]]

