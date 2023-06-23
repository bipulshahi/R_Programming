#Sales, Salary, Height

data = data.frame(weight = c(0.9,1.8,2.4,3.5,3.9,4.4,5.1,5.6,6.3),
                  size = c(1.4,2.6,1.0,3.7,5.5,3.2,3.0,4.9,6.3))
data
head(data)

require(ggplot2)
ggplot(data) + aes(data$weight , data$size) + geom_point()

#Create a linear Line on given Data
# y = b0 + b1 * x
b0 = 1
b1 = 0.3
xt = as.vector(data$weight)
yt = b0 + b1 * xt
yt
ggplot(data) + aes(data$weight , data$size) + geom_point() +
  geom_line(aes(xt,yt) , col="red")


plot(data$weight , data$size)
lines(xt,yt,col='red')

#Create a best fit linear line
#least square method :- best fit line on a given data passes through the mean value
mean_x = mean(data$weight)
mean_x
mean_y = mean(data$size)
mean_y
ggplot(data , aes(data$weight , data$size)) + 
  geom_point(col="blue") + geom_point(aes(mean_x,mean_y) , col="darkgreen") + 
  geom_line(aes(xt,yt) , col="red")


#least square method
#b1 = sum((x-mean_x) * (y-mean_y)) / sum(x-mean_x)^2
#b0 = mean_y - b1 * mean_x
x = as.vector(data$weight)
mean_x = mean(data$weight)
y = as.vector(data$size)
mean_y = mean(data$size)

b1 = sum((x-mean_x) * (y-mean_y)) / sum((x-mean_x)^2)
b1
b0 = mean_y - b1 * mean_x
b0

#using least square method we calculated the feature of best fit line over given data
#i,e. value of slope and intercept
#using calculate slope and intercept we prepared a linear line as yt=b0+b1*x
yt = b0 + b1 * x    #best fit line calculated from derived value of intercept(b0) and coef(b1) using least square method

ggplot(data , aes(x , y)) + 
  geom_point(col="blue") + geom_point(aes(mean_x,mean_y) , col="darkgreen") + 
  geom_line(aes(x,yt) , col="red")

#Making a prediction of size using linear model created with known value of weight
wt = 4.5
sz = b0 + b1 * wt
sz

#Residuals
residuals = y - yt
residuals

par(mfrow=c(1,2))
plot(x,residuals)
hist(residuals , probability = T , ylim=c(0,0.5))

#residual :- identically normally distributed
mean(residuals)

#mean absolute error
mae = mean(abs(y - yt))
mae

#mean squared error
mse = mean((y - yt)^2)
mse

#root mean squared error
rmse = sqrt(mean((y - yt)^2))
rmse


