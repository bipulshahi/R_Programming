data = data.frame(weight = c(0.9,1.8,2.4,3.5,3.9,4.4,5.1,5.6,6.3),
                  size = c(1.4,2.6,1.0,3.7,5.5,3.2,3.0,4.9,6.3))
data
head(data)

x <- data$weight
y <- data$size

my.model <- lm(y ~ x)
my.model

b0 = my.model$coefficients[1]
b1 = my.model$coefficients[2]

yt1 = b0 + b1 * x
yt1
yt2 = predict(my.model , as.list(x))
yt2

plot(x,y)
#lines(x , yt, col='red')
abline(coef(my.model))

#predict function to predict output using the linear model created
wt = data.frame(x=c(9,5,7.2,8.1))
sz = predict(my.model , wt)
sz