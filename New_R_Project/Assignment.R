install.packages("s20x")
install.packages("leaps")
install.packages("lattice")

options(rgl.useNULL = TRUE)

install.packages("R330")
library(R330)
data(wine.df)
head(wine.df)

#1. We shall regress price on year, temp, h.rain and w.rain with the lm() function. 
#Allow for an interaction between h.rain and w.rain. 
#What is Adjusted R-squared of the model?

my.model = lm(price ~ year + temp + h.rain + w.rain + h.rain:w.rain , wine.df)
summary(my.model)


#2. Reduce the model with drop1(), removing statistically insignificant explanatory variables from the model (if any),
#testing at the 5% level.What can you say about the significance of the variables?
drop1(my.model,test='F')

#3. Now, if the rain over the winter is equal to 800mm, what is the regression coefficient to h.rain?
coef(my.model)[4]+800*coef(my.model)[6]


#4. Predict the price of a Bordeaux vintage in 1985 with the predict() function, 
#if the temperature and precipitation in the harvest period and the preceding winter have values 
#equal to the averages from the wine.df dataset, disregarding variation of the estimator.
#What is the value of price predicted using the model?

newds = data.frame(year=1985 , temp = mean(wine.df$temp) , h.rain = mean(wine.df$h.rain) , w.rain = mean(wine.df$w.rain))
predict(my.model,newds)

#5. Now regress log(price) (rather than price itself) on year, temp, h.rain and w.rain with the lm() function. 
#Again, allow for an interaction between h.rain and w.rain.What is Adjusted R-squared of the model?
my.modellog = lm(log(price) ~ year + temp + h.rain + w.rain + h.rain:w.rain , wine.df)
summary(my.modellog)

#6. Reduce the model with drop1(), removing statistically insignificant explanatory variables from the model (if any), 
#testing at the 5% level.What can you say about the significance of the variables?
drop1(my.modellog,test='F') 

#7.What is Adjusted R-squared of the updated model?
my.modellog = update(my.modellog , ~.-h.rain:w.rain)
summary(my.modellog)


#8. Predict the price of a Bordeaux vintage in 1985 with the predict() function, 
#if the temperature and precipitation in the harvest period and the preceding winter have values 
#equal to the averages from the wine.df dataset, disregarding variation of the estimator.
#What is the value of price predicted using the model?
newds2 = data.frame(year=1985 , temp = mean(wine.df$temp) , h.rain = mean(wine.df$h.rain) , w.rain = mean(wine.df$w.rain))
exp(predict(my.modellog,newds2))

#9. 


#10. Consider the airquality dataset. Which two commands you could use to generate histograms of the Temp data?
data(airquality)
head(airquality)

hist(airquality$Temp ,data=airquality, breaks=10)

library(ggplot2)
par(mfrow=c(1,1))
qplot(Temp , data=airquality , binwidth=5)









  
  