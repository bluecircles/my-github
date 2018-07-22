###################################  
## Q1 READ AND MERGE THE DATA
###################################
## Read Activity Lables and Features and Assign names
a_labels <- read.csv("./activity_labels.txt",sep="", header = FALSE)
features <- read.csv("./features.txt",sep="", header = FALSE)
colnames(a_labels) <- c("activity_id", "activity_name")
colnames(features) <- c("feature_id", "feature_name")

## Read the training Sets
train_subject <- read.csv("./train/subject_train.txt",sep="", header = FALSE)
train_x <- read.csv("./train/X_train.txt", sep="", header = FALSE)
train_y <- read.csv("./train/y_train.txt", sep="", header = FALSE)

## Read the test Sets
test_subject <- read.csv("./test/subject_test.txt", sep="", header = FALSE)
test_x <- read.csv("./test/X_test.txt", sep="", header = FALSE)
test_y <- read.csv("./test/y_test.txt", sep="", header = FALSE)

## Add the two data frames together and rename X, Y to match the instructions
merged_subject <- rbind(train_subject,test_subject)
merged_set <- rbind(train_x,test_x)
merged_activity <- rbind(train_y, test_y)

## Assign the Feature names to the merged set
colnames(merged_set) <- features[,2]

####################################  
## Q2 EXTRACT MEAN AND ST DEV
####################################
## Subset the merged_set for the mean st. dev
merged_set_subset <- merged_set[,grepl("mean|std", names(merged_set), ignore.case = TRUE)]

#####################################  
## Q3 ASSIGN CLEAR FOR ACTIVITIES
#####################################
merged_activity_names = merge(y = merged_activity ,x = a_labels,by.y="V1",by.x="activity_id")

#####################################  
## Q4 ADD LABEL NAMES ON VARIABLES
#####################################
## Combine all data frames together and add clear variable 
combined_data <-cbind(merged_subject, merged_activity_names,merged_set_subset)
names(combined_data)[1:3] <- c("subject_id", "activity_id", "activity_name")


#####################################  
## Q5 CREATE SECOND DATA SET
#####################################
## Create second indendent data set with group by subject id and with activity id
## Load the dyplr package
library(dplyr)

## Fix duplicated column names
## Find the duplicate values and change them
unique_names <- make.names(names=names(combined_data), unique=TRUE, allow_ = TRUE)
names(combined_data) <- unique_names

## Apply the group_by and summarise functions on the 
## data frame with the unique names

grouped <- group_by(combined_data, subject_id, activity_id, activity_name)
second_data_set <- summarise_each(grouped,funs(mean))

## Save the data as txt file
write.table(second_data_set, "TidyDataSet.txt",row.name=FALSE)

