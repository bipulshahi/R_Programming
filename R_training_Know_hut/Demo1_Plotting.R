#Graphics 
#Create plots with codes
#graphics paclages >> ggplot2, ggvis, lattice
#Functions to plot >> plot(), hist()

plot(1,3)

plot(c(1,8) , c(3,10))

plot(c(1,3,6,7,8) , c(3,5,7,8,10))

x <- c(1,3,6,7,8)
y <- c(3,5,7,8,10)
plot(x,y)

plot(1:9)

#line plot
plot(1:10 , type='l')

#Labels
plot(1:10 , type='l' , main = "Myplot",xlab="X-Axis" , ylab="Y-Axis")


#Apperance
plot(1:10 , col="red")


#size
plot(1:10 , cex=0.5 , col="red")

#Shape : pch >> 0 to 25
plot(1:10 , pch=15 , cex=1)

#Line plot
plot(1:10 , type='l' , lwd=2)

#lty > 0 to 6
plot(1:10 , type='l' , lwd=2 , lty=6)


#Multiple lines plot
line1 <- c(1,2,3,4,5,10)
line2 <- c(2,5,7,8,9,10)

plot(line1 , type='l'  , col='blue')
lines(line2 , type = 'l' , col='red')




