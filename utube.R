library('tuber')

library('tidyverse')
library(lubridate)
library(stringi)
library('wordcloud')
library(gridExtra)
library('jsonlite')
setwd("/home/pratham/Downloads/")
companyname<-"apple"
#https://developers.google.com/youtube/v3/getting-started see this link to get api key
apikey <- "your api key"

videourl<-paste('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=',companyname,'&key=',apikey,sep="")


Json <- fromJSON(txt=videourl)

ids <- Json$items$id$videoId

for(i in 1:length(ids))
{
  tryCatch({
    if(ids[i]!="")
      urlForComment<-paste("https://www.googleapis.com/youtube/v3/commentThreads?part=snippet%2Creplies&maxResults=100","&videoId=",ids[i],"&key=",apikey,sep='')
    c<-fromJSON(txt=urlForComment)
    value<-c$items$snippet$topLevelComment$snippet$textDisplay
    value<-gsub("[@!^&%$#)(*&^) ]","" , value )
    commentdate<-c$items$snippet$topLevelComment$snippet$publishedAt
    comments<-data.frame(companyname,value,commentdate)
    #write your csv here or do sentiment analysis
    write.csv(comments)
  } , error = function ( e ){ cat(conditionMessage ( e ) , "\n")})
  
  
}
