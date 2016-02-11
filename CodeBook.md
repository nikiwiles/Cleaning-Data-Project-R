# Codebook

###Week 4 Course Project: Getting &amp; Cleaning Data.

#### Source dataset

This analysis is based on the dataset hosted at - 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The ultimate source of the data was the following study -

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Target dataset

The target dataset, *[summaryMeans.tsv](https://github.com/nikiwiles/cleaningdataproject/blob/master/summaryMeans.tsv)*, consists of 180 observations on the 88 columns described in the section 'Columns: summaryMeans.tsv' below.

The target dataset was created by running an RScript, called [run_analysis.R](https://github.com/nikiwiles/cleaningdataproject/blob/master/run_analysis.R), that performs the following process - 

1. Merge the training and the test sets (taken from the extracted archive) to form one data set.
2. Extract only the measurements on the mean and standard deviation for each observation.
3. Merge in descriptive activity labels (using activity_labels.txt in the archive)
4. Clean the variable names (incl. removing special character) and make them more descriptive.
5. Export a dataset with the average of each variable for each activity and each subject, called *[summaryMeans.tsv](https://github.com/nikiwiles/cleaningdataproject/blob/master/summaryMeans.tsv)*.
6. Export the rownames and column indexes of the new dataset to a file called  *[features.tsv](https://github.com/nikiwiles/cleaningdataproject/blob/master/features.tsv)*.

Before running the script, the contents of the file Dataset.zip should be unzipped into a data directory (./Data/) in the root of the working directory.

#### Columns: summaryMeans.tsv 

The target dataset contains the following  columns -

* activityname’: factor; LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
* subject’ the participant code: numeric 1-30 
* timebodyaccelerationmeanx’: numeric -1 to 1
* timebodyaccelerationmeany’: numeric -1 to 1
* timebodyaccelerationmeanz’: numeric -1 to 1
* timebodyaccelerationstdx’: numeric -1 to 1
* timebodyaccelerationstdy’: numeric -1 to 1
* timebodyaccelerationstdz’: numeric -1 to 1
* timegravityaccelerationmeanx’: numeric -1 to 1
* timegravityaccelerationmeany’: numeric -1 to 1
* timegravityaccelerationmeanz’: numeric -1 to 1
* timegravityaccelerationstdx’: numeric -1 to 1
* timegravityaccelerationstdy’: numeric -1 to 1
* timegravityaccelerationstdz’: numeric -1 to 1
* timebodyaccelerationjerkmeanx’: numeric -1 to 1
* timebodyaccelerationjerkmeany’: numeric -1 to 1
* timebodyaccelerationjerkmeanz’: numeric -1 to 1
* timebodyaccelerationjerkstdx’: numeric -1 to 1
* timebodyaccelerationjerkstdy’: numeric -1 to 1
* timebodyaccelerationjerkstdz’: numeric -1 to 1
* timebodygyroscopemeanx’: numeric -1 to 1
* timebodygyroscopemeany’: numeric -1 to 1
* timebodygyroscopemeanz’: numeric -1 to 1
* timebodygyroscopestdx’: numeric -1 to 1
* timebodygyroscopestdy’: numeric -1 to 1
* timebodygyroscopestdz’: numeric -1 to 1
* timebodygyroscopejerkmeanx’: numeric -1 to 1
* timebodygyroscopejerkmeany’: numeric -1 to 1
* timebodygyroscopejerkmeanz’: numeric -1 to 1
* timebodygyroscopejerkstdx’: numeric -1 to 1
* timebodygyroscopejerkstdy’: numeric -1 to 1
* timebodygyroscopejerkstdz’: numeric -1 to 1
* timebodyaccelerationmagmean’: numeric -1 to 1
* timebodyaccelerationmagstd’: numeric -1 to 1
* timegravityaccelerationmagmean’: numeric -1 to 1
* timegravityaccelerationmagstd’: numeric -1 to 1
* timebodyaccelerationjerkmagmean’: numeric -1 to 1
* timebodyaccelerationjerkmagstd’: numeric -1 to 1
* timebodygyroscopemagmean’: numeric -1 to 1
* timebodygyroscopemagstd’: numeric -1 to 1
* timebodygyroscopejerkmagmean’: numeric -1 to 1
* timebodygyroscopejerkmagstd’: numeric -1 to 1
* frequencybodyaccelerationmeanx’: numeric -1 to 1
* frequencybodyaccelerationmeany’: numeric -1 to 1
* frequencybodyaccelerationmeanz’: numeric -1 to 1
* frequencybodyaccelerationstdx’: numeric -1 to 1
* frequencybodyaccelerationstdy’: numeric -1 to 1
* frequencybodyaccelerationstdz’: numeric -1 to 1
* frequencybodyaccelerationmeanfrequencyx’: numeric -1 to 1
* frequencybodyaccelerationmeanfrequencyy’: numeric -1 to 1
* frequencybodyaccelerationmeanfrequencyz’: numeric -1 to 1
* frequencybodyaccelerationjerkmeanx’: numeric -1 to 1
* frequencybodyaccelerationjerkmeany’: numeric -1 to 1
* frequencybodyaccelerationjerkmeanz’: numeric -1 to 1
* frequencybodyaccelerationjerkstdx’: numeric -1 to 1
* frequencybodyaccelerationjerkstdy’: numeric -1 to 1
* frequencybodyaccelerationjerkstdz’: numeric -1 to 1
* frequencybodyaccelerationjerkmeanfrequencyx’: numeric -1 to 1
* frequencybodyaccelerationjerkmeanfrequencyy’: numeric -1 to 1
* frequencybodyaccelerationjerkmeanfrequencyz’: numeric -1 to 1
* frequencybodygyroscopemeanx’: numeric -1 to 1
* frequencybodygyroscopemeany’: numeric -1 to 1
* frequencybodygyroscopemeanz’: numeric -1 to 1
* frequencybodygyroscopestdx’: numeric -1 to 1
* frequencybodygyroscopestdy’: numeric -1 to 1
* frequencybodygyroscopestdz’: numeric -1 to 1
* frequencybodygyroscopemeanfrequencyx’: numeric -1 to 1
* frequencybodygyroscopemeanfrequencyy’: numeric -1 to 1
* frequencybodygyroscopemeanfrequencyz’: numeric -1 to 1
* frequencybodyaccelerationmagmean’: numeric -1 to 1
* frequencybodyaccelerationmagstd’: numeric -1 to 1
* frequencybodyaccelerationmagmeanfrequency’: numeric -1 to 1
* frequencybodyaccelerationjerkmagmean’: numeric -1 to 1
* frequencybodyaccelerationjerkmagstd’: numeric -1 to 1
* frequencybodyaccelerationjerkmagmeanfrequency’: numeric -1 to 1
* frequencybodygyroscopemagmean’: numeric -1 to 1
* frequencybodygyroscopemagstd’: numeric -1 to 1
* frequencybodygyroscopemagmeanfrequency’: numeric -1 to 1
* frequencybodygyroscopejerkmagmean’: numeric -1 to 1
* frequencybodygyroscopejerkmagstd’: numeric -1 to 1
* frequencybodygyroscopejerkmagmeanfrequency’: numeric -1 to 1
* angletbodyaccelerationmeangravity’: numeric -1 to 1
* angletbodyaccelerationjerkmeangravitymean’: numeric -1 to 1
* angletbodygyroscopemeangravitymean’: numeric -1 to 1
* angletbodygyroscopejerkmeangravitymean’: numeric -1 to 1
* anglexgravitymean’: numeric -1 to 1
* angleygravitymean’: numeric -1 to 1
* anglezgravitymean’: numeric -1 to 1
