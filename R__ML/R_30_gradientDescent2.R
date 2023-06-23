df = read.csv('/Users/bipulkumar/Downloads/Adv.csv')
head(df)

x = df$TV        #features
y = df$Sales     #labels

ggplot(df, aes(x,y)) + geom_point()

w0 = 6.8
w1 = 6

for (i in 1:50){
  yh = w0 + w1 * x
  dew0 = -2 * mean((y-yh))
  dew1 = -2 * mean((y -yh) * x)
  lr = 0.00001
  w0 = w0 - lr*dew0
  w1 = w1 - lr*dew1
  
  error = mean(abs(y-yh))
  print(paste(i ,error , sep=":"))
}

ggplot(df, aes(x,y)) + geom_point() + geom_line(aes(x,yh) , se = FALSE ,
                                                color='red')

mae = mean(abs(y-yh))
print(mae)