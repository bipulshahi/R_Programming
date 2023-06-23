#To check if young men ages 8-17 years spend a different amount than
#the national average of 24.44 USD per shopping Trip to a local mall
#with a standard deviation of 3.70 USD, 
#the manager surveyed 40 random young man, He found that the average amount
#spent per trip was 23.37 USD, with a alpha - 0.05, Can it be concluded that
#8-17 years old spend a different amount at the mall than national average.

#H0=spends same amount
#HA=spends different amount

library(stats)

mu = 24.44
sigma = 3.7
n=40
alpha = 0.05
x_bar = 23.37
print(x_bar)

critical_value = qnorm(1 - alpha/2) 
print(critical_value)

z_test_stats = (x_bar - mu)/(sigma/sqrt(n))
print(z_test_stats)

if (z_test_stats > critical_value | z_test_stats < (0- critical_value)){
  print('Reject H0, 8-17 years spends differnt')
}else{
  print('Accept H0, 8-17 years spends same')
}
