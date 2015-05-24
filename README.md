# Getting-and-Cleaning-Data-course
This is a repository to be used during the course of Getting and Cleaning Data of Data Science Specialization

## Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

* Download and unzip the following file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a local folder like C:\Users\yourname\Documents\Github\datasciencecoursera\Getting_and_cleaning_data\

* Copy the script file run_analysis.R into C:\Users\yourname\Documents\Github\datasciencecoursera\Getting_and_cleaning_data\UCI HAR Dataset\

* If you´re using RStudio, you have to execute following commands: 
  setwd("C:\\\\Users\\\\yourname\\\\Documents\\\\Github\\\\datasciencecoursera\\\\Getting_and_cleaning_data\\\\UCI HAR Dataset\\\\")
  source("run_analysis.R")

* Execute following command for reading the dataset:
  data <- read.table("tidy_data_set_with_the_averages.txt")
  The object data contains 180 rows and 68 columns. The 180 rows are built based on the combination of each activity and each   subject (there are 30 subjects and 6 activities). 
  Note that the run_analysis.R script file has no assumptions on numbers of records, only on locations of files.
