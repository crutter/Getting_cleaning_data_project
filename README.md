# Getting_cleaning_data_project
run_analysis.R pulls data from the UCI HAR Dataset folder with subdirectories test and train.
In order for it to work appropriately, setworking director to the UCI HAR Dataset folder.
Data from the testing and training portion of the data are merged into one set. Descriptive labels are
applied to the dataset, which is then rearranged by subject number and activity. Finally, the data
is melted into narrow format and then cast into wide format with the mean used as the aggregating function.
Returns data frame 'tidy_data' in the global environment that can be written to a txt or csv format.


Code book for tidy data set:
- Subject
    - 1-30
    - Unique subject variable
- Activity
    - 1-6
    - 1 = Walking
    - 2 = Walking_upstairs
    - 3 = Walking_downstairs
    - 4 = Sitting
    - 5 = Standing
    - 6 = Laying
- Variables
    - Various means and standard deviations of movement measurements in the X, Y, Z planes
    - Body
    - Gravity
    - Means denoted with mean()
    - Standard deviations denoted with std()
    - Acc - measures of accelerometer data
    - Gyro - measures of gyroscope data
    - Jerk - body linear acceleration and angular velocity derived in time
    - Mag - magnitude calculated using the Euclidean norm
    - t - time domain signals
    - f - frequency domain signals
