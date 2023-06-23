df = read.csv('/Users/bipulkumar/Downloads/Adv.csv')
head(df)

x = df[ , c('TV','Radio')]        #features
y = df$Sales     #labels

#yh = w0 + w1x1 + w2x2
#dew0 = -2 * mean(y-yh)
#dew1 = -2 * mean((y-yh) * x$TV)
#dew2 = -2 * mean((y-yh) * x$Radio)

w0 = 4
w1 = 4.2
w2 = 3.7

for (i in 1:1000){
  yh = w0 + w1 * x$TV + w2 * x$Radio
  
  dew0 = -2 * mean((y-yh))
  dew1 = -2 * mean((y -yh) * x$TV)
  dew2 = -2 * mean((y -yh) * x$Radio)
  
  lr = 0.00001
  w0 = w0 - lr*dew0
  w1 = w1 - lr*dew1
  w2 = w2 - lr*dew2
  
  error = mean(abs(y-yh))
  print(paste(i ,error , sep=":"))
}

mae = mean(abs(y -yh))
print(mae)

tv = 65.9
radio = 89.4
sales = w0 + w1*tv + w2*radio
print(sales)
