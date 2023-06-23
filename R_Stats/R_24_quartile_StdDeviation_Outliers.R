
dataset = c(11,10,12,14,12,15,14,13,15,102,12,14,17,19,107,10,
            13,12,14,12,108,12,11,14,13,15,10,15,12,10,14,13,15,10)

#Idetify Outliers Using Standard deviation
detect_outliers = function(data){
  threshold = 3
  mean = mean(data)
  std = sd(data)
  
  outliers = c()
  for (val in data){
    z_score = (val - mean)/std
    if (abs(z_score) > threshold){
      outliers = c(outliers,val)
    }
  }
  return (outliers)
}
detect_outliers(dataset)



#Idetify Outliers Using Quartiles
dataset = c(11,10,12,14,12,15,14,13,15,102,12,14,17,19,107,10,
            13,12,14,12,108,12,11,14,13,15,10,15,12,10,14,13,15,10)

detect_outliers2 = function(data){
  data = sort(data)
  q1 = quantile(data, 0.25)
  q3 = quantile(data, 0.75)
  iqr = q3-q1
  
  outliers = c()
  for (val in data){
    uf = q3 + (1.5*iqr)
    lf = q1 - (1.5*iqr)
    
    if (val<lf | val>uf){
      outliers = c(outliers, val)
    }
  }
  return(outliers)
}

detect_outliers2(dataset)

boxplot(dataset)

library(ggplot2)
ggplot(data = data.frame(dataset) , aes(x=1, y = dataset)) + geom_boxplot()

