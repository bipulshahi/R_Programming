#Install packages ggplot2, car, caret, corrplot and use library to use them  

install.packages("ggplot2")
install.packages("car")
install.packages("caret")
install.packages("corrplot")

#to verify if packages are installed
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

#Factorise am, cyl, vs and gear fields 
mtcars$am = as.factor(mtcars$am)
mtcars$cyl = as.factor(mtcars$cyl)
mtcars$vs = as.factor(mtcars$vs)
mtcars$gear = as.factor(mtcars$gear)

#Dropping dependent variable for calculating Multicollinearity(mpg) 
#subset(mtcars, select = c(cyl,disp,hp,drat,wt,qsec,vs,am,gear,carb))
mtcars_a = subset(mtcars, select = -c(mpg))

#Display the new data and check if mpg is displayed or not  
mtcars_a

str(mtcars_a)

#Identifying numeric variables using apply function and display
#apply,sapply,lapply
#lapply(mtcars_a , is.numeric) data frame > returns a list
#apply(mtcars_a , 1 , is.numeric) #matrix as input -- row wise
#apply(mtcars , 2 , is.numeric) #matrix as input - column wise

numeric_data = mtcars_a[sapply(mtcars_a , is.numeric)]  #dataframe > returns vector
numeric_data

#Calculating Correlation => cor
mtcorr = cor(numeric_data)

#Visualize Correlation Matrix 
print(mtcorr)

#Visualize Correlation Matrix  
#method :- circle,square,ellipse,number,shade,color,pie
#type :- lower , upper
#order :- alphabet,FPC
#tl.cex :- size of the text
#tl.col :- color of the text
corrplot(mtcorr , method="circle" , type='upper',
         order = 'FPC' , tl.cex=0.7 , 
         tl.col=rgb(0,0,0,))


#Identifying Variable Names of Highly Correlated Variables
highlycorelated = findCorrelation(mtcorr , cutoff=0.7)
highlycorelated

#Print highly correlated attributes 
highlyCorCol = colnames(numeric_data)[highlycorelated]
highlyCorCol

#Remove highly correlated variables and create a new dataset 
#subset(mtcars , select = -c(hp,disp,wt))
dat1 = mtcars[ , -which(colnames(mtcars) %in% highlyCorCol)]
print(dat1)
#mtcars for the training purpose but without highly correlated data

#Step 1: - Took the data
#Step 2: - Assign the column which are categorical as categorical using factor
#Step 3: - Removed MPG which is target variable to calculate coreation within the features
#Step 4: - Calculated correlation on non-categorical information i.e. numerical information
#Step 5: - Figured out highest correlated features
#Step 6:- Removed Highest correlated features from overall data i.e. mtcars
#step 7: - trained the model using the data created in last step

str(dat1)
#Numerical data was used to find correlations
#For training the model we have to use complete data set
#So select the variable for the training from complete data set


#Split the data for training and testing seperately
dt = sort(sample(nrow(dat1), nrow(dat1)*.8))
train <- dat1[dt,]
test <- dat1[-dt,]

#Build Linear Regression Model 
fit = lm(mpg ~ ., data = train)

#Check Model Performance using summary 
summary(fit)

#Extracting Coefficients using summary 
summary(fit)$coeff

#Plot the fit model in a 2*2 matrix using par  
par(mfrow=c(2,2))
plot(fit)

#Extracting R-squared value 
#Extracting Adjusted R-squared value
summary(fit)$r.squared
summary(fit)$adj.r.squared

#Use function predict for the fit and dataframe from activity 5  
pred1 = predict(fit,train)

#Use cbind to combine original mtcars and predicted values  
final_train_data1 = cbind(train,pred1)
final_train_data1

#Print both actual and predicted mpg 
subset(final_train_data1, select = c(mpg, pred1))


#Evaluation on test data

install.packages("Metrics")
library(Metrics)

#predict using test data
pred2 = predict(fit,test)

#Sum of Squared error :- real mpg value,predicted mpg value
sse(test$mpg,pred2)
#Mean Squared Error
mse(test$mpg,pred2)
#Root Mean Squared Error
rmse(test$mpg,pred2)
#Mean Absolute Error
mae(test$mpg,pred2)

#Coefficient of determination : - R-Squared on test data
error = test$mpg - pred2
error
R_Squared = 1 - (sum(error^2) / sum((test$mpg - mean(test$mpg))^2))
R_Squared

#Adjusted R - Squared
adj_r_squared = 1 - (mse(test$mpg,pred2) / var(test$mpg))
adj_r_squared


#Histogram plot of Error
coef(summary(fit))[,"Std. Error"]
hist(coef(summary(fit))[,"Std. Error"])

#Explain the Project background and Project Objective
#Explain the Data that you have
#Explain Data Exploration process and the result
#Explain Data Correlation Test Result
#Explain Data Visualization Result
#Explain Data Preparation/Data Cleansing
#Explain Feature selection, feature engineering
#Explain Algorithm Selection
#Explain Residual and Evaluate the model (RMSE)
#Explain the Model created
#Explain the use of Azure machine learning in training the model
