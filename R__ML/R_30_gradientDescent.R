library(ggplot2)

x = c(3 , 5 , 6.3 , 7.2, 8.5)    #features
y = c(4.1 , 6.2 , 5.2, 7.1, 7.9)   #Labels

data = data.frame(x,y)

w0 = 1
w1 = 1

yh = w0 + w1 * x

error = mean(abs(y-yh))
print(error)

ggplot(data, aes(x,y)) + geom_point() + geom_line(aes(x,yh) , 
                                                  color = 'red')


dew0 = -2 * mean((y-yh))
dew1 = -2 * mean((y -yh) * x)

print(dew0)
print(dew1)
lr = 0.01
w0 = w0 - lr*dew0
w1 = w1 - lr*dew1
print(w0,w1)

yh = w0 + w1 * x

error = mean(abs(y-yh))
print(error)

#Apply gradient descent to let the algorithm learn about w0 & w1
x = c(3 , 5 , 6.3 , 7.2, 8.5)    #features
y = c(4.1 , 6.2 , 5.2, 7.1, 7.9)   #Labels

w0 = 2
w1 = 2.5

yh = w0 + w1 * x

ggplot(data, aes(x,y)) + geom_point() + geom_line(aes(x,yh) , 
                                                  color = 'red')

for (i in 1:50){
  yh = w0 + w1 * x
  dew0 = -2 * mean((y-yh))
  dew1 = -2 * mean((y -yh) * x)
  lr = 0.01
  w0 = w0 - lr*dew0
  w1 = w1 - lr*dew1
  
  error = mean(abs(y-yh))
  print(paste(i ,error , sep=":"))
}

ggplot(data, aes(x,y)) + geom_point() + geom_line(aes(x,yh) , 
                                                  color = 'red')
mae = mean(abs(y-yh))
print(mae)

print(paste(w0, w1))

x_new = 9
print(w0 + w1 * x_new)