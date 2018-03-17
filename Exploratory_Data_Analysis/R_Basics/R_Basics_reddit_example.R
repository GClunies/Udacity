# read in .csv file as data.frame
reddit <- read.csv('reddit.csv')

# show number of occurrences 
# for each employment status
table(reddit$employment.status)

# see structure of variable "reddit" 
str(reddit)

# show levels of age.range factor
levels(reddit$age.range)

# plotting library
library(ggplot2)
# bar plot by age.range
qplot(data = reddit, x = age.range)

# Set the order of factor levels fro age.range
reddit$age.range <- ordered(reddit$age.range, levels = c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"))
levels(reddit$age.range)

# Alternate solution for setting levels of ordeded factor
reddit$age.range <- factor(reddit$age.range, levels = c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"), ordered = T)
levels(reddit$age.range)

# show data type
class(reddit)
