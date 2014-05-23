rm(list=ls())
setwd('/Volumes/NO NAME/classes/Hopkins/Getting and Cleaning Data/UCI HAR Dataset/')

# Read data files
# features
features <- read.table("features.txt")

# Test files
X_test <- read.table("test/X_test.txt",  col.names=features[,2])
Y_test <- read.table("test/Y_test.txt")
subject_test <- read.table("test/subject_test.txt")
activity_labels <- read.table("activity_labels.txt")

# Train files
X_train <- read.table("train/X_train.txt",  col.names=features[,2])
Y_train <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Merges the training and the test sets to create one data set.
X_merged <- rbind(X_test, X_train)
Y_merged <- rbind(Y_test, Y_train)

Y_train_activity <- merge(Y_train, activity_labels)
Y_test_activity <- merge(Y_test,activity_labels)

train_data <- cbind(subject_train,Y_train_activity)
test_data <- cbind(subject_test,Y_test_activity)

## now then we'll merge the test and training data together
all_data <- rbind(train_data,test_data)

# Extracts only the measurements on the mean and standard deviation for each measurement. 

#subject_merged <- rbind(subject_test, subject_train)

# 1. Merges the training and the test sets to create one data set.
 
X <- rbind(X_test, X_train)

 
features_Mean_STD <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_std <- X_merged[,features_Mean_STD[,1]]



# Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
Y_merged_activity <- merge(activity_labels,Y_merged)


library(data.table) 

Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
