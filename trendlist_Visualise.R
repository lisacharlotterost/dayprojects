
# Analysing and visualising Trendlist.org data 
# 2016-04-18
# --------------------------------------------

# load libraries
library(ggplot2)
library(dplyr)

# load data
setwd("~/Desktop")
d = read.csv('trendlist_trends.csv',header = TRUE,stringsAsFactors = FALSE)

# clean up data 
d$url = gsub("http://www.trendlist.org/trends/", "", d$url)
d$url = gsub("-", " ", d$url)
d$percentage = as.integer(d$percentage)
d$year = as.integer(d$year)
d = na.omit(d) 
d = d %>% filter(year>1999 & year<2016)

# create new column for max value in each url
d <- d %>%
  group_by(url) %>%
  mutate(color = (max(percentage) == percentage))

# plot small multiples of the individual trends, hightlight max value 
ggplot(d,aes(x=year,y=percentage)) + 
  geom_bar(stat = "identity",aes(fill = color)) + 
  facet_wrap(~url)

# plot bar chart of summed percentages over the years 
ggplot(d,aes(x=year,y=percentage)) + 
  geom_bar(stat = "identity")

# create table of average percentages per year
MeanPercentages = d %>% 
  group_by(year) %>%
  summarise(mean(percentage)) 
View(MeanPercentages) 

# plot average percentages per year
plot(MeanPercentages$year,MeanPercentages$`mean(percentage)`,type = "h")

