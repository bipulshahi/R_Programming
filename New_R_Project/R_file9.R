#loops or if-else

for (i in 1:10){
  print(paste(i , 'Hello'))
}

for (i in 1:10){
  print(paste(i , "+" , i , "=" , i + i))
}

for (i in 1:10){
  cat(i , "+" , i , "=" , i + i , "\n")
}

#apply loop on matrix, data frame or list
d <- data.frame(a = 1:20 , b = 11:30)
d
for (i in d){
  print(paste("Column sum",sum(i)))
}
#Summing up rows value....
for (i in 1:dim(d)[1]){
  cat(d[i,1] , "+" ,  d[i,2] , "=" , sum(d[i,]) , "\n")
}


countries = c("Japan","Singapore","USA","Russia","France","Germany")

length(countries)
countries[[1]]
nchar(countries[[1]])

for (i in 1:length(countries)){
  cat(countries[i] , nchar(countries[i]) , "\n")
}



