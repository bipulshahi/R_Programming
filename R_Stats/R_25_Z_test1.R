# Suppose the IQ in a certain population is normally distributed with a 
#mean of μ = 100 and standard deviation of σ = 15. 
#A reasearcher wants to know if a new medicine affects IQ levels, 
#SO he recruits 30 patients to try it and record IQ levels

#Here we will write a code to perform one sample z-test in R to determine
#if the new drug or medicine causes a significant difference in IQ levels

library(stats)

data = c(88,92,94,94,96,97,97,97,100,100,100,102,101,102,103,103,104,
         105,106,107,107,109,109,109,110,112,112,113,114,115)
length(data)

mu = 100
sigma = 15

n = 30
alpha = 0.05
x_bar = mean(data)
print(x_bar)

critical_value = qnorm(1 - alpha/2)    #
print(critical_value)

z_test_stats = (x_bar - mu)/(sigma / sqrt(n))
print(z_test_stats)

if (z_test_stats > critical_value | z_test_stats < -critical_value){
  print('Reject Null Hypothesis, Mediacation has an effect')
}else{
  print('Accept Null Hypothesis, Mediacation has no effect')
}

###########################
library(BSDA)
data2 = c(88,92,94,94,96,100,100,100,100,100,100,102,101,102,103,103,104,
          117,117,118,117,117,118,118,120,120,120,120,120,120)
mu = 100
sigma = 15
n = 30
alpha = 0.05
x_bar = mean(data2)

z_test_result = z.test(x=data2,
                       mu = mu,
                       sigma.x = sigma/sqrt(n),
                       alternative = "two.sided",
                       conf.level = 1 - alpha)
print(z_test_result)
if (z_test_result$p.value < alpha){
  print('Reject Null Hypothesis, Mediacation has an effect')
}else{
  print('Accept Null Hypothesis, Mediacation has no effect')
}










