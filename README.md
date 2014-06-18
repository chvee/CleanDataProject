CleanDataProject
================

Script requires three files to be in the appropriate locations
x_test.txt must be in a subfolder called test
x_train.txt must be in a subfolder called train
features.txt must be in the root folder

Script will read all three files into memory
Script then uses rbind to combine the test and training data into one dataframe
The features file contains detailed column headers. The names function is used to bind the column headers to the dataframe

We only needed to keep the mean and standard deviation values. The variable names contained mean or std. 
Using str_match we search for the string "mean" or "std" and return the location for each variable name that matches

The loop creates a list of all the columns to be removed as they are un-needed data. (variable is called remove)

Function then uses the list to remove those columns and writes the data to a file called CombinedDataSet.txt

A new data frame called tidyData is created that contains all the means of the remaining columns
tidyData is then written to a file called tidyData.txt

