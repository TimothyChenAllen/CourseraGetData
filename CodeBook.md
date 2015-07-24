# Code Book

(See the [README](README.md) for an explanation of project scripts
and their interactions.)

## Data

The data for this project were collected as part of the study
of [Human Activity Recognition using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
using readings gathered from the accelerometers
from Samsung Galaxy S smartphones.  30 subjects gave measurements
while doing a variety of activities (see *Data* below for details
of the activities).

## Finished Products

The finished products of this project are:

* `feature_means.txt` - `mean`, `meanFreq`, and `std` columns, 
aggregated using `mean` - *NOTE*: Dimensions of this dataset are 180x81, as
I include `meanFreq` as well as `mean` variables.
* `README.md` - Explains the project, scripts, and interactions
* `CodeBook.md` - Explanation of the datasets, transformations,
and a human-friendly listing of variables in the `feature_means.txt` file.

## Data Transformations and Processing

Several transformations were necessary to create the tidy
dataset required by the project:

1. The data were downloaded in `zip` format and were unzipped.
2. As the data were split into `training` and `test` datasets,
it was necessary to create a single concatenated dataset.
3. Feature names were not valid `R` variable names, so a function
was written to create valid and descriptive variable names.
4. Only `mean` and `standard deviation` variables were of interest,
so `dplyr::filter` and `dplyr::select` were used to reduce the set of variables
to only those containing the words `mean`, `meanFreq`, or `std`, as well as
`Subject` and `Activity`
5. Test subject numbers and their activities were added to the
dataset.  Activites were transformed to give friendly text names.
6. To calculate the `mean` of all remaining columns in the dataset,
`aggregate.data.frame` was used.
7. The final dataset was written out using `write.table`.


## Variables

Variable Name|Explanation
-----------|--------
Subject|Number of test subject (1-30)
Activity|Activity causing readings: Laying, Sitting, Standing, Walking, Walking downstairs, Walking upstairs
MEAN_tBodyAcc.mean.X|Mean of time domain Body accelerometer (units: standard gravity units 'g') mean X
MEAN_tBodyAcc.mean.Y|Mean of time domain Body accelerometer (units: standard gravity units 'g') mean Y
MEAN_tBodyAcc.mean.Z|Mean of time domain Body accelerometer (units: standard gravity units 'g') mean Z
MEAN_tBodyAcc.std.X|Mean of time domain Body accelerometer (units: standard gravity units 'g') Standard Deviation X
MEAN_tBodyAcc.std.Y|Mean of time domain Body accelerometer (units: standard gravity units 'g') Standard Deviation Y
MEAN_tBodyAcc.std.Z|Mean of time domain Body accelerometer (units: standard gravity units 'g') Standard Deviation Z
MEAN_tGravityAcc.mean.X|Mean of time domain Gravity accelerometer (units: standard gravity units 'g') mean X
MEAN_tGravityAcc.mean.Y|Mean of time domain Gravity accelerometer (units: standard gravity units 'g') mean Y
MEAN_tGravityAcc.mean.Z|Mean of time domain Gravity accelerometer (units: standard gravity units 'g') mean Z
MEAN_tGravityAcc.std.X|Mean of time domain Gravity accelerometer (units: standard gravity units 'g') Standard Deviation X
MEAN_tGravityAcc.std.Y|Mean of time domain Gravity accelerometer (units: standard gravity units 'g') Standard Deviation Y
MEAN_tGravityAcc.std.Z|Mean of time domain Gravity accelerometer (units: standard gravity units 'g') Standard Deviation Z
MEAN_tBodyAccJerk.mean.X|Mean of time domain Body accelerometer (units: standard gravity units 'g') Jerk mean X
MEAN_tBodyAccJerk.mean.Y|Mean of time domain Body accelerometer (units: standard gravity units 'g') Jerk mean Y
MEAN_tBodyAccJerk.mean.Z|Mean of time domain Body accelerometer (units: standard gravity units 'g') Jerk mean Z
MEAN_tBodyAccJerk.std.X|Mean of time domain Body accelerometer (units: standard gravity units 'g') Jerk Standard Deviation X
MEAN_tBodyAccJerk.std.Y|Mean of time domain Body accelerometer (units: standard gravity units 'g') Jerk Standard Deviation Y
MEAN_tBodyAccJerk.std.Z|Mean of time domain Body accelerometer (units: standard gravity units 'g') Jerk Standard Deviation Z
MEAN_tBodyGyro.mean.X|Mean of time domain Body gyroscope (units: radians/second) mean X
MEAN_tBodyGyro.mean.Y|Mean of time domain Body gyroscope (units: radians/second) mean Y
MEAN_tBodyGyro.mean.Z|Mean of time domain Body gyroscope (units: radians/second) mean Z
MEAN_tBodyGyro.std.X|Mean of time domain Body gyroscope (units: radians/second) Standard Deviation X
MEAN_tBodyGyro.std.Y|Mean of time domain Body gyroscope (units: radians/second) Standard Deviation Y
MEAN_tBodyGyro.std.Z|Mean of time domain Body gyroscope (units: radians/second) Standard Deviation Z
MEAN_tBodyGyroJerk.mean.X|Mean of time domain Body gyroscope (units: radians/second) Jerk mean X
MEAN_tBodyGyroJerk.mean.Y|Mean of time domain Body gyroscope (units: radians/second) Jerk mean Y
MEAN_tBodyGyroJerk.mean.Z|Mean of time domain Body gyroscope (units: radians/second) Jerk mean Z
MEAN_tBodyGyroJerk.std.X|Mean of time domain Body gyroscope (units: radians/second) Jerk Standard Deviation X
MEAN_tBodyGyroJerk.std.Y|Mean of time domain Body gyroscope (units: radians/second) Jerk Standard Deviation Y
MEAN_tBodyGyroJerk.std.Z|Mean of time domain Body gyroscope (units: radians/second) Jerk Standard Deviation Z
MEAN_tBodyAccMag.mean|Mean of time domain Body accelerometer (units: standard gravity units 'g') magnitude mean
MEAN_tBodyAccMag.std|Mean of time domain Body accelerometer (units: standard gravity units 'g') magnitude Standard Deviation
MEAN_tGravityAccMag.mean|Mean of time domain Gravity accelerometer (units: standard gravity units 'g') magnitude mean
MEAN_tGravityAccMag.std|Mean of time domain Gravity accelerometer (units: standard gravity units 'g') magnitude Standard Deviation
MEAN_tBodyAccJerkMag.mean|Mean of time domain Body accelerometer (units: standard gravity units 'g') Jerk magnitude mean
MEAN_tBodyAccJerkMag.std|Mean of time domain Body accelerometer (units: standard gravity units 'g') Jerk magnitude Standard Deviation
MEAN_tBodyGyroMag.mean|Mean of time domain Body gyroscope (units: radians/second) magnitude mean
MEAN_tBodyGyroMag.std|Mean of time domain Body gyroscope (units: radians/second) magnitude Standard Deviation
MEAN_tBodyGyroJerkMag.mean|Mean of time domain Body gyroscope (units: radians/second) Jerk magnitude mean
MEAN_tBodyGyroJerkMag.std|Mean of time domain Body gyroscope (units: radians/second) Jerk magnitude Standard Deviation
MEAN_fBodyAcc.mean.X|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') mean X
MEAN_fBodyAcc.mean.Y|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') mean Y
MEAN_fBodyAcc.mean.Z|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') mean Z
MEAN_fBodyAcc.std.X|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Standard Deviation X
MEAN_fBodyAcc.std.Y|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Standard Deviation Y
MEAN_fBodyAcc.std.Z|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Standard Deviation Z
MEAN_fBodyAcc.meanFreq.X|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') mean frequency X
MEAN_fBodyAcc.meanFreq.Y|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') mean frequency Y
MEAN_fBodyAcc.meanFreq.Z|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') mean frequency Z
MEAN_fBodyAccJerk.mean.X|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk mean X
MEAN_fBodyAccJerk.mean.Y|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk mean Y
MEAN_fBodyAccJerk.mean.Z|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk mean Z
MEAN_fBodyAccJerk.std.X|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk Standard Deviation X
MEAN_fBodyAccJerk.std.Y|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk Standard Deviation Y
MEAN_fBodyAccJerk.std.Z|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk Standard Deviation Z
MEAN_fBodyAccJerk.meanFreq.X|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk mean frequency X
MEAN_fBodyAccJerk.meanFreq.Y|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk mean frequency Y
MEAN_fBodyAccJerk.meanFreq.Z|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') Jerk mean frequency Z
MEAN_fBodyGyro.mean.X|Mean of frequency domain Body gyroscope (units: radians/second) mean X
MEAN_fBodyGyro.mean.Y|Mean of frequency domain Body gyroscope (units: radians/second) mean Y
MEAN_fBodyGyro.mean.Z|Mean of frequency domain Body gyroscope (units: radians/second) mean Z
MEAN_fBodyGyro.std.X|Mean of frequency domain Body gyroscope (units: radians/second) Standard Deviation X
MEAN_fBodyGyro.std.Y|Mean of frequency domain Body gyroscope (units: radians/second) Standard Deviation Y
MEAN_fBodyGyro.std.Z|Mean of frequency domain Body gyroscope (units: radians/second) Standard Deviation Z
MEAN_fBodyGyro.meanFreq.X|Mean of frequency domain Body gyroscope (units: radians/second) mean frequency X
MEAN_fBodyGyro.meanFreq.Y|Mean of frequency domain Body gyroscope (units: radians/second) mean frequency Y
MEAN_fBodyGyro.meanFreq.Z|Mean of frequency domain Body gyroscope (units: radians/second) mean frequency Z
MEAN_fBodyAccMag.mean|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') magnitude mean
MEAN_fBodyAccMag.std|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') magnitude Standard Deviation
MEAN_fBodyAccMag.meanFreq|Mean of frequency domain Body accelerometer (units: standard gravity units 'g') magnitude mean frequency
MEAN_fBodyBodyAccJerkMag.mean|Mean of frequency domain Body Body accelerometer (units: standard gravity units 'g') Jerk magnitude mean
MEAN_fBodyBodyAccJerkMag.std|Mean of frequency domain Body Body accelerometer (units: standard gravity units 'g') Jerk magnitude Standard Deviation
MEAN_fBodyBodyAccJerkMag.meanFreq|Mean of frequency domain Body Body accelerometer (units: standard gravity units 'g') Jerk magnitude mean frequency
MEAN_fBodyBodyGyroMag.mean|Mean of frequency domain Body Body gyroscope (units: radians/second) magnitude mean
MEAN_fBodyBodyGyroMag.std|Mean of frequency domain Body Body gyroscope (units: radians/second) magnitude Standard Deviation
MEAN_fBodyBodyGyroMag.meanFreq|Mean of frequency domain Body Body gyroscope (units: radians/second) magnitude mean frequency
MEAN_fBodyBodyGyroJerkMag.mean|Mean of frequency domain Body Body gyroscope (units: radians/second) Jerk magnitude mean
MEAN_fBodyBodyGyroJerkMag.std|Mean of frequency domain Body Body gyroscope (units: radians/second) Jerk magnitude Standard Deviation
MEAN_fBodyBodyGyroJerkMag.meanFreq|Mean of frequency domain Body Body gyroscope (units: radians/second) Jerk magnitude mean frequency
