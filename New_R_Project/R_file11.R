install.packages('ggplot2')
require(ggplot2)
head(diamonds)

#qplot >> quick plot

#dropped all rows with null values
new_diamonds <- diamonds[complete.cases(diamonds), ]
qplot(carat,price,data=new_diamonds,
      color=cut,
      facets =  ~ clarity,
      main = 'Diamonds',
      log = 'xy')



p <- ggplot(data = new_diamonds)
p <- p + aes(x = carat, y = price)    #Aestetics:- how the data are mapped
p <- p + geom_point(aes(col=cut))    #geom:- Geometric objects>> points,lines, etc..
p <- p + facet_grid(. ~ clarity)
p

p<- ggplot(data = diamonds)
p <- p + aes(x = carat, y = depth)
p <- p + geom_point()
p <- p + geom_density2d()
p

require(ggplot2)
data(mtcars)
summary(mtcars)
head(mtcars)

ggplot(data=mtcars) + aes(x=hp , y = mpg) + 
  geom_point(aes(col=disp))


ggplot(data=mtcars) + 
  aes(x=hp , y = mpg) + 
  geom_point(aes(col=disp , size = wt, shape=factor(cyl)))


ggplot(data=mtcars) + 
  aes(x=hp , y = mpg) + 
  geom_point(aes(col=factor(am) , size = wt, shape=factor(cyl)))


ggplot(data=mtcars) + aes(factor(cyl)) + geom_bar()

ggplot(data=mtcars) + aes(factor(am)) + geom_bar()


ggplot(data=mtcars) + aes(x=hp) + geom_histogram()


ggplot(data=mtcars) + 
  aes(x=hp , y = mpg) + 
  geom_point(aes(col=factor(am) , size = wt, shape=factor(vs))) +
  facet_grid(gear ~ cyl) + 
  theme_gray()

a = c(5,10,34,1) 
order(a) 
a[order(a)]

ggplot(data = mtcars,  aes(x = factor(cyl))) +
  geom_bar(fill="green")





summary(diamonds)
diamonds$depth

depth.groups<-cut(diamonds$depth,breaks=40+(0:5)*8)
depth.groups

ggplot(diamonds) + aes(price , fill=depth.groups) +
  geom_density(alpha=0.3)
  


