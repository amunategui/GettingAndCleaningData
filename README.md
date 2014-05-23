The file run_analysis_R requires the UCI HAR Dataset folder to be in the same location in order to run.

The script will read all the files. It will append feature column names to X_test and X_train. It will also add 'activity' as a colum to the activity_labels file and add 'subject' to both subject_train and subject_test files. It will merge all the files together. Starting with a cbind on subjects and tests, then and rbind on X test and train, and Y test and train. 

It will then use grep to get all columns with the word mean or std in it. It will then merge everything together into the all_together data frame and apply the aggregate function to find the average of subject and activity for all values. 

As a last step it will write the final data frame to a text file. 



