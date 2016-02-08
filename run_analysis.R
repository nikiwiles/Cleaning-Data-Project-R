library(dplyr)

# The project expects the contents of this zip file ...
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# .. to be extracted at this location in the working directory.
dataDirectory <- "./Data/"

# Function for reading in our data files
readData <- function (directory, folder, filename) { 
  read.table(paste0(directory, folder, "/", filename), sep = "")
}

# Load X_train and X_test data sets
train <- readData (dataDirectory, "train", "X_train.txt")
test <- readData (dataDirectory, "test", "X_test.txt")

# Load y_train.txt and y_test.txt data sets (which splits the data up by activity type)
train_activity <- readData (dataDirectory, "train", "y_train.txt")
test_activity <- readData (dataDirectory, "test", "y_test.txt")

# Load subject train and test data
train_subjects <- readData (dataDirectory, "train", "subject_train.txt")
test_subjects <- readData (dataDirectory, "test", "subject_test.txt")

# Merge activity and subject data 
test <- cbind(test, test_subjects, test_activity)
train <- cbind(train, train_subjects, train_activity)

# Merge the two data sets
allData <- rbind(train, test)

# Read in our features
features <- readData (dataDirectory, "", "features.txt")

# Tack on the columns that we just merged in
allFeatures <- c(sapply(features$V2, function(x) {as.character(x)}), "subject", "activityid")

# Get indexes mentioning the columns we'd like to keep
colsToSelect <- grep("(M|m)ean|(S|s)td|subject|activityid", allFeatures)

# Select only those columns
allData <- allData[ ,colsToSelect]

# Name all of the columns
names(allData) <- grep("(M|m)ean|(S|s)td|subject|activityid", allFeatures, value = TRUE)

# Read in the activity labels
activitylabels <- readData (dataDirectory, "", "activity_labels.txt") %>% rename(activityid = V1, activityname = V2)

# Merge
allData <- allData %>% merge(activitylabels) %>% select(-activityid)

# Clean up our column names, and make them a little more descriptive
# I'd also note that the column names were probaly more or less fine as they were.
cleanColumnNames <- function (x){
  x <- tolower(x)
  x <- gsub("\\()", "", x)
  x <- gsub("\\,", "", x)
  x <- gsub("\\(", "", x)
  x <- gsub("\\)", "", x)
  x <- gsub("\\-", "", x)
  x <- gsub("^t", "time", x)
  x <- gsub("freq", "frequency", x)  
  x <- gsub("^f", "frequency", x)
  x <- gsub("acc", "acceleration", x)  
  x <- gsub("gyro", "gyroscope", x)    
  x <- gsub("bodybody", "body", x) # Remove repetition
  x
}

# Clean up names
names(allData) <- sapply(names(allData), cleanColumnNames)

# Get the mean of all columns, broken down by activity and subject
summaryMeans <- allData %>% group_by(activityname, subject) %>% summarise_each(funs(mean))

# Save the output (trying to match the structure of the source data)
write.table(summaryMeans, file='summaryMeans.tsv', quote=FALSE, sep=' ', col.names=FALSE)

# Output column names
write.table(names(summaryMeans), file='features.tsv', quote=FALSE, sep=' ', col.names=FALSE)