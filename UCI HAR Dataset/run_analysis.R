# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The purpose of this run_analysis.R script file is to provide a tidy data set 
# with the average of each variable for each activity and each subject:

# First step: Merges the training and the test sets to create one data set.

tmp1 <- read.table("train/X_train.txt")
tmp2 <- read.table("test/X_test.txt")
X <- rbind(tmp1, tmp2) # Combine tmp1 and tmp2 objects to have a single data set

tmp1 <- read.table("train/subject_train.txt")
tmp2 <- read.table("test/subject_test.txt")
S <- rbind(tmp1, tmp2) # Combine tmp1 and tmp2 objects to have a single data set

tmp1 <- read.table("train/y_train.txt")
tmp2 <- read.table("test/y_test.txt")
Y <- rbind(tmp1, tmp2) # Combine tmp1 and tmp2 objects to have a single data set

# Second step: Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt") # Get the list of all features
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) # Search for all features that matches with mean or standard deviation
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X)) # Remove brackets
names(X) <- tolower(names(X)) # Convert names to lower case

# Third step: Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt") # Get the labels with their corresponding activity names.
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))  # Remove underscore and convert names to lower case
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# Fourth step: Appropriately labels the data set with descriptive variable names.

names(S) <- "subject"
cleaned <- cbind(S, Y, X) #Create an object as a combination of 3 objects
write.table(cleaned, "merged_clean_data.txt") # Save a 10299x68 data frame where the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements

# Fifth step: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
      for (a in 1:numActivities) {
            result[row, 1] = uniqueSubjects[s]
            result[row, 2] = activities[a, 2]
            tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
            result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
            row = row+1
      }
}
write.table(result, "tidy_data_set_with_the_averages.txt",row.names=FALSE) # Save a 180x68 data frame where the first column contains subject IDs, the second column contains activity names and then the averages for each of the 66 measurements