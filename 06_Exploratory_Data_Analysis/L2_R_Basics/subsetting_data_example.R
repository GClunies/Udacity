getwd()
setwd('/Users/GregoryClunies/Udacity/Exploratory_Data_Analysis')

statesInfo <- read.csv('stateData.csv')

stateSubset <- subset(statesInfo, state.region == 1)
head(stateSubset, 2)
dim(stateSubset)

stateSubsetBracket <- statesInfo[statesInfo$state.region == 1, ]
head(stateSubsetBracket, 2)
dim(stateSubsetBracket)