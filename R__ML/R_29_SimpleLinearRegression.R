
df = read.csv('/Users/bipulkumar/Downloads/Adv.csv')
head(df)

x = df$TV        #features
y = df$Sales     #labels

ggplot(df, aes(x,y)) + geom_point() + geom_smooth(method="lm",
                                                    se=FALSE,color="red")
x_mean = mean(x)
y_mean = mean(y)

#numerator
n1 = sum((x-x_mean) * (y-y_mean))
d1 = sum((x-x_mean)^2)

#yh = w0 + w1*x
w1 = n1/d1
print(w1)

w0 = y_mean - w1*x_mean
print(w0)

y_new = w0 + w1*x_new
print(y_new)



#Evaluate the output 
#mean absolute error: 
yh = w0 + w1*x
print(y-yh)

#take absolute value
print(mean(abs(y-yh)))

tv = 65.9
sales = w0 + w1 * tv
print(sales)