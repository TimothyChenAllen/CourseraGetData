# Coursera Getting and Cleaning Data Course Project
######################################
# PREPARATION - Load libraries, create function, download and unzip data
require(dplyr)
require(sqldf)
require(readr)

# nice.names: given ugly column names, this function creates nice ones
nice.names <- function(ugly.names) {
        r <- make.names(names=ugly.names, unique=TRUE, allow_ = TRUE)
        # Get rid of awful double periods and final periods in names
        r <- gsub("\\.+", "\\.", r)
        r <- gsub("\\.$", "", r)
        return(r)
}

# Download and unzip the zip file if it's not already downloaded
if (!file.exists("UCI HAR Dataset.zip")) {
        zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url=zipURL, destfile="./UCI HAR Dataset.zip", method="internal", mode="wb")
}

# Unzip the zip file if necessary
if (!file.exists("UCI HAR Dataset")) unzip(zipfile="./UCI HAR Dataset.zip")

######################################
# 1. Merge the training and the test sets to create one data set.
if (!file.exists("./UCI HAR Dataset/X_all.txt")) {
        # Copy the training data to "all" data
        file.copy("./UCI HAR Dataset/train/X_train.txt","./UCI HAR Dataset/X_all.txt")
        file.copy("./UCI HAR Dataset/train/subject_train.txt","./UCI HAR Dataset/subject_all.txt")
        file.copy("./UCI HAR Dataset/train/y_train.txt","./UCI HAR Dataset/y_all.txt")
        # Append the test data to the "all" data
        file.append("./UCI HAR Dataset/X_all.txt","./UCI HAR Dataset/test/X_test.txt")
        file.append("./UCI HAR Dataset/subject_all.txt","./UCI HAR Dataset/test/subject_test.txt")
        file.append("./UCI HAR Dataset/y_all.txt","./UCI HAR Dataset/test/y_test.txt")
}

# Download feature names and create a list of nice column names
features <- read.delim("./UCI HAR Dataset/features.txt", sep=" ", header=FALSE)
colnames(features) <- c("varnum","varname")
good_names <- nice.names(features$varname)

# Read the data from the consolidated data sets
# Use readr::read_table; it reads the entire file in only
# 2.87 seconds (elapsed) on my system
readings.raw <- read_table(file="./UCI HAR Dataset/X_all.txt",
                       col_names=as.character(features$varname))
names(readings.raw) <- good_names

######################################
# 2. Extracts only the measurements on the mean and standard deviation for
# each measurement.

# Select mean, meanFreq, and std columns
# I consider the mean frequency to be a mean variable (see the 
# discussion at 
# https://class.coursera.org/getdata-030/forum/thread?thread_id=228 )
readings <- select(readings.raw, matches("mean|std", ignore.case=FALSE))

# Check to ensure that we read the right number of rows
# There are 7352 + 2947 = 10299 rows.
if (NROW(readings) != 10299) warning(paste("Did not read in 10299 rows, read",
                                         NROW(readings),"rows."))

######################################
# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep=" ",
                              col.names=c("activity_number","activity_name"))

# Let's add on the subject and activity columns
all_subject <- read.csv("./UCI HAR Dataset/subject_all.txt", header=FALSE,
                          col.names="Subject")
all_activity <- read.csv("./UCI HAR Dataset/y_all.txt", header=FALSE,
                           col.names="activity_number")
all_activity$activity_number <- factor(all_activity$activity_number)
levels(all_activity$activity_number)[levels(all_activity$activity_number) == "1"] <- "Walking"
levels(all_activity$activity_number)[levels(all_activity$activity_number) == "2"] <- "Walking upstairs"
levels(all_activity$activity_number)[levels(all_activity$activity_number) == "3"] <- "Walking downstairs"
levels(all_activity$activity_number)[levels(all_activity$activity_number) == "4"] <- "Sitting"
levels(all_activity$activity_number)[levels(all_activity$activity_number) == "5"] <- "Standing"
levels(all_activity$activity_number)[levels(all_activity$activity_number) == "6"] <- "Laying"

######################################
# 4. Appropriately labels the data set with descriptive variable names. 
#all_activity_labels <- merge(x=all_activity, y=activity_labels, by="activity_number")

# Finally, let's cbind everything together
subject.measures <- cbind(Subject=all_subject$Subject, Activity=all_activity$activity_number,
                    readings)

######################################
# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
feature.means <- aggregate.data.frame(subject.measures[,3:ncol(subject.measures)], 
                     by=list(subject.measures$Subject, subject.measures$Activity),
                     FUN=mean)
feature.means <- rename(feature.means, Subject=Group.1, Activity=Group.2) %>%
        arrange(Subject, Activity)

# Change the column names of the means so we know these are aggregates
colnames(feature.means) <- 
        c("Subject","Activity",paste("MEAN_",colnames(feature.means[,3:ncol(subject.measures)]),sep=""))

# View the finished product
View(feature.means)    # Means of each measure for each subject/activity pair

# Write out the finished product
write.table(feature.means, file="./feature_means.txt", row.name=FALSE)

# Create the CodeBook.md file
source("./make_codebook.R")

# Create the README.md file
source("./make_readme.R")
