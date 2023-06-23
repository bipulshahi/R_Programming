#ggplot2
install.packages("ggplot2")
library(ggplot2)

data(iris)

head(iris)

factor(iris$Species)

str(iris)

Irisplot = ggplot(iris , aes(Sepal.Length , Petal.Length)) + geom_point(aes(colour=Species))
print(Irisplot + labs(y = "Petal Length" , x="sepel_length")) + ggtitle("Petel vs sepel")

#add text
Irisplot + annotate("text" , x=6 , y=5 , label="text1")

#add repeat
Irisplot + annotate("text" , x=4:6 , y=5:7 , label="text2")


#highlight an area
Irisplot + annotate("rect" , xmin=5 , xmax=7 , ymin=4 , ymax=6 ,
                    alpha=0.5)

#segment
Irisplot + annotate("segment" , x=5 , xend=7 , y=4 , yend=5 ,
                    colour="black")



#Legends
Irisplot = ggplot(iris , aes(Sepal.Length , Petal.Length)) + geom_point(aes(colour=Species))
print(Irisplot)

#theme function for styling
Irisplot + theme(legend.position = "none")
Irisplot + theme(legend.title = element_blank())
Irisplot + theme(legend.position = "top")
Irisplot + theme(legend.position = "bottom")

Irisplot + theme(legend.title = element_text(colour="blue" , size=10 , face="bold"))


ggplot(iris , aes(Sepal.Length , Petal.Length)) + 
  geom_point(aes(colour=Species) , shape=1) + 
  geom_smooth(method=lm)


ggplot(iris , aes(Sepal.Length , Petal.Length)) + 
  geom_point(aes(colour=Species) , shape=1) + 
  geom_smooth(method=lm , se=FALSE)


#jitter plot
ggplot(iris , aes(Sepal.Length , Petal.Length)) + 
  geom_point() + 
  geom_jitter(aes(colour=Species))


#---------------------bar_plot------------------------------#
data(mtcars)
str(mtcars)

#data(mpg)
head(mpg)
help(mpg)

p <- ggplot(mpg , aes(x=factor(cyl))) + 
  geom_bar(stat="count")
p

#---------------------histogram_plot------------------------------#
p <- ggplot(mpg , aes(x=hwy)) + 
  geom_histogram(col="red" , fill="green" , alpha=0.3 , binwidth=5)
p

#---------------------Stacked bar plot------------------------------#
p <- ggplot(mpg , aes(x=class,fill=drv)) + geom_bar() 
p

#------------------------pie chart----------------------------------#
#frequency table
table(mpg$class)

df <- as.data.frame(table(mpg$class))
colnames(df) = c("class","freq")
df


pie <- ggplot(df , aes(x = "", y = freq , fill = factor(class))) +
  geom_bar(width=1 , stat = "identity") +
  theme(plot.title = element_text(hjust=0.5)) +
  labs(title="PieChart of class" , x=NULL,y=NULL,
       caption="Source: mpg")

pie

pie + coord_polar()

pie + coord_polar(theta = "y" , start=0)


#------------------------Marginal Plots------------------------#
install.packages("ggExtra")
library(ggExtra)

g <- ggplot(mpg , aes(cty , hwy)) + 
  geom_point() + 
  geom_smooth(method="lm" , se=F)
g

ggMarginal(g , type="histogram")
ggMarginal(g , type="boxplot")

#----------------------------------------------------------------#

g <- ggplot(mpg , aes(cty , hwy)) + 
  geom_count() + 
  geom_smooth(method="lm" , se=F)
g

ggMarginal(g , type="histogram")
ggMarginal(g , type="boxplot")

#----------------------Bubble Chart & Count Chart------------------------------------------#

p <- ggplot(mpg , aes(x = factor(cyl))) + geom_bar(stat="count")
p

ggplot(mpg, aes(x=cty,y=hwy,size = displ)) + geom_point()


