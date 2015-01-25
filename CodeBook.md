**Origin of the Data**
------------
The dataset described herein are collected from the [UCI Website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) ([click here to download](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip))


**Convention**
------------

To label variables, the following convention is utilized:

Acronyms | Significations | Description
------------ | -------------- | -----------
t | time | time domain
f | frequency | frequency domain
Acc | Acceleration | Acceleration signals withdrawn from the 3-axis accelerometer
Average | Average | Sample mean
Body | Body | signals related to the body extracted from the accelerometer
Freq | Frequency | This term is __always__ preceded by the term Average to indicate the weighted average of the frequency components
Gravity | Gravity | signals related to the gravitational field extracted from the accelerometer
Gyro | Gyroscope | Angular velocity signal withdrawn from the 3-axis gyroscope
Jerk | Jerk | Time derivative of either the linear acceleration or the angular velocity
Mag | Magnitude | Magnitude of the signal calculated by the Euclidian norm
Mean | Mean | Expected value of the sample means (for simplicity, mean is used to signify the expected mean)
Std | Standard Deviation | Standard Deviation
X, Y or Z | | 3-dimensional spatial axis

**Note**: We make a distinction between the sample mean (an estimation of the population mean) and the population mean by naming them differently. When a variable's name have both terms "Average" and "Mean", it signifies that it is a population mean and thus we use only the qualification mean. However, when only the term "mean" is present in a variable name, it is a sample mean and we qualify it as an average.

**Variable's Units**
------------
. subjectNum : integer within [1, 30]   
. activity : {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING}   
. All other features are normalized and bounded within the real interval [-1, 1]   


