df = read.csv('/Users/bipulkumar/Downloads/Adv.csv')
head(df)

library(ggplot2)
library(caret)

ggplot(df, aes(x = TV, y = Sales)) + geom_point() +
  ggtitle("TV vs Sales")

ggplot(df, aes(x = Radio, y = Sales)) + geom_point() +
  ggtitle("Radio vs Sales")

ggplot(df, aes(x = Newspaper, y = Sales)) + geom_point() +
  ggtitle("Newspaper vs Sales")


#Calculate the corelation between features and the target variable
cor_tv_sales = cor(df$TV,df$Sales)
print(cor_tv_sales)
cor_radio_sales = cor(df$Radio,df$Sales)
print(cor_radio_sales)
cor_news_sales = cor(df$Newspaper,df$Sales)
print(cor_news_sales)




