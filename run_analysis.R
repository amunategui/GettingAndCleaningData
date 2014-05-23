rm(list=ls())
setwd('/Users/manuelamunategui/GettingAndCleaningData/')

# features
# Uses descriptive activity names to name the activities in the data set
features <- read.table("UCI HAR Dataset/features.txt")

# Test files
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",  col.names=features[,2])
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=('subject'))
Y_subject_test <- cbind(subject_test, Y_test)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c('V1', 'activity'))

# Train files
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",  col.names=features[,2])
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=('subject'))
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
Y_subject_train <- cbind(subject_train, Y_train)

# Merges the training and the test sets to create one data set.
X_merged <- rbind(X_test, X_train)
Y_merged <- rbind(Y_subject_test, Y_subject_train)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
features_of_interest <- features[grep("(mean|std)\\(", features[,2]),]
X_mean_and_std <- X_merged[,features_of_interest[,1]]

# Appropriately label the data set with descriptive activity names. 
Y_merged_activity <- merge(Y_merged, activity_labels)

## now then we'll merge the test and training data together
all_together <- cbind(Y_merged_activity, X_mean_and_std)
all_together <- all_together[-1]

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
second_tidy_data_set <- aggregate( . ~ subject + activity, data=all_together, mean)

write.table(second_tidy_data_set, "tidy_data_set.txt", sep="\t")

