#List

#Vector => 1D, same type
#Matrix => 2D, Same type
#List => Different R objects, No coercion , Loss of some functionality

song = list("Rsome times" , 190 , 5)
is.list(song)

#name list
names(song) = c("title" , "duration" , "track")
song

song$title
song$duration
song$track

#Name list
song = list(title = "Rsome times",
            duration = 190,
            track = 5)
str(song)

#List in List
similar_song = list(title = "R you on time",
                    duration = 230)
similar_song

song = list(title = "Rsome times",
            duration = 190,
            track = 5,
            similar = similar_song)
song

str(song)

song$similar
song$similar$title

#Subset and Extend Lists
song[1]
song[[1]]
song$title

song[c(1,4)]

song[[4]][[1]]
song[[c(4,1)]]

#Subset by names
song[["duration"]]

song["duration"]


song[c("duration","similar")]

#Subset by Logicals
#Duration & Track
song[c(F,T,T,F)]

#$ and extending
song$duration

friends = c("Kurt","Florence","Patti","Dave")
song$sent = friends
song

str(song)

song$similar$reason = "too long"
str(song)





