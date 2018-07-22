# Information about the data can be found below
# Data Source
The data used in this analysis come from the the webpage (links below). 

A link for some information regaridng the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The actual data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data Origin
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

# Data Information
Coming directly from the data source download:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# Data Analysis
All the steps with regards to getting and cleaning data were performed in an attampt to answer the following 5 questions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script run_analysis.R has a very detailed explanation of all the steps performed to answer the questions above:

# Data Explained
All column names on the final output can be found below. Simply running names(second_data_set) after running the R script will give the output below.

[1] "subject_id" <- refes to the ID of the subject. Ranging from 1-30               
 [2] "activity_id" <- the ID of the activity that the subject was performing. Ranging from 1-6                
 [3] "activity_name" <- the actual name of the activity. Inclues values:WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING
 [4] "tBodyAcc.mean...X" <- all the variables below are those the disctibe the measurement of each observation
 [5] "tBodyAcc.mean...Y"              
 [6] "tBodyAcc.mean...Z"              
 [7] "tBodyAcc.std...X"               
 [8] "tBodyAcc.std...Y"               
 [9] "tBodyAcc.std...Z"               
[10] "tGravityAcc.mean...X"           
[11] "tGravityAcc.mean...Y"           
[12] "tGravityAcc.mean...Z"           
[13] "tGravityAcc.std...X"            
[14] "tGravityAcc.std...Y"            
[15] "tGravityAcc.std...Z"            
[16] "tBodyAccJerk.mean...X"          
[17] "tBodyAccJerk.mean...Y"          
[18] "tBodyAccJerk.mean...Z"          
[19] "tBodyAccJerk.std...X"           
[20] "tBodyAccJerk.std...Y"           
[21] "tBodyAccJerk.std...Z"           
[22] "tBodyGyro.mean...X"             
[23] "tBodyGyro.mean...Y"             
[24] "tBodyGyro.mean...Z"             
[25] "tBodyGyro.std...X"              
[26] "tBodyGyro.std...Y"              
[27] "tBodyGyro.std...Z"              
[28] "tBodyGyroJerk.mean...X"         
[29] "tBodyGyroJerk.mean...Y"         
[30] "tBodyGyroJerk.mean...Z"         
[31] "tBodyGyroJerk.std...X"          
[32] "tBodyGyroJerk.std...Y"          
[33] "tBodyGyroJerk.std...Z"          
[34] "tBodyAccMag.mean.."             
[35] "tBodyAccMag.std.."              
[36] "tGravityAccMag.mean.."          
[37] "tGravityAccMag.std.."           
[38] "tBodyAccJerkMag.mean.."         
[39] "tBodyAccJerkMag.std.."          
[40] "tBodyGyroMag.mean.."            
[41] "tBodyGyroMag.std.."             
[42] "tBodyGyroJerkMag.mean.."        
[43] "tBodyGyroJerkMag.std.."         
[44] "fBodyAcc.mean...X"              
[45] "fBodyAcc.mean...Y"              
[46] "fBodyAcc.mean...Z"              
[47] "fBodyAcc.std...X"               
[48] "fBodyAcc.std...Y"               
[49] "fBodyAcc.std...Z"               
[50] "fBodyAcc.meanFreq...X"          
[51] "fBodyAcc.meanFreq...Y"          
[52] "fBodyAcc.meanFreq...Z"          
[53] "fBodyAccJerk.mean...X"          
[54] "fBodyAccJerk.mean...Y"          
[55] "fBodyAccJerk.mean...Z"          
[56] "fBodyAccJerk.std...X"           
[57] "fBodyAccJerk.std...Y"           
[58] "fBodyAccJerk.std...Z"           
[59] "fBodyAccJerk.meanFreq...X"      
[60] "fBodyAccJerk.meanFreq...Y"      
[61] "fBodyAccJerk.meanFreq...Z"      
[62] "fBodyGyro.mean...X"             
[63] "fBodyGyro.mean...Y"             
[64] "fBodyGyro.mean...Z"             
[65] "fBodyGyro.std...X"              
[66] "fBodyGyro.std...Y"              
[67] "fBodyGyro.std...Z"              
[68] "fBodyGyro.meanFreq...X"         
[69] "fBodyGyro.meanFreq...Y"         
[70] "fBodyGyro.meanFreq...Z"         
[71] "fBodyAccMag.mean.."             
[72] "fBodyAccMag.std.."              
[73] "fBodyAccMag.meanFreq.."         
[74] "fBodyBodyAccJerkMag.mean.."     
[75] "fBodyBodyAccJerkMag.std.."      
[76] "fBodyBodyAccJerkMag.meanFreq.." 
[77] "fBodyBodyGyroMag.mean.."        
[78] "fBodyBodyGyroMag.std.."         
[79] "fBodyBodyGyroMag.meanFreq.."    
[80] "fBodyBodyGyroJerkMag.mean.."    
[81] "fBodyBodyGyroJerkMag.std.."     
[82] "fBodyBodyGyroJerkMag.meanFreq.."

