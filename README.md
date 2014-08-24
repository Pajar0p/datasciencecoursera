RAW to TIDT data for: "Human Activity Recognition Using Smartphones Data Set"
===================

*The file "run_analysis.R" is code to be run in the R software* 

The purpuse of the code is to take the RAW dataset from the *"Human Activity Recognition Using Smartphones Data Set"* and convert it to a Tidy Dateset showing the average of each variable for each activity and each subject.

The file "run_analysis.R" contain a R function called getTidyData.

The only *input* for getTidyData is the path(string) where the folder called "UCI HAR Dataset" from the .zip is located  (see information at button of the page further information of the .zip).


The *output* is a data.frame the the average of each variable for each activity and each subject


it should be a data.frame with 180 rows and variables 68 variables


The dataset is available in the followin url:

[.zip file with the datasets](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

For more information of the dataset please check the below url:
[Furthe information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

