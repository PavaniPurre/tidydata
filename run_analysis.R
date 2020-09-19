# load libraries
library(dplyr) 
# read train data 
x_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
y_train   <- read.table("UCI HAR Dataset\\train\\y_train.txt")
sub_train <-read.table("UCI HAR Dataset\\train\\subject_train.txt")


# read test data 
x_test   <- read.table("UCI HAR Dataset\\test\\X_test.txt")

y_test   <- read.table("UCI HAR Dataset\\test\\y_test.txt")

sub_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")


# read features description 
features <- read.table("UCI HAR Dataset\\features.txt")


# read activity labels 
activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt") 

# merge of training and test sets
x_total   <- rbind(x_train, x_test)
y_total   <- rbind(y_train, y_test) 
sub_total <- rbind(sub_train, sub_test) 
# keep only measurements for mean and standard deviation 
# option only retain features of mean and standard deviation
features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

x_total      <- x_total[,features.mean.std[,1]]

# name columns
colnames(x_total)   <- features.mean.std[,2]
colnames(y_total)   <- "activity"
colnames(sub_total) <- "subject"

# merge final dataset
total <- cbind(sub_total, y_total, x_total)

# turn activities & subjects into factors 
total$activity <- factor(total$activity, levels = activity_labels[,1], labels = activity_labels[,2]) 

total$subject  <- as.factor(total$subject) 

# create a summary independent tidy dataset from final dataset 
# with the average of each variable for each activity and each subject. 
total_mean <- total %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 

# export summary dataset
write.table(total_mean, file = "tidydata.txt", row.names = FALSE, col.names = TRUE) 
