### Collect multiple youtube comments using R and Google Api key

```
#just a varaible for url param
companyname<-"apple"

#you will need a your developer api key from https://console.developers.google.com/ 
#visit below link create your api key
#https://developers.google.com/youtube/v3/getting-started see this link to get api key
apikey <- "your api key"

#once you create your api key then and then only you can access youtube video comments 
videourl<-paste('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=',companyname,'&key=',apikey,sep="")

#contains response
Json <- fromJSON(txt=videourl)
```


### note at a single hit youtube responds with 50 comments (might change) so to fetch all you will require to hit may times see the R code file for complete example
