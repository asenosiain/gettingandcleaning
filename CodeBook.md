Code Book
=========

This file explains the behavior of run_analysis.R script.

### run_analysis.R detailed description

1. The script assumes that the dataset to be analyzed is already downloaded, and the script is running on the root of the dataset.
2. The script requires the library dplyr to be available
3. It first procceeds to read the data on the files below (with their specific relative paths) files and load them on corresponding temp variables:

* ./test/X_test.txt
* ./test/Y_test.txt
* ./test/subject_test.txt
* ./train/X_train.txt
* ./train/Y_train.txt
* ./train/subject_train.txt
* ./features.txt
* ./activity_labels.txt

4. It continues to merge all the temp variables from test and train datasets
5. It filters only the variables corresponding to mean() and std() calculations. The resulting variables are the followings:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag

6. It set descriptive activity names to the activities in the corresponding temp variable
7. It then merges all the temp variables to a unique data frame
8. It uses dplyr functions to group the data frame by Activity and Subject variables
9. It then summarizes each variable calculating their mean
10. The resulting data frame is stored in a new variable, and save as an output file named output.txt

