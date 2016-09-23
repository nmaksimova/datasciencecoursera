## Getting and Cleaning Data Course Project

The goal of the project was to to prepare tidy data that can be used for later analysis by reading in the ["Human Activity Recognition Using Smartphones"] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) data set and cleaning up the data.

**Here are the steps that must be performed before running the R script:**

1. Download the [data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.
3. Move ALL of the following files to the SAME DIRECTORY as the R script:
	* `features.txt`
	* `subject_train.txt`
	* `subject_test.txt`
	* `X_train.txt`
	* `X_test.txt`
	* `y_train.txt`
	* `y_test.txt`

**Once those steps are complete, you can run the R script run_analysis.R. It requires the reshape2 package, which can be downloaded from CRAN.

**The output of the R script is a tidy data set, tidy.csv**

You can read more about the data and the analysis in the code book.