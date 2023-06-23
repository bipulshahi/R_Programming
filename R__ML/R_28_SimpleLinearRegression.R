library(ggplot2)

x = c(3 , 5 , 6.3 , 7.2, 8.5)    #features
y = c(4.1 , 6.2 , 5.2, 7.1, 7.9)   #Labels

x_new = 9
#y_new = ?

data = data.frame(x,y)

ggplot(data, aes(x,y)) + geom_point() + geom_smooth(method="lm",
                                                    se=FALSE,color="red")

x_mean = mean(x)
y_mean = mean(y)

n1 = sum((x-x_mean)*(y-y_mean))
d1 = sum((x-x_mean)^2)

#yh = w0 + w1*x
w1 = n1/d1
print(w1)

w0 = y_mean - w1 * x_mean
print(w0)

y_new = w0 + w1 * x_new
print(y_new)

#Evaluate the output
yh = w0 + w1*x
print(mean(abs(y - yh)))


