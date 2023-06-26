#tapply() vs sapply()

sf = data.frame(student = c("Alice","Bob","Charlie","David","Eve"),
                subject = c("Math","Science","Math", "Science","Math"),
                Score = c(85,92,78,88,90))
sf

#tapply() & sapply() both are useful for apllying a function to subset of data


#Using tapply()
mean_scores = tapply(sf$Score, sf$subject,mean)
mean_scores
#tapply() function applies mean() on the score column 
#based on unique values in Subject column

sapply(sf$Score, sf$subject,mean)

split(sf$Score, sf$subject)
mean_scores2 = sapply(split(sf$Score, sf$subject),mean)
mean_scores2
