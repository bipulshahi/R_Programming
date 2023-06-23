#Data Visualization or Plotting
#ggplot2,ggvis,lattice
#Functions for plotting - plot(), hist()

data()

data(mtcars)         #to access inbuilt dataframe mtcars
head(mtcars , 5)

str(mtcars)

mtcars$cyl <- factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am)
str(mtcars)


plot(mtcars$cyl)    #plot on categorical data

plot(mtcars$hp)     #Plot on numerical data,scatter plot

plot(mtcars$cyl,mtcars$hp)    #plot categorical vs numerical
 
plot(mtcars$hp,mtcars$cyl)    #plot num vs categorica

plot(mtcars$hp,mtcars$disp) #num vs num

plot(mtcars$disp,mtcars$hp)   #num vs num

plot(log(mtcars$disp),log(mtcars$hp))


plot(mtcars$cyl,mtcars$am)   #cat vs categorical
plot(mtcars$am,mtcars$cyl)


#hist() - Histogram >> Visual representation of distribution
hist(mtcars$mpg)
hist(mtcars$disp)
hist(mtcars$hp)
hist(mtcars$wt)
hist(mtcars$qsec)

#Titanic Data Sets
df = read.csv('/Users/bipulkumar/Downloads/Advertising.csv')
head(df)

str(df)
plot(df$TV ,  df$sales , xlab="TV",ylab="sales",
     main = 'Sales vs TV Advertisement',
     col = "red" )

par(col="green")
plot(df$TV ,  df$sales)


#some more parameters
plot(df$TV ,  df$sales , xlab="TV",ylab="sales",
     main = 'Sales vs TV Advertisement',
     col = "red" ,
     col.main = "blue",
     cex.axis=0.9,
     pch = 8,
     )
#type & lty

par(mfrow = c(2,2))
plot(df$TV ,  df$sales , col = "red")
plot(df$radio ,  df$sales , col = "purple")
plot(df$newspaper ,  df$sales , col = "orange")
plot(df$radio ,  df$newspaper , col = "blue")


par(mfcol = c(2,2))
plot(df$TV ,  df$sales , col = "red")
plot(df$radio ,  df$sales , col = "purple")
plot(df$newspaper ,  df$sales , col = "orange")
plot(df$radio ,  df$newspaper , col = "blue")


par(mfcol = c(1,1))
plot(df$TV ,  df$sales , col = "red")



#Layout
grid <- matrix(c(1,2,3,3) , nrow=2,byrow=TRUE)
grid

layout(grid)
plot(df$TV ,  df$sales , col = "red")
plot(df$radio ,  df$sales , col = "purple")
plot(df$newspaper ,  df$sales , col = "orange")

#Reset the grid
layout(1)
par(mfcol = c(1,1))

#reset all our parameters
old_par <- par()
par(col = "red")
plot(df$TV ,  df$sales)
par(old_par)
plot(df$TV ,  df$sales)


ranks <- order(df$sales)
plot(df$TV ,  df$sales,
     pch=18 , col=3,
     xlab='TV-Expenses',
     ylab='Sales')

lm_sales = lm(df$sales ~ df$TV)
abline(coef(lm_sales) , lwd=3)
#lines(df$TV[ranks] , df$sales[ranks])


a <- c(4,7,10,9,5,2,3,8,7)
b <- c(5,7,3,8,4,9,2,1,7)
df1 = data.frame(a,b)
df1
ranks <- order(df1$a)
plot(df1$a ,  df1$b,
     pch=18 , col=3,
     xlab='A',
     ylab='B')
lm_ab = lm(df1$b ~ df1$a)
abline(coef(lm_ab) , lwd=3)
lines(df1$a[ranks] , df1$b[ranks])





install.packages("ggplot2")
require(ggplot2)
data("mtcars")
ggplot(mtcars , aes(cyl)) + geom_bar()
ggplot(mtcars , aes(cyl,mpg)) + geom_point()

data("diamonds")
head(diamonds)
ggplot(diamonds , aes(carat,price)) + geom_point()

