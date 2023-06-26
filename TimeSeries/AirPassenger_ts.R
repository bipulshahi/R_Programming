AirPassengers
class(AirPassengers)
start(AirPassengers)
end(AirPassengers)
summary(AirPassengers)
plot(AirPassengers,col="palegreen4",
     main="Passengers vs time")
abline(lm(AirPassengers~time(AirPassengers)))
plot(decompose(AirPassengers))
boxplot(AirPassengers~cycle(AirPassengers))
plot(AirPassengers)
plot(log(AirPassengers)) #make variance equal
abline(lm(log(AirPassengers)~time(log(AirPassengers))))

plot(diff(log(AirPassengers)))
abline(lm(diff(log(AirPassengers))~time(diff(log(AirPassengers)))))

#AR I MA
#p  d  q

acf(AirPassengers)
acf(diff(AirPassengers))

#q = 1
pacf(AirPassengers)
#p = 0
#d = 1 , no. of times we differentiate to get mean constant

arima(log(AirPassengers) , c(0,1,1) , 
      seasonal = list(order=c(0,1,0), period=12)) -> mod_time

#The first value, 0, represents the seasonal autoregressive (AR) order (P). 
#It indicates that there is no seasonal autoregressive component in the model. 
#An AR component captures the linear relationship between the series and 
#its lagged values at seasonal lags.

#The second value, 1, represents the seasonal differencing (D) order. 
#It indicates that one level of differencing has been applied to the series 
#at the seasonal period. Seasonal differencing is used to remove the 
#seasonal patterns from the data.

#The third value, 0, represents the seasonal moving average (MA) order (Q). 
#It indicates that there is no seasonal moving average component in the model. 
#An MA component captures the linear relationship between the series and its past 
#forecast errors at seasonal lags.

#By specifying (0,1,0) for the seasonal parameter, you are indicating that there 
#is no seasonal autoregressive component, one level of seasonal differencing, 
#and no seasonal moving average component in the ARIMA model. 
#This suggests that the seasonal patterns in the data are captured primarily 
#through differencing rather than through autoregressive or moving average 
#relationships.

#It's important to note that the values for the seasonal parameter should be 
#determined based on the analysis of the data and the patterns observed in the 
#ACF and PACF plots, as well as through iterative model fitting and evaluation. 
#The values provided in the code snippet are just an example and may not be 
#appropriate for all time series datasets.

predict(mod_time,10*12) -> pred_time
print(pred_time)

2.718^(pred_time$pred) -> pred_time
print(pred_time)

ts.plot(AirPassengers,pred_time,log="y",lty=c(1,3),
        col="palegreen4",main="forecastedvalues")


       