**Code Book**
------------
Variable Names | Description
-------------- | -----------
subjectNum | subject number
activity | type of activity
tBodyAccAverageX.Mean | mean of body acceleration along the x axis in time domain
tBodyAccAverageY.Mean | mean of body acceleration along the y axis in time domain
tBodyAccAverageZ.Mean | mean of body acceleration along the z axis in time domain
tBodyAccStdX.Mean | average of the std deviation of the body acceleration along the x axis in time domain
tBodyAccStdY.Mean | average of the std deviation of the body acceleration along the y axis in time domain
tBodyAccStdZ.Mean | average of the std deviation of the body acceleration along the z axis in time domain
tGravityAccAverageX.Mean | mean of gravitational acceleration along the x axis in time domain in time domain
tGravityAccAverageY.Mean | mean of gravitational acceleration along the y axis in time domain in time domain
tGravityAccAverageZ.Mean | mean of gravitational acceleration along the z axis in time domain in time domain
tGravityAccStdX.Mean | average of the std deviation of the gravitational acceleration along the x axis in time domain
tGravityAccStdY.Mean | average of the std deviation of the gravitational acceleration along the y axis in time domain
tGravityAccStdZ.Mean | average of the std deviation of the gravitational acceleration along the z axis in time domain
tBodyAccJerkAverageX.Mean | mean of the body acceleration jerk along the x axis in time domain
tBodyAccJerkAverageY.Mean | mean of the body acceleration jerk along the y axis in time domain
tBodyAccJerkAverageZ.Mean | mean of the body acceleration jerk along the z axis in time domain
tBodyAccJerkStdX.Mean | average of the std deviation of the body acceleration jerk along the x axis in time domain
tBodyAccJerkStdY.Mean | average of the std deviation of the body acceleration jerk along the y axis in time domain
tBodyAccJerkStdZ.Mean | average of the std deviation of the body acceleration jerk along the z axis in time domain
tBodyGyroAverageX.Mean | mean of the angular velocity of the body along the x axis in time domain
tBodyGyroAverageY.Mean | mean of the angular velocity of the body along the y axis in time domain
tBodyGyroAverageZ.Mean | mean of the angular velocity of the body along the z axis in time domain
tBodyGyroStdX.Mean | average of the std deviation of the body's angular velocity along the x axis in time domain
tBodyGyroStdY.Mean | average of the std deviation of the body's angular velocity along the y axis in time domain
tBodyGyroStdZ.Mean | average of the std deviation of the body's angular velocity along the z axis in time domain
tBodyGyroJerkAverageX.Mean | mean of the jerk of the body's angular velocity along the x axis in time domain
tBodyGyroJerkAverageY.Mean | mean of the jerk of the body's angular velocity along the y axis in time domain
tBodyGyroJerkAverageZ.Mean | mean of the jerk of the body's angular velocity along the z axis in time domain
tBodyGyroJerkStdX.Mean | average of the std deviation of the jerk of body's angular velocity along the x axis in time domain
tBodyGyroJerkStdY.Mean | average of the std deviation of the jerk of body's angular velocity along the y axis in time domain
tBodyGyroJerkStdZ.Mean | average of the std deviation of the jerk of body's angular velocity along the z axis in time domain
tBodyAccMagAverage.Mean | mean of the body acceleration's magnitude in time domain
tBodyAccMagStd.Mean | average of the std deviation of the body acceleration's magnitude in time domain
tGravityAccMagAverage.Mean | mean of the gravitational acceleration's magnitude in time domain
tGravityAccMagStd.Mean | average of the std deviation of the gravitational acceleration's magnitude in time domain
tBodyAccJerkMagAverage.Mean | mean of the magnitude of the body acceleration's jerk in time domain
tBodyAccJerkMagStd.Mean | average of the std deviation of the body acceleration's jerk in time domain
tBodyGyroMagAverage.Mean | mean of the body angular velocity's magnitude in time domain
tBodyGyroMagStd.Mean | average of the std deviation of the body angular velocity's magnitude in time domain
tBodyGyroJerkMagAverage.Mean | mean of the jerk's magnitude of the body angular velocity in time domain
tBodyGyroJerkMagStd.Mean | mean of the jerk's std deviation of the body angular velocity in time domain
fBodyAccAverageX.Mean | mean of body acceleration along the x axis in frequency domain
fBodyAccAverageY.Mean | mean of body acceleration along the y axis in frequency domain
fBodyAccAverageZ.Mean | mean of body acceleration along the z axis in frequency domain
fBodyAccStdX.Mean | average of the std deviation of the body acceleration along the x axis in frequency domain
fBodyAccStdY.Mean | average of the std deviation of the body acceleration along the y axis in frequency domain
fBodyAccStdZ.Mean | average of the std deviation of the body acceleration along the z axis in frequency domain
fBodyAccAverageFreqX.Mean | mean of the body acceleration's frequency along the x axis in frequency domain
fBodyAccAverageFreqY.Mean | mean of the body acceleration's frequency along the y axis in frequency domain
fBodyAccAverageFreqZ.Mean | mean of the body acceleration's frequency along the z axis in frequency domain
fBodyAccJerkAverageX.Mean | mean of the body acceleration jerk along the x axis in frequency domain
fBodyAccJerkAverageY.Mean | mean of the body acceleration jerk along the y axis in frequency domain
fBodyAccJerkAverageZ.Mean | mean of the body acceleration jerk along the z axis in frequency domain
fBodyAccJerkStdX.Mean | average of the std deviation of the body acceleration jerk along the x axis in frequency domain
fBodyAccJerkStdY.Mean | average of the std deviation of the body acceleration jerk along the y axis in frequency domain
fBodyAccJerkStdZ.Mean | average of the std deviation of the body acceleration jerk along the z axis in frequency domain
fBodyAccJerkAverageFreqX.Mean | mean of the body acceleration jerk of the frequency components along the x axis in frequency domain
fBodyAccJerkAverageFreqY.Mean | mean of the body acceleration jerk of the frequency components along the y axis in frequency domain
fBodyAccJerkAverageFreqZ.Mean | mean of the body acceleration jerk of the frequency components along the z axis in frequency domain
fBodyGyroAverageX.Mean | mean of body's angular velocity along the x axis in frequency domain
fBodyGyroAverageY.Mean | mean of body's angular velocity along the y axis in frequency domain
fBodyGyroAverageZ.Mean | mean of body's angular velocity along the z axis in frequency domain
fBodyGyroStdX.Mean | average of the std deviation of the body's angular velocity along the x axis in frequency domain
fBodyGyroStdY.Mean | average of the std deviation of the body's angular velocity along the y axis in frequency domain
fBodyGyroStdZ.Mean | average of the std deviation of the body's angular velocity along the z axis in frequency domain
fBodyGyroAverageFreqX.Mean | mean of the body angular velocity's frequency along the x axis in frequency domain
fBodyGyroAverageFreqY.Mean | mean of the body angular velocity's frequency along the y axis in frequency domain
fBodyGyroAverageFreqZ.Mean | mean of the body angular velocity's frequency along the z axis in frequency domain
fBodyAccMagAverage.Mean | mean of the body acceleration's magnitude in frequency domain
fBodyAccMagStd.Mean | average of the std deviation of the body acceleration's magnitude in frequency domain
fBodyAccMagAverageFreq.Mean | mean of the frequency components of the body acceleration's magnitude in frequency domain
fBodyAccJerkMagAverage.Mean | mean of the magnitude of the body acceleration's jerk in frequency domain
fBodyAccJerkMagStd.Mean | average of the std deviation of the body acceleration's jerk in frequency domain
fBodyAccJerkMagAverageFreq.Mean | mean of the frequency components of the body acceleration's jerk magnitude in frequency domain
fBodyGyroMagAverage.Mean | mean of the body angular velocity's magnitude in frequency domain
fBodyGyroMagStd.Mean | average of the std deviation of the body angular velocity's magnitude in frequency domain
fBodyGyroMagAverageFreq.Mean | mean of the frequency components of the body angular velocity's magnitude in frequency domain
fBodyGyroJerkMagAverage.Mean | mean of the jerk's magnitude of the body angular velocity in frequency domain
fBodyGyroJerkMagStd.Mean | mean of the jerk's std deviation of the body angular velocity in frequency domain
fBodyGyroJerkMagAverageFreq.Mean | mean of the frequency components of the jerk's magnitude of the body angular velocity in frequency domain
