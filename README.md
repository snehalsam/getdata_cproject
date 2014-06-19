Course Project: Getting and Cleaning Data 
========================================================

## MERGING

We first read the test data into a data frame 'testd' and the training data into
'traind'. Both data frames are merged with 'rbind' into data frame 'mergedset'


## EXTRACTING MEAN AND STD

We read the measurement names into a data frame 'features'. Using grep
we find the rows with 'mean' and 'std' in the feature names and save it 
to a data frame 'ftmean'. 

The new subset 'meanset' with just the mean and standard deviation measurements is created 
using 'ftmean' as column numbers to subset the massive 'mergedset'.



## NAMING

We first set the column names of the measurements in 'meanset' by subsetting 'features'
with 'ftmean'. 

We read the subject ids into a data frame 'subject_test' and activity ids are read 
into a data frame 'activity_test'. Using cbind these two are merged into 'testid'. Similarly subject and 
activity ids for the training data are read and merged into 'trainid'.

Both these data frames are merged into 'mergedids' with rbind and their column names 
set to 'subjectid' and 'activityid'.

Finally these are added to the 'meanset' data frame using cbind.

The 'activityid' was read in as a factor and to give it a descriptive name we need to
change the levels. We read in the activity labels into a data frame 'act_labels' and use that 
to set the levels of 'meanset'



## TIDYSET

The data.table package is really useful for fast grouping so let's load that up and change 
'meanset' to a data table. Next we create 'tidyset' with the mean of each column grouped first
by subject and then by activity.


