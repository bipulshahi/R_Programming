#Joining two data frames
df1 = read.csv('/Users/bipulkumar/Downloads/autos.csv')
df2 = read.csv('/Users/bipulkumar/Downloads/makes.csv')

head(df1)

head(df2)

require(dplyr)
df3 = left_join(df1, df2 , by = 'make.id')
head(df3)


#function to clean and prepare the data
#rename some columns & remove unneeded columns

colnames(df3)

prep.auto <- function(df , col.names , drop_cols){
  
  names(df) <- col.names
  
  df <- df[, !names(df) %in% drop_cols]
  
  #Add a log tranformed colum for price using dplyr mutate
  df <- df %>% mutate(lnprice = log(price))
  
  #Remove rows with NAs
  df <- df[complete.cases(df),]
  
  #consolidate the number of cylinders
  df <- df %>% mutate(numCylinders = ifelse(numOfCylinders %in% c("four","three","two") , "three-four",
                                       ifelse(numOfCylinders %in% c("five","six") , "five-six" , "eight-twelve")))
  
  df
  
}
col.names <- c("symboling","normalizedLosses","makeId","fuelType",
               "aspiration","numOfDoors","bodyStyle" ,"driveWheels",
               "engineLocation","wheelBase","length","width",
               "height","curbWeight","engineType" ,"numOfCylinders",
               "engineSize","fuelSystem","bore","stroke",
               "compressionRatio","horsepower","peakRpm","cityMpg",
               "highwayMpg","price","make")
drop_cols <- c('symboling','normalizedLosses', 'makeId')

dfx <- prep.auto(df3,col.names,drop_cols)
head(dfx)

#function for data visualization
vis.simple <- function(col1 , df = dfx , col2 = 'lnprice'){
  require(ggplot2)   #load the library
  title = paste('plot of' , col1 , 'vs' , col2)
  ggplot(df , aes_string(col1,col2)) + geom_point() + ggtitle(title)
}

plot.cols <- c("curbWeight" , "engineSize" , "cityMpg")
lapply(plot.cols , vis.simple)

#function to tag a sample as a outlier
id.outlier <- function(df){
  #use ifelse to filter for outliers
  df[,'outlier'] <- ifelse(df[,"curbWeight"] > 3500 |
                             df[,"engineSize"] > 190 |
                             df[,"cityMpg"] > 40 , '1' , '0')
  df
}
dfx <- id.outlier(dfx)
head(dfx)

#dfx$outlier

#function to visualize the Outlines
vis.outlier <- function(col1 = 'cityMpg'){
  dfx[,'outlier'] <- as.factor(dfx[,'outlier'])
  dfx[,'fuelType'] <- as.factor(dfx[,'fuelType'])
  title <- paste('Plot of',col1,'vs lnprice')
  ggplot(dfx , aes_string(col1 , 'lnprice')) + 
    geom_point(aes(color=outlier ,
                   shape = fuelType ,
                   alpha = 0.5,
                   size = 4)) + ggtitle(title)
  
}

plot.cols <- c("curbWeight" , "engineSize" , "cityMpg")
lapply(plot.cols , vis.outlier)

#script to filter out the samples as outlier
df_out <- dfx %>% filter(outlier == 1)
head(df_out)

df_not_out <- dfx %>% filter(outlier != 1)
head(df_not_out)

#plot the data sample after removing the outliers

#function for data visualization
vis.simple <- function(col1 , df = df_not_out , col2 = 'lnprice'){
  require(ggplot2)   #load the library
  title = paste('plot of' , col1 , 'vs' , col2)
  ggplot(df , aes_string(col1,col2)) + geom_point() + ggtitle(title)
}
plot.cols <- c("curbWeight" , "engineSize" , "cityMpg")
lapply(plot.cols , vis.simple)

#Scaling of numerical variables
numCols <- c("wheelBase","length","width","height","curbWeight",
             "engineSize","bore","stroke","compressionRatio",
             "horsepower","peakRpm","cityMpg","highwayMpg")

df_not_out[,numCols] <- scale(df_not_out[,numCols])
head(df_not_out)



#normalize <- function(x , mean ,stdx){
#  (x - mean) / stdx
#}
#meanx <- colMeans(df_not_out[,names(df_not_out) %in% numCols])
#sdx <- df_not_out %>% summarise_if(is.numeric, sd)

#dfx[,numCols] <- Map(normalize , dfx[,numCols] , meanx , sdx)



df_final <- df_not_out[ , !names(df_not_out) %in% c("price","outlier")]
head(df_final)

#plot(df_final$lnprice , df_final$curbWeight,pch=18 , col=3,)
relation <- lm(df_final$lnprice ~ df_final$curbWeight)
#abline(coef(relation) , lwd=3)
ggplot(df_final , aes_string('curbWeight','lnprice')) + 
  geom_point() + geom_smooth(method=lm , se=F)



summary(relation)


relation2 <- lm(df_final$lnprice ~ df_final$curbWeight + df_final$length +
                  df_final$width + df_final$height + df_final$engineSize)
summary(relation2)




