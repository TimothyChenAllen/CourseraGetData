# Coursera Getting and Cleaning Data Course Project

require(dplyr)
require(sqldf)

# I. Get the data
## a. download the zip file
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url=zipURL, destfile="har_data.zip", method="internal", mode="wb")

## b. Unzip the zip file
unzip(zipfile="har_data.zip")

## c. Determine which columns interest us (only mean and std)
features <- read.delim("UCI HAR Dataset/features.txt", sep=" ", header=FALSE)
colnames(features) <- c("varnum","varname")
interesting.features <- 
  sqldf("select varnum, 'NA' varclass, varname from features where varname like '%mean()%' or varname like '%std()%'")
null.features <- 
  sqldf("select varnum, 'NULL' varclass, varname from features where varname not like '%mean()%' and varname not like '%std()%'")
classes <- rbind(interesting.features, null.features)
classes <- classes[order(classes$varnum),]
classTypes <- ifelse(classes$varclass=="NA",NA,"NULL")
  
## d. read the data from the training and test data sets
# To avoid running out of memory, I'll read and write chunks of this at a time
# There are 7352 rows.

train <- read.fwf("UCI HAR Dataset/train/X_train.txt", widths=rep(16,561),
                  n=100, colClasses=classTypes)
colnames(train) <- interesting.features$varname
write.table(x=train, file="tidy_data.csv", sep=",", row.names=FALSE)
for (chunk in 1:73) {
  print(chunk)
  train <- read.fwf("UCI HAR Dataset/train/X_train.txt", widths=rep(16,561),
                    skip=100*chunk,n=100, colClasses=classTypes)
  colnames(train) <- interesting.features$varname
  write.table(x=train, file="tidy_data.csv", sep=",",col.names=FALSE, 
              row.names=FALSE, append=TRUE, )
}

