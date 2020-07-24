# Getting and Cleaning Data Course Project

The original data was collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the UCI repository (where the data was obtained):
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Step by step
1.  Download the datasets from the UCI repository. The datasets contains measures from a Samsung Galaxy S smartphone.
2.  Then, merges the training and the test sets to create one data set.
3.  Extracts only the measurements on the mean and standard deviation for each measurement.
4.  Changes the activity names to descriptive names.
5.  Renames the columns labels of the data set with descriptive variable names.
6.  From the dataset in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Atrributes
 - **Subject:** ID of the subject where the measures where obtained. In total, there are 30 users.
  - **Activity**: the name of the activity performed by the subject when measurements were taken. In total, there are 6 activities:
	 - Walking
	 - Walking upstairs
	 - Walking downstairs
	 - Sitting
	 - Standing
	 - Laying
 - From **tBodyAccMeanX** to **fBodyBodyGyroJerkMagMeanFreq** are the mean and standard deviation from each sensor used. There are 78 variables associated with this measures.


## Description
30 rows
80 columns
