library(dplyr)

# The project expects the contents of this zip file ...
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# .. to be extracted at this location relative to the working directory.
dataDirectory <- "./Data/"

# Function for reading in our data files
readData <- function (directory, folder, filename) { 
  read.table(paste0(directory, folder, "/", filename), sep = "")
}

# Load X_train.txt and X_test.txt data sets
train <- readData (dataDirectory, "train", "X_train.txt")
test <- readData (dataDirectory, "test", "X_test.txt")

# Load y_train.txt and y_test.txt data sets (which splits the data up by activity type)
train_activity <- readData (dataDirectory, "train", "y_train.txt")
test_activity <- readData (dataDirectory, "test", "y_test.txt")

# Load subject "train" and "test" data (which splits the data up by participant)
train_subjects <- readData (dataDirectory, "train", "subject_train.txt")
test_subjects <- readData (dataDirectory, "test", "subject_test.txt")

# Merge activity and subject data for "test" and "train" 
test <- cbind(test, test_subjects, test_activity)
train <- cbind(train, train_subjects, train_activity)

# Merge the "test" and "train" data sets
allData <- rbind(train, test)

# Read in our features list
features <- readData (dataDirectory, "", "features.txt")

# Tack on the names of the two columns that we created
allFeatures <- c(sapply(features$V2, function(x) {as.character(x)}), "subject", "activityid")

# Get indexes mentioning the columns we'd like to keep
colsToSelect <- grep("(M|m)ean|(S|s)td|subject|activityid", allFeatures)

# Subset only those columns
allData <- allData[ ,colsToSelect]

# Name all of the columns
names(allData) <- grep("(M|m)ean|(S|s)td|subject|activityid", allFeatures, value = TRUE)

# Read in the activity labels, and rename the columns to make it easy to join the data
activitylabels <- readData (dataDirectory, "", "activity_labels.txt") %>% rename(activityid = V1, activityname = V2)

# Merge, and select everything except the activityid
allData <- allData %>% merge(activitylabels) %>% select(-activityid)

# Fn to clean up our column names, and make them a little more descriptive
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

# Clean up names by applying the function to names(allData)
names(allData) <- sapply(names(allData), cleanColumnNames)

# Get the mean of all columns, broken down by activity and subject
summaryMeans <- allData %>% group_by(activityname, subject) %>% summarise_each(funs(mean))

# Save the output
write.table(summaryMeans, file='summaryMeans.tsv', quote=FALSE, sep=' ', row.names = FALSE, col.names=FALSE)

# Save column names
write.table(names(summaryMeans), file='features.tsv', quote=FALSE, sep=' ', row.names = FALSE, col.names=FALSE)