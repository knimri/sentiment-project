# Measuring Public Mood Project /Capstone Project Course

install.packages("twitteR")
install.packages("plyr")
library(twitteR)
library(httr)

# creating application
key= "lNqrCDF1xxph42nQXmDWXHwOe"
secret= "W9E4BzWWSZlh0eJ8RrEmSJV1aIwm2P0UdDVtJj9iysreyaxqQw"
setwd=("c:/MPMP")
mytoken="275637322-OILT500Ru70t4qCkJoWKzFdBN6COJcC01SszE83u"
scrttkn="LA8L0odrpKWwH5vNRo6hSYxJsPgcazG4iuR6LLjwucLkq"

#connection with Twitter
setup_twitter_oauth(key,secret,access_token=mytoken, access_secret=scrttkn)

#scrap political tweets
GovTweets =searchTwitter('Canada+government', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
PriTweets =searchTwitter('Canada+Prime Minister', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
JusTweets =searchTwitter('Justin Trudeau', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
LibTweets =searchTwitter('liberal', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')

#concatenate lists of tweets into one list
PolTweets<-c(GovTweets,PriTweets,JusTweets,LibTweets)

#extract text
politicstxt<-sapply(PolTweets,function(x) x$getText())

#get rid of noise
polcorpus<-gsub("[[:punct:]]","",politicstxt) #Punctuation
polcorpus<-gsub("[[:cntrl:]]","",polcorpus)   #control
polcorpus<-gsub("http\\w+ *", "",polcorpus)   # URL

#writing data to csv file.
write.csv(polcorpus, file = "polcorpus.csv")

#scrap job related tweets
wagTweets =searchTwitter('wages', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
unempTweets =searchTwitter('unemployment', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
jomTweets =searchTwitter('Job market', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
unTweets =searchTwitter('UNIONS', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
empTweets =searchTwitter('employment', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
hrTweets =searchTwitter('working people', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')

#concatenate lists of tweets into one list
jobTweets<-c(empTweets,hrTweets, empTweets, unempTweets,jomTweets,unTweets)

#extract text
jobtxt<-sapply(jobTweets,function(x)  x$getText())

#get rid of noise
jobcorpus=gsub("[[:punct:]]","",jobtxt)#Punctuation
jobcorpus=gsub("[[:cntrl:]]","",polcorpus)
jobcorpus=gsub("http\\w+ *", "",polcorpus)

#scrap tweets related to goods and services prices 
grTweets =searchTwitter('grocery+ prices', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
estTweets =searchTwitter(' real estate+prices', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
drgTweets =searchTwitter('drug+ prices', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
insTweets =searchTwitter('insurance+ prices', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
carTweets =searchTwitter('cars+ prices', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
fooTweets =searchTwitter('food+ prices', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
gasTweets =searchTwitter('gas+ prices', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
hiTweets =searchTwitter('high+ prices', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
expTweets =searchTwitter('expensive', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')

#concatenate lists of tweets into one list
prTweets<-c(grTweets,estTweets,drgTweets,insTweets,carTweets,fooTweets,gasTweets,hiTweets,expTweets)

#extract text
pricetxt<-sapply(prTweets,function(x)  x$getText())

#get rid of noise
prcorpus=gsub("[[:punct:]]","",pricetxt)
prcorpus=gsub("[[:cntrl:]]","",prcorpus)
prcorpus=gsub("http\\w+ *", "",prcorpus)


#writing data to csv file.
write.csv(prcorpus, file = "prcorpus.csv")

#scrap tweets related to health issues
hltTweets =searchTwitter('#health', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
welTweets =searchTwitter('#wellness', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
medTweets =searchTwitter('health care', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')

#concatenate lists of tweets into one list
hlttweets=c(hltTweets,welTweets,medTweets)

#extract text
hlttxt<-sapply(hltTweets,function(x)  x$getText())

#get rid of noise
hlcorpus=gsub("[[:punct:]]","",hlttxt)
hlcorpus=gsub("[[:cntrl:]]","",hlcorpus)
hlcorpus=gsub("http\\w+ *", "",hlcorpus)

#writing data to csv file.
write.csv(hlcorpus, file = "hlcorpus.csv")

#scrap tweets related to security issues
secTweets =searchTwitter('security', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')
terTweets =searchTwitter('terror', lang='en', n=10000, since='2016-01-27', geocode='43.6425,-79.387222,80km')

#concatenate lists of tweets into one list
secrTweets=c(secTweets,terTweets)

#extract text
sectxt<-sapply(secrTweets,function(x)  x$getText())

#get rid of noise
seccorpus=gsub("[[:punct:]]","",sectxt)
seccorpus=gsub("[[:cntrl:]]","",seccorpus)
seccorpus=gsub("http\\w+ *", "",seccorpus)

#writing data to csv file.
write.csv(seccorpus, file = "seccorpus.csv")

