---
title: "Getting and Cleaning Data - Submission Codebook"
author: "MAC"
date: "Saturday, February 21, 2015"
output: html_document
---

### Introduction

This repo contains my course project to Coursera "Getting And Cleaning Data" course that is part of Data Science specialization.

For more info, kindly refer to the Codebook.md file.

### Assumptions

The code is built assuming you have downloaded and unzipped the download file into your current working directory in R.

### Running the script

There is just one script called  run_analysis.R . It contains all functions and code to do the following:

1.Read data

2.Do some transformations

3.Write output data to a txt file directly under the working directory

### Output

The output is a text file named **Average_MeansAndStd_bySubjectAndActivity.txt** using *write.table()* with option *row.names = FALSE*

The markdown file named CodeBook.md explains the funtions in more details. Moreover, the comments associated with the run_analysis.R function are sufficient for understanding the operations.
