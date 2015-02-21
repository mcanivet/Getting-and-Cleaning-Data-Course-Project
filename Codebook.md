---
title: "Getting and Cleaning Data - Submission Codebook"
author: "MAC"
date: "Saturday, February 21, 2015"
---

# Code Book

## Intro

This document describes the code inside run_analysis.R

The code is splitted into the following sections:
* Activity
* Subject
* Data Loading, Labelling and Subsetting
* Data Binding and Merging
* Summary Data
* Write file

## Data source vs Data output

Please download the UCI HAR dataset from the provided link in coursera.

You must have read the README.txt and features_info.txt files contained in the downloaded package prior to reading the below.

The data source contains 561 variables, which are a set of variables that were estimated from the signals. These signals were used to estimate variables of the feature vector for each of the 33 patterns.

We are interested in only the means and standard deviations from the data file found in the downloaded package.

Therefore our output should contain 33 * 2 = 66 variables columns, and additionally 2 columns to the left for the Activity and the Subject. Our output does contain 68 variables in total.

## Units

There are three different units:
* The variables which labels include GravityAcc are expressed in standard gravity units 'g'
* The variables which labels include BodyAcc are expressed in standard gravity units too 'g'
* The variables which labels include BodyGyro are expressend in radians/second.

## Code walkthrough

### Activity

In this section we load:
* The mapping of Activity Codes and Activity Labels
* The y_test and y-train tables

### Subject

In this section we load:
* The test subject for each observation from subject_test.txt
* the train subject for each obervation from subject_train.txt

### Data Loading, labelling and subsetting

In this section:
* The data from X_train.txt and X_test.txt is loaded
* The labels are loaded from features.txt is loaded
* The data table labels are changed using the labels from features.txt
* From the data table we only keep columns for which the labels have either "mean()" or "std()"

### Data Binding and Merging

In this section:
* The data tables X_train and Y_train are column binded with their respective Subject and Activity column 
* Both train and test tables are binded into Merged_data that is considered as the tidy data set

### Summary Data

In this section:
* The average of each column is calculated per activity per subject using *ddply()* function
* The Activity is mapped to the activity referential loaded in section 1 and the Activity is changed from Code to Label

### Write file

Finally, the output summary is saved in the current working directory as **Average_MeansandStd_bySubjectAndActivity.txt**.
