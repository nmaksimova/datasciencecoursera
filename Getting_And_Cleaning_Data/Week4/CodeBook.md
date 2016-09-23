CODE BOOK

The code book describes the data used in the project, as well as the processes performed to clean up the data. 

==================================================================

SUMMARY

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. The smartphone captured various data about their movements.


=========================================

THE LIST OF FILES USED IN THE PROJECT

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


More information about the files is available in README.txt. More information about the features is available in features_info.txt.

=========================================

DATA FILES THAT WERE NOT USED IN THE PROJECT

This analysis was performed using only the files above, and did not use the raw signal data. 


=========================================

PROCESSING STEPS

1.  Training and test data have been merged into a single data set

	- all of the relevant files have been read into data frames

	- appropriate headers have been added to the columns

	- Appropriate "ActivityLabel" column has been added to the Y datasets (train and test) which will be used in the STEP3

	- training and test data have been merged by using cbind and rbind functions.

2. From the combined data set were removed columns that did not contain the string "mean()" or "str", leaving 66 feature columns 
   
   and 2 columns state for "SubjectId" and "ActivityLabel"

3. Appropriate descriptive "ActivityLabel" column has been added earlier. So, in this step we just made sure that the column is in the CombinedData dataset.

4. A tidy data set was created containing the mean of each feature for each subject and each activity. 

   Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows. 

5. The tidy data set has been written to a CSV file.