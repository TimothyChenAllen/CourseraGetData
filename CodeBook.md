# Data locations

* `X_test.txt`/`X_train.txt`: There are 10299 records with 561 columns
* `features.txt`: contains 561 rows explaining the variables in the 561 columns
in X_test.txt and X_train.txt

# Variable Naming Conventions
The 561 variables have a naming convention:

* `t/f` - time domain/frequency domain
* `Body/Gravity` - Separated signals for body or gravity
* `Acc/Gyro` - Signal from Accelerometer or Gyroscope
* `Jerk` - Jerk Signal (only appears with "Body" variables)
* `Mag` - Magnitude
* `mean()/std()`: estimated statistics for mean and standard deviation (there
are other estimated statistics, but we only are interested in mean and std).
79 of the 561 variables are `mean` or `std` variables.

For example, `tBodyAccJerkMag-mean()` is the mean of time-domain data from the 
accelerometer about jerk signals.  Not every combination exists

