library(reshape2)


# Info to load datasets

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

zip_dir <- "./dataset_compress"
data_dir <- "./dataset"



# Download and extract the datasets

if (!file.exists(zip_dir)) {
   
  dir.create(zip_dir)
  download.file(url = url, destfile = paste(zip_dir, "/dataset.zip", sep = ""))
}

if (!file.exists(data_dir)) {
 
  dir.create(data_dir)
  unzip(zipfile = paste(zip_dir, "/dataset.zip", sep = ""), exdir = data_dir)
}



# Read each file in the directory

train_x <- read.table(paste(data_dir, "/UCI HAR Dataset/train/X_train.txt", sep = ""))
train_y <- read.table(paste(data_dir, "/UCI HAR Dataset/train/y_train.txt", sep = ""))
train_s <- read.table(paste(data_dir, "/UCI HAR Dataset/train/subject_train.txt", sep = ""))

test_x <- read.table(paste(data_dir, "/UCI HAR Dataset/test/X_test.txt", sep = ""))
test_y <- read.table(paste(data_dir, "/UCI HAR Dataset/test/y_test.txt", sep = ""))
test_s <- read.table(paste(data_dir, "/UCI HAR Dataset/test/subject_test.txt", sep = ""))



# Read files that contains the labels and feature information

labels <- read.table(paste(data_dir, "/UCI HAR Dataset/activity_labels.txt", sep = ""))
features <- read.table(paste(data_dir, "/UCI HAR Dataset/features.txt", sep = ""))



# Merges the training and the test sets to create one data set.

data_x <- rbind(train_x, test_x)
data_y <- rbind(train_y, test_y)
data_s <- rbind(train_s, test_s)



# Extracts only the measurements on the mean and standard deviation for each measurement.

columns <- grep("-(mean|std).*", features$V2)
names_columns <- features[columns, 2]
names_columns <- gsub("-mean", "Mean", names_columns)
names_columns <- gsub("-std", "Std", names_columns)
names_columns <- gsub("[-()]", "", names_columns)



# Uses descriptive activity names to name the activities in the data set

code_labels <- labels$V1
name_labels <- labels$V2

data_y$V1 <- factor(data_y$V1, levels = code_labels, labels = name_labels)



# Appropriately labels the data set with descriptive variable names.

final_data <- cbind(data_s, data_x[columns], data_y)
colnames(final_data) <- c("Subject", names_columns, "Activity")



# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.

tmp_data <- melt(final_data, id = c("Subject", "Activity"))
tidy_data <- dcast(tmp_data, Subject + Activity ~ variable, mean)



# Export the final tidy dataset

write.table(tidy_data, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)
