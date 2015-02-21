---
title: "Getting and Cleaning Data - Submission Codebook"
author: "MAC"
date: "Saturday, February 21, 2015"
---

## Code Book

This document describes the code inside run_analysis.R

The code is splitted into the following sections:
* Activity
* Subject
* Data Loading, Labelling and Subsetting
* Data Binding and Merging
* Summary Data
* Write file

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
* The average of each column is calculated per activity per subject
* The Activity is mapped to the activity referential loaded in section 1 and the Activity is changed from Code to Label

### Write file

Finally, the output summary is saved in the current working directory as **Average_MeansandStd_bySubjectAndActivity.txt**.
