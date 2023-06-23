

churn1 = read.csv('/Users/bipulkumar/Downloads/customer_churn.csv')

heatmap(df,scale="none")

data("mtcars")
View(mtcars)

df = select(mtcars, mpg,cyl)
df = scale(df)
View(df)

heatmap(df, scale='none')

heatmap(df, scale='row')


library(gplots)
heatmap.2(df,col=bluered(100))


