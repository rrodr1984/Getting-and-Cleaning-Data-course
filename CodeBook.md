Getting and Cleaning Data Course Project Code Book
===================================================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 Full description of the original data is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script "run_analysis.R" provides a tidy data set with the average of each variable for each activity and each subject.

* Merges the training and test sets to create one data set as following:
  1.- train/X_train.txt with test/X_test.txt: the data frame generated is a 10299x561 data frame ("Number of Instances: 10299" and "Number of Attributes: 561").
  2.- train/subject_train.txt with test/subject_test.txt: the data frame generated is a 10299x1 data frame with subject IDs
  3.- train/y_train.txt with test/y_test.txt: the data frame generated is a 10299x1 data frame with activity IDs.

* Reads features.txt for extracting only the measurements on the mean and standard deviation for each measurement. 
  The result is a 10299x66 data frame (from original 561 attributes, only 66 are measurements on the mean and standard deviation). 
  All measurements are in the range (-1, 1).

* Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set as following:

        walking
        
        walkingupstairs
        
        walkingdownstairs
        
        sitting
        
        standing
        
        laying

* The script also appropriately labels the data set with descriptive variable names: 
  all feature names (attributes) and activity names are converted to lower case. Also underscores and brackets () are removed. 
  Then a 10299x66 data frame containing features is merged with a 10299x1 data frame containing activity labels and subject IDs. 
  The 10299x68 data frame generated is saved in a txt file called "merged_clean_data.txt", where the first column contains subject IDs (integers between 1 and 30 inclusive), the second column activity names, and the last 66 columns are measurements. 
  The names of the attributes are similar to the following:

        tbodyacc-mean-x 
        
        tbodyacc-mean-y 
        
        tbodyacc-mean-z 
        
        tbodyacc-std-x 
        
        tbodyacc-std-y 
        
        tbodyacc-std-z 
        
        tgravityacc-mean-x 
        
        tgravityacc-mean-y

* Finally, the script creates a second, independent tidy data set with the average of each measurement for each activity and each subject. 
The result 180x68 data frame is saved in a txt file called "tidy_data_set_with_the_averages.txt", where the first column contains subject IDs, the second column contains activity names, and the last 66 columns are the averages of each of the 66 measurement.
The txt file contains 180 rows with the averages of the combination of 30 subjects and 6 activities.
