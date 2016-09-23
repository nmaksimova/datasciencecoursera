## Create one R script called run_analysis.R that does the following.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.

## Prep STEP - Install the reshape2 package

## install.packages("reshape2")
library(reshape2)
library(data.table)

## Step 1. 
## Merging the training and test data to create one data set

##Reading the data into the data frames

SubjectTrain <- read.table("subject_train.txt")
SubjectTest <- read.table("subject_test.txt")
XTrain <- read.table("X_train.txt")
XTest <- read.table("X_test.txt")
YTrain <- read.table("y_train.txt")
YTest <- read.table("y_test.txt")

## Loading activity labels

ActivityLabels <- read.table("activity_labels.txt")

## Loading the list of all features
features <- read.table("features.txt")

## Adding column name for subject (test and training)
names(SubjectTrain) <- "SubjectId"
names(SubjectTest) <- "SubjectId"

## Adding column names for X (measurements) data sets
names(XTrain) <- features$V2
names(XTest) <- features$V2

## Adding activity labels names to the Y files (as the second column)
YTrain[,2] <- ActivityLabels[YTrain[,1],2]
YTest[,2] <- ActivityLabels[YTest[,1],2]

## Adding column names for Y (label) files
## Will need these column names on STEP 4
names(YTrain) <- c("ActivityID", "ActivityLabel")
names(YTest) <- c("ActivityID", "ActivityLabel")

## Bind the data into one dataset

TestData <- cbind(SubjectTest,YTest, XTest)
TrainData <- cbind(SubjectTrain, YTrain, XTrain)

## Merging train and test data into one dataset

CombinedData <- rbind(TrainData, TestData)

## STEP 2. 
## Extracts only the measurements on the mean and standard deviation for each measurement.

## Gathering columns containing mean() or std() in one data set

meanstd <- grepl("mean\\(\\)|std\\(\\)", names(CombinedData))

## Making sure that we take "SubjectID" and "ActivitLabel" columns since we want to keep them

meanstd[1] <- TRUE
meanstd[3] <- TRUE

## Taking only the columns we need

CombinedData <- CombinedData[, meanstd]

## STEP 3.
## Uses descriptive activity names to name the activities in the data set
## This was made earlier in the code in STEP1
names(CombinedData)

## STEP 4.
## Appropriately labels the data set with descriptive variable names.
## Making sure that "ActivityLabel" column already here
names(CombinedData[2])

## STEP 5. 
## From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

melted <- melt(CombinedData, id=c("SubjectId", "ActivityLabel"))
TidyData <- dcast(melted, SubjectId + ActivityLabel ~ variable, mean)

# write the tidy data set to a file
write.table(TidyData, "tidy.txt", row.names=FALSE)