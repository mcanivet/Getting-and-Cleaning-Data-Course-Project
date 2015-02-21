run_analysis <- function() {
      
      # Merges the training and the test sets to create one data set.
      # Extracts only the measurements on the mean and standard deviation for each measurement. 
      # Uses descriptive activity names to name the activities in the data set
      # Appropriately labels the data set with descriptive variable names. 
      # From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      library(plyr)
      library(dplyr)
      
      #---------------
      # ASSUMPTIONS
      #---------------
      
      # Zip file is unzipped as is
      # "UCI HAR Dataset" root folder of the unzipped content is in under the working directory
      
      # --------------
      # ACTIVITY REFERENTIAL
      # --------------
      
      # Load activity labels
      activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
      
      # TEST ACTIVITIES      
      y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")    
      colnames(y_test) <- "Activity"
      
      # TRAIN ACTIVITIES
      y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")    
      colnames(y_train) <- "Activity"
      
      # --------------
      # SUBJECT REFERENTIAL
      # --------------
      
      # TEST SUBJECTS
      subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
      colnames(subject_test) <- "SubjectNumber"

      # TRAIN SUBJECTS
      subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
      colnames(subject_train) <- "SubjectNumber"
      
      # ------------
      # DATA COLUMNS LABELLING AND SUBSETTING
      # ------------

      # LABELS
      features <- read.table("./UCI HAR Dataset/features.txt")
      features <- features[,2]
      
      # TEST DATA 
      # Load Data
      X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
      # Add labels from features.txt
      colnames(X_test) <- features
      # Only keep cols which are "mean()" or "std()"
      X_test <- subset(X_test, select = grep("mean()|std()", names(X_test)))

      # TRAIN DATA 
      # Load data
      X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
      # Add labels from features.txt
      colnames(X_train) <- features
      # Only keep cols which are "mean()" or "std()"
      X_train <- subset(X_train, select = grep("mean()|std()", names(X_train)))
      
      # --------------
      # DATA MAPPING WITH SUBJECT AND ACTIVITIES
      # --------------
      
      # TEST DATA MAPPING
      X_test <- cbind(y_test, X_test)
      X_test <- cbind(subject_test, X_test)

      # TEST DATA MAPPING
      X_train <- cbind(y_train, X_train)
      X_train <- cbind(subject_train, X_train)
      
      # --------------
      # Merge X_test and X_train into one data set
      # --------------
      
      Merged_data <- rbind(X_test, X_train)
      Merged_data <<- Merged_data
      
      # --------------
      # SUMMARY DATA
      # --------------
      
      Summary_data <- ddply(Merged_data, .(Activity, SubjectNumber), colMeans)
      Summary_data$Activity <- as.factor(Summary_data$Activity)
      levels(Summary_data$Activity) <- activity_labels[,2] # Changes activity codes to labels

      # --------------
      # WRITE FILE
      # --------------
      
      write.table(Summary_data, file = "Average_MeansAndStd_bySubjectAndActivity.txt", row.names = FALSE)
      
}