
setwd("~/Desktop")

#import data 
d = read.csv("cities.csv")

#install needed libraries
install.packages("ggExtra")
library(ggplot2)

# histogram of lats and longs
hist(d$lat,breaks=100)
hist(d$long,breaks=100)

# have a closer look at the population
# attention: these are not the cities with the highest populations, 
# but just the top 10 cities (with the highest population) of each country 
qplot(data=d,long,population_city)
summary(d$population_city)

p = ggplot(d, aes(x =long, y = lat,color=including)) + geom_point()
ggExtra::ggMarginal(p, type = "histogram",binwidth = 1)

# plot chart that I then imported to Adobe Illustrator 
d$including[d$include=="def"  | d$include=="yes"] = TRUE
ggplot(e,aes(y=lat,x=city, label = city,color=continent)) + 
  geom_point() + 
  geom_text(hjust = 0, nudge_x = 0.5,size=2) + 
  ylim(-90,90)