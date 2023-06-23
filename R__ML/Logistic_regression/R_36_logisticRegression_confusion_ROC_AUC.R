library(caTools)
library(pROC)

#Load breast cancer tumor
url = "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
names <- c('id_number', 'diagnosis', 'radius_mean', 
           'texture_mean', 'perimeter_mean', 'area_mean', 
           'smoothness_mean', 'compactness_mean', 
           'concavity_mean','concave_points_mean', 
           'symmetry_mean', 'fractal_dimension_mean',
           'radius_se', 'texture_se', 'perimeter_se', 
           'area_se', 'smoothness_se', 'compactness_se', 
           'concavity_se', 'concave_points_se', 
           'symmetry_se', 'fractal_dimension_se', 
           'radius_worst', 'texture_worst', 
           'perimeter_worst', 'area_worst', 
           'smoothness_worst', 'compactness_worst', 
           'concavity_worst', 'concave_points_worst', 
           'symmetry_worst', 'fractal_dimension_worst')
data = read.csv(url,col.names = names)
head(data)

table(data$diagnosis)


#Remove ID Column
df1 = data[,-c(1)]

df1$diagnosis = ifelse(df1$diagnosis  == "M" , 1 , 0)
View(df1)

#Seperate the features and labels
X = df1[,-c(1)]        #feature from df1
Y = df1$diagnosis     #Labels from df1

#Split the data into train & test sets
split = sample.split(Y , SplitRatio = 0.75)
xtrain = X[split, ]
ytrain = Y[split]

xtest = X[!split,]   #convert 25% false values into & 75% true into false for split
ytest = Y[!split]

#create logistic regression model
lmodel = glm(ytrain ~ ., data = cbind(xtrain,ytrain))

summary(lmodel)
#predict
train_pred = ifelse(predict(lmodel , data.frame(xtrain) , type = "response") >= 0.5 , 1 , 0)
test_pred = ifelse(predict(lmodel , data.frame(xtest) , type = "response") >= 0.5 , 1 , 0)


#Calculate the accuracy on training and testing data
train_accuracy = sum(train_pred == ytrain)/length(ytrain)
test_accuracy = sum(test_pred == ytest)/length(ytest)

print(train_accuracy)
print(test_accuracy)

#Confusion matrix
train_confusion = table(ytrain , train_pred)
train_confusion

test_confusion = table(ytest , test_pred)
test_confusion


testpredProb = predict(lmodel , data.frame(xtest) , type = "response") 
#roc optimal threshold
roc_curve = roc(ytest,testpredProb)
roc_curve
#TPR
roc_curve$sensitivities
roc_curve$specificities
roc_curve$thresholds

g_value = roc_curve$sensitivities * roc_curve$specificities   #acc. 1 * acc 0
max(g_value)
which.max(g_value)          #index of max g_value
optimal_thresh = roc_curve$thresholds[which.max(g_value)]
optimal_thresh

#plot the ROC curve
plot(roc_curve , main="ROC Curve",
     print.auc=T, auc.polygon=T , grid = T)

#Mark the optimal threshold on the ROC curve
points(roc_curve$sensitivities[which.max(g_value)],
       roc_curve$specificities[which.max(g_value)],
       col="red" , pch="*" , cex=1.5)


#Make predictions on optimal threshold
optimal_test_pred = ifelse(predict(lmodel, 
                                   data.frame(xtest) , 
                                   type = "response") > optimal_thresh,1,0)
optimal_test_pred


#Calculate model performance with threshold 0.5
#Recall = TPR = Sensitivity =
#no. of times prediction & Real label both are 1 / no. times real labels are 1

metrics_thresh_0.5 = data.frame(Accuacy = sum(test_pred == ytest)/length(ytest),
                                Recall = sum(ytest[test_pred == 1] == 1)/sum(ytest == 1),
                                Precision = sum(ytest[test_pred == 1] == 1)/sum(test_pred == 1),
                                AUC = roc(ytest,test_pred)$auc)

metrics_thresh_0.5 

#calculate model performance with optimal threshold =>0.33
metrics_optimal_thresh = data.frame(Accuacy = sum(optimal_test_pred == ytest)/length(ytest),
                                Recall = sum(ytest[optimal_test_pred == 1] == 1)/sum(ytest == 1),
                                Precision = sum(ytest[optimal_test_pred == 1] == 1)/sum(optimal_test_pred == 1),
                                AUC = roc(ytest,optimal_test_pred)$auc)

metrics_optimal_thresh

test_confusion = table(ytest , test_pred)
test_confusion

test_confusion_optimal = table(ytest , optimal_test_pred)
test_confusion_optimal

#predictions
print(ifelse(predict(lmodel , data.frame(xtest[31,]) , type="response") > 0.5, 1 , 0))
print(ifelse(predict(lmodel , data.frame(xtest[31,]) , type="response") > 0.33, 1 , 0))
print(ytest[31])

