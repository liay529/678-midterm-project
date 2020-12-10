

#merge 2 data
data=read.csv("data.csv")
genre=read.csv("genres.csv")

data$artists=as.character(data$artists)
genre$artists=as.character(genre$artists)


# data 
for (i in 1:nrow(data)) {
  if (!(is.na(data$X[i]))) {
    data[i,]=NA
  }
}

data = data[-which(apply(data,1,function(x) all(is.na(x)))),]
colnames(data)[19]
data=data[,1:19]

library(dplyr)

merge.data = right_join(x = data,y = genre,by = "artists")
merge.data$genres = as.character(merge.data$genres)



for (i in 1:nrow(merge.data)) {
  if (merge.data$genres[i]=="") {
    merge.data[i,]=NA
  }
  print(i)
}

merge.data = na.omit(merge.data)
write.csv(merge.data,file = "merge.data.csv")
