#dplyr >> verbs

df <- read.csv('/Users/bipulkumar/Downloads/Automobile_price_data__Raw_.csv')
head(df)

str(df)

#Convert some column into numerical form
df$price <- as.numeric(df$price)
str(df)

numcols <- c('bore','stroke','horsepower','peak.rpm')

df[,numcols]

df[,numcols] <- lapply(df[,numcols] , as.numeric)

str(df)
#help(lapply)
#help(sapply)

#Remove null values in data
df <- df[complete.cases(df),]
df

#dyplr >> filter
library(dplyr)
df_audi <- filter(df , make == 'audi')
df_audi

#dplyr >> slice
df.slice <- slice(df , 20:39)
df.slice

#Random samples from data
df.rand <- sample_frac(df.slice , 0.5)
df.rand


#dplyr >> select
df2 <- select(df , drive.wheels , wheel.base , curb.weight , horsepower, price)
df2


#dplyr >> arrange
df2 <- arrange(df2 , drive.wheels , price)
df2


#Computing on Data Frame
#mutate :- mutate verb allows us to effiviently add a new computed column
#to our dataframe.
df3 <- mutate(df2 , curb.weight.kg = curb.weight/2.205 , 
              weight.horsepower = curb.weight / horsepower)
select(df3 , curb.weight , curb.weight.kg , weight.horsepower)


#Summarise :- it will allow us to compute summary statistics
summarise(df3 , mean.curb.weight = mean(curb.weight) , 
          sd.curb.weight = sd(curb.weight) , 
          max.curb.weight = max(curb.weight) ,
          min.curb.weight = min(curb.weight))

#counts >> another way to summarise data
count(df , body.style)
count(df , body.style , num.of.cylinders)

#Create a verb chain
df4 <- df %>% filter(make == 'audi') %>% select(drive.wheels,wheel.base,
                                                curb.weight,engine.size,
                                                price)
df4


#filter a data sample with curb.weight value in between 1000 & 2000
#and then arrange it in increasing order , price value should be between 
#5000 to 6000 , select drive.wheels, wheel.base, curb.weight, engine.size, price


df %>% filter(curb.weight > 1000 & curb.weight < 2000) %>% arrange(price) %>% 
  filter(price > 5000 & price < 6000) %>% 
  select(drive.wheels, wheel.base, curb.weight, engine.size, price)


#groupBy in verb chain

df %>% group_by(drive.wheels) %>%
  summarise(count = n() , mean.price = mean(price) , sd.price = sd(price),
            max.price = max(price) , min.price = min(price))


#Create a dplyr verbchain to compute the count, mean weight, standard deviation , 
#maximum weight, minimum weight for toyota autos groupbed by body style
df %>% filter(make == "toyota") %>% 
  group_by(body.style) %>%
  summarise(count=n(), mean.weight=mean(curb.weight), sd.weight=sd(curb.weight),
            max.weight=max(curb.weight), min.weight=min(curb.weight))


#Plotting
#bar plot for body.style
require(ggplot2)
ggplot(df , aes(body.style)) + geom_bar()


ggplot(df , aes(x = reorder(body.style , 
                            body.style , function(x) - length(x)))) + 
  geom_bar() + 
  theme(axis.text.x = element_text(angle=90 ,hjust=1))


#histogram of price column
ggplot(df , aes(price)) + geom_histogram()

#boxplot of price column
ggplot(df , aes(x = factor(0) , y = price)) + geom_boxplot()

#box plot conditioned on fuel type
ggplot(df , aes(x = factor(fuel.type) , y = price)) + geom_boxplot() +
  xlab('fuel type') + ggtitle('Price by fuel type')

#Kernal density estimation plot
ggplot(df , aes(price)) + geom_density()
ggplot(df , aes(curb.weight)) + geom_density()
ggplot(df , aes(length)) + geom_density()

#the bandwidth or span of density kernel estimator
#can be adjusted to enhance or further smoothing the density estimation.
#adjust :- argmument to change the bandwidth of density kernel
ggplot(df , aes(price)) + geom_density(adjust = 1/5)

#violin plot :- combines some attribute of a kernel density plot and box plot
#it shows a systematic kernel density plot
#it can also be conditioned on categorical column
ggplot(df , aes(x = factor(fuel.type) , y=price)) + 
  geom_violin(trim=TRUE , draw_quantiles = c(0.25,0.5,0.75)) +
  xlab('Fuel Type') + ggtitle('Price by fuel type')


#Scatter plot :- city.mpg vs price
ggplot(df, aes(x=city.mpg, y=price)) +
  geom_point() + xlab('City MPG') + ylab("Price") +
  ggtitle("City MPG vs Price")


#2d kernel density plot
ggplot(df, aes(x=city.mpg, y=price)) + geom_point() + geom_density2d() + 
  xlab('City MPG') + ylab("Price") +
  ggtitle("City MPG vs Price")


#Line plot
x = seq(1 , 100 , length.out = 100)
dfx = data.frame(x = x , y = x ^2)

ggplot(dfx , aes(x,y)) + geom_line() + ggtitle('X vs Y')


#Viewing More dimensions
ggplot(df, aes(x=city.mpg, y=price)) + geom_point(aes(color=factor(fuel.type),
                                                      size = engine.size) ,
                                                  alpha = 0.5) +
  xlab('City MPG') + ylab("Price") +
  ggtitle("City MPG vs Price")


#squaring the value affecting the size of entity on plot
df$engine.size2 = df$engine.size^2
ggplot(df, aes(x=city.mpg, y=price)) + geom_point(aes(color=factor(fuel.type),
                                                      size = engine.size2,
                                                      shape = factor(aspiration)) ,
                                                  alpha = 0.5) +
  xlab('City MPG') + ylab("Price") +
  ggtitle("City MPG vs Price")


#Histogram bins :- effect of changing the number of bins in a histogram
#engine size :- 20 bins / 50 bins

install.packages("gridExtra")
require(gridExtra)

bw1 = (max(df$price) - min(df$price))/20
bw2 = (max(df$price) - min(df$price))/50

p1 = ggplot(df , aes(price)) + geom_histogram(binwidth = bw1) +
  ggtitle('Histogram of auto price with 20 bins')

p2 = ggplot(df , aes(price)) + geom_histogram(binwidth = bw2) +
  ggtitle('Histogram of auto price with 50 bins')

grid.arrange(p1 , p2 , nrow=2)

#for Engine size

bw1 = (max(df$engine.size) - min(df$engine.size))/20
bw2 = (max(df$engine.size) - min(df$engine.size))/50

p1 = ggplot(df , aes(engine.size)) + geom_histogram(binwidth = bw1) +
  ggtitle('Histogram of engine.size with 20 bins')

p2 = ggplot(df , aes(engine.size)) + geom_histogram(binwidth = bw2) +
  ggtitle('Histogram of engine.size with 50 bins')

grid.arrange(p1 , p2 , nrow=2)

























