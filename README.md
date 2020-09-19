For creating a tidy data set of wearable computing data originally from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Description of run_analysis.R script takes source data from the unzipped file of the UCI HAR Dataset directory, imports it into R, and transforms it into a tidy data subset.

The script performs the following operations to import, clean, and 
    transform the data set. These steps are also indicated in comments 
    throughout the .R file. 
It follows the goals step by step.

Step 1:
 Read all the test and training files: y_test.txt, subject_test.txt and X_test.txt.
Combine the files to a data frame in the form of subjects, labels, the rest of the data.
Step 2:
Read the features from features.txt and filter it to only leave features that are either means ("mean()") or standard deviations ("std()"). The reason for leaving out meanFreq() is that the goal for this step is to only include means and standard deviations of measurements, of which meanFreq() is neither.
A new data frame is then created that includes subjects, labels and the described features.
Step 3:
name the columns of x_total with the features of mean and standard deviation names,y_total with activity and sub_total with
subject.
Step 4 :
merge data tables sub_total, y_total, x_total into final data as total and change activity,subject variables into factor variables.
step 5 :
create a summary tidydata set  from the final dataset total with the average of each variable for each activity and each subject. 

Final step:

Write the new tidy set into a text file called tidydata.txt, formatted similarly to the original files.