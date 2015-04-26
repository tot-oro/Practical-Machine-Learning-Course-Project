setwd("~/Dropbox/DataScience/Practical-Machine-Learning/Project/Practical-Machine-Learning-Course-Project")

## Download and import data files
fileURL = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
download.file(fileURL, destfile="pml-training.csv", method="curl")
fileURL2 = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
download.file(fileURL2, destfile="pml-testing.csv", method="curl")

traindata = read.csv("pml-training.csv")
testdata = read.csv("pml-testing.csv")

## Split training data for cross-validation
library(caret)
inTrain = createDataPartition(y=traindata$classe, p=0.6, list=FALSE)
train = traindata[inTrain, ]
test = traindata[-inTrain, ]

## Exploratory of training data
dim(train)
