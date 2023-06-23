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

#pair wise scatter plot

#car: Companion to Applied Regression
install.packages("car")
require(car)
scatterplotMatrix(~ wheel.base + curb.weight + engine.size + horsepower + city.mpg + price,
                  data=df)

#facet plots
#Plot of single row variable vs single column variable:-
#Row variables ~ Column variables

#A conditioned plot with a single column but multiple rows:-
# Row variables ~ .

#A conditioned plot with a single row but multiple columns
# . ~Column Variables

#multiple variables to condition rows and columns, using + symbol as delimator
#RowVar1 + RowVar2 + .... ~ ColVar1 + ColVar2 +.....


#creats single column of histogram conditioned on type of drive wheels of auto
bw1 = (max(df$price) - min(df$price))/30
ggplot(df , aes(price)) + geom_histogram() + facet_grid(drive.wheels ~ .) +
  ggtitle('Histogram of auto price conditioned on drive wheels')

#creats single rown of histogram conditioned on type of drive wheels of auto
bw1 = (max(df$price) - min(df$price))/30
ggplot(df , aes(price)) + geom_histogram() + facet_grid(. ~ drive.wheels) +
  ggtitle('Histogram of auto price conditioned on drive wheels')

#two conditioning variables, fuel type and aspiration to crate twi dimensional grid.
#fuel type conditions the rows and aspiration conditions the columns
bw1 = (max(df$price) - min(df$price))/30
ggplot(df , aes(price)) + geom_histogram() + facet_grid(fuel.type ~ aspiration) +
  ggtitle("histogram of auto price conditioned on fuel type and aspiration")


options(repr.plot.width=8 , repr.plot.height=11)
ggplot(df , aes(city.mpg,price)) + geom_point(aes(color=fuel.type , size=engine.size^2 , 
                                                  shape = factor(aspiration)) , alpha=0.5) +
  facet_grid(body.style ~ drive.wheels) + xlab('City MPG') + ylab('Price') +
  ggtitle('Relationship between City MPG and Price, \n with gas and disel fuel shown ,
          \n with marker radius indicating engine size \n and shape showing aspiration')

#price vs length with color by aspiration
ggplot(df, aes(length,price)) + geom_point(aes(color=aspiration))

colnames(df)
