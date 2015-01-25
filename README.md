**Getting And Cleaning the Dataset "Human Activity Recognition Using Smartphones"**
-----------
Ngoc Lan Nguyen  
2015-01-22  
    
**Description**
-----------
This file describes the use of the script *run_analysis.R*  that is used to clean and pre-process a dataset (Human Activity Recognition Using Smartphones) from its raw form into a tidy data set for further analysis.


**Prerequisite**
------------
Before using this script, you should have the following setup:

 1. R version 3.1.2 or newer.
 2. Rstudio (optional, but much more attractive than the boring command-line) with the latest version.
 3. The *dplyr* package version 0.4.1 or newer (run the command: ***install.packages(dplyr)*** to install it).
 4. the *magrittr* package version 1.5 or newer installed.
 4. Download and extract the dataset package from the [UCI Website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) ([click here to download](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip))

The set of data extracted should be placed inside the working directory, along with the script *run_analysis.R*. Also, you need to rename the initial directory name "*UCI HAR Dataset*" to "*UCI_HAR_Dataset*".


**Running the script**
-----------------
To run the script, enter the following command in Rstudio: 

> *run_analysis()*

The next sections describe the input data files (raw dataset) used by the script and the output data file (processed dataset) that it produces. A detail description of the processings is provided in the last section.


**The Raw Dataset**
------------
These inputs are collected from the embedded accelerometer and gyroscope of the Samsung Galaxy S II smartphones that were fixed on the waist of 30 different volunteers. See "*CodeBood.md*" file for more details about the dataset.

The script runs on the raw data extracted from the following files:

 - "*activity_labels.txt*" is the list of codes used to described the activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING).
 - "*feature.txt*" lists the different feature names.
 - "*train/X_train.txt*" is the training dataset.
 - "*train/y_train.txt*" is the training labels.
 - "*train/subject_train.txt*" identifies the subjects on which training data were collected.
 - "*test/X_test.txt*" is the testing dataset.
 - "*test/y_test.txt*" is the testing labels.
 - "*test/subject_test.txt*" identifies the subjects on which testing data were collected.


**The Tidy Dataset**
----------------
Running the script will produce a table of 81 variables with 180 observations each. The table is save to a text file named "*meanFeatures.txt*" in the current working directory. This table is intended to be read by a script for further analysis. To load this dataset, the following R command is recommended:

> *read.table*(*"./meanFeatures.txt", header=TRUE*)


**Detail Description of The Cleaning Process**
--------------------------------------

In this section, we describe the processes used to summarize our tidy dataset. For a more detail about the R commands used to execute each of the mentionned steps, the reader is invited to consult the script *run_analysis.R*.

The following steps are performed to transform the raw dataset to a tidy one:

 1. The text files ("*X_train.txt*", "*y_train.txt*", "*subject_train.txt*", "*X_test.txt*", "*y_test.txt*", "*subject_test.txt*") are read from the *train* and *test* directories and loaded, respectively, to the training data *trainDF* and the testing data *testDF*.   
    
 2. The resulted test data frame (*testDF*) and train data data frame (*trainDF*) are then appended to each other to form a unique dataset (*mergeDF*). *mergeDF* is a table of 563 variables (features) x 10299 observations.
 
 3. The file "*feature.txt*" is then read. It contains the variable's names that are used to name the variables (columns) of the dataset *mergeDF* . A prior reformatting of their syntaxes is however necessary to avoid run-time errors in the R environment. The reformatting consists of removing irregular characters such as "()", "-" or "," and replacing syntax redundancies (eg. "BodyBody" is replaced with "Body"). Also, to facilitate their readings, we adopt the well-known Camel case notation to names our variables. Moreover, some variables are duplicated and thus, could be removed at this stage, but since they will be discarded anyway in step 4, their removal at this step is not important.

 4. Since the requirement for the summarization (step 5) concerns only the means and the standard deviations of the features, the variable names that bear the terms "*mean*" and "*std*" are identified and selected and all the other variables are dropped. A beside note concerning variables named *angles_*: these are also eliminated in our selection since they are not a mean of some angles, but rather angles of some variable means which do not correspond to the requirement. The result for this step is our initial "tidy" dataset (*tidyDF*).

 5. The summarization process that we are interested in here is the average for each of the features (or variables) according to the subject and his activities. Therefore, all the possible combinations of "*subject/activity*" are created and then, the average's computation is performed for each feature according to each of those combinations. This table of averages, named *meanTidyDF* in our script, is our final tidy dataset.

 6. Our last step is to rename all the activity id codes of the processed dataset with some more intuitive names. For instance, the use of a word LAYING is more meaningful than the number 6. The correspondences of these codes and their descriptive name is located in the file "*activity_labels.txt*". The resulted data frame is then written to the file "*meanFeatures.txt*" as output of the script.

**Note**: this script was developed and tested on an AMD-64 machine with the Linux OS (Ubuntu 12.04LTS 64bit) and the above softwares installed.

**Thanks**
------
A special thanks to all the contributors from the "Getting And Cleaning Datasets" discussion forum for their enriching comments and helps.
