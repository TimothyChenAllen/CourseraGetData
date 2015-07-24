# This unit test ensures that we are starting without the file downloaded,
# and with no variables in the environment from previous attempts

# Remove the zipfile if it exists
if (file.exists("./UCI HAR Dataset.zip")) file.remove("./UCI HAR Dataset.zip")

# Remove the file folder created from the zipfile if it exists
if (file.exists("./UCI HAR Dataset")) unlink("./UCI HAR Dataset", 
                                             recursive=TRUE, force=TRUE)

# Remove the README.md and CodeBook.md files and their knitted versions
if (file.exists("./README.md")) file.remove("./README.md")
if (file.exists("./CodeBook.md")) file.remove("./CodeBook.md")
if (file.exists("./README.html")) file.remove("./README.html")
if (file.exists("./CodeBook.html")) file.remove("./CodeBook.html")

# Remove the old results file
if (file.exists("./feature_means.txt")) file.remove("./feature_means.txt")

# Remove all variables from the environment
rm(list=ls())

# Source the file that creates the tidy dataset, README.md, and CodeBook.md
source("run_analysis.R")
