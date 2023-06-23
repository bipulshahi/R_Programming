#Activity 2
#Install packages ggplot2, car, caret, corrplot and use library to use them
install.packages("ggplot2")
install.packages("car")
install.packages("caret")
install.packages("corrplot")

#verify if packages are installed
library("ggplot2")
library("car")
library("caret")
library("corrplot")

#Load the MTCARS file from the R studio default dataset
data(mtcars)

#Understand the dataset by using standard function str , head and summary
str(mtcars)
head(mtcars)
summary(mtcars)
dim(mtcars)


#Activity 3
#Factorise am, cyl, vs and gear fields
mtcars$am <- as.factor(mtcars$am)
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)

str(mtcars)

#Dropping dependent variable for calculating Multicollinearity(mpg)
mtcars_a <- subset(mtcars , select = -c(mpg))
mtcars_a


#Activity 4
#Identifying numeric variables using apply function and display
#apply,lapply,sapply
#apply(mtcars_a , 1 , is.numeric)   #row wise - matrix or vector
#apply(mtcars_a , 2 , sum)   #column wise - matrix or vector
#lapply(mtcars_a , is.numeric)   #return list

numeric_data <- mtcars_a[sapply(mtcars_a , is.numeric)]
head(numeric_data)

#Activity 5
#Calculating Correlation
mtcorr <- cor(numeric_data)

#Print correlation matrix and look at max correlation
mtcorr

#Visualize Correlation Matrix
#method = circle,square,ellipse,number,shade,color,pie
#type : - lower,upper
#tl.cex :- size of text
#tl.col :- color of text
#order = alphabet,FPC
corrplot(mtcorr, method="circle",type='upper',
         tl.cex = 0.8 , tl.col = rgb(0.3,0.2,0.7),
         order = "FPC")


#Identifying Variable Names of Highly Correlated Variables
highlycorelated <- findCorrelation(mtcorr , cutoff=0.7)
highlycorelated

#Print highly correlated attributes
highlyCorCol = colnames(numeric_data)[highlycorelated]
highlyCorCol 


#Remove highly correlated variables and create a new dataset
dat1 = subset(mtcars , select = -c(disp,hp,wt))
dat1

#Write down in your project report the dimensions of new dataset
dim(dat1)

#Mtcars data without highly corelated variables

#Step 1:- Took the data
#Step 2:- Assign the columns as categorical which are categorical
#Step 3:- Removed MPG which was target column to calculate corelation between features
#Step 4:- Calculated Corelation on non-categorical information i.e. numrical information
#Step 5:- Figured out higly corelated variables
#Step 6:- Removed Highly corelated variables from overall data i.e. mtcars
#Step 7:- Trained the model using data created in step 6

str(dat1)

#Build Linear Regression Model
fit <- lm(mpg ~ . , data=dat1)

#Check Model Performance using summary
summary(fit)

#Extracting Coefficients using summary
summary(fit)$coef

#Activity 7
#Plot the fit model in a 2*2 matrix using par
par(mfrow=c(2,2))
plot(fit)

#Activity 8
#xtracting R-squared value
#Extracting Adjusted R-squared value
summary(fit)$r.squared
summary(fit)$adj.r.squared

#Activity 9
#Predicions
pred1 = predict(fit , dat1)
pred1

#Use cbind to combine original mtcars and predicted values
final_data1 <- cbind(mtcars,pred1)
final_data1

#Print both actual and predicted mpg
real_predicted <- subset(final_data1,select=c(mpg,pred1))
real_predicted


