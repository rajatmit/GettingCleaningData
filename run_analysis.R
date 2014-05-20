# Assign the working directory path
DirectoryPath <-
  "C:/Users/rgarg/Desktop/MyWork/OKEDU/GettingAndCleaningData/Project/workdir/"

# Place the directory UCI HAR Dataset (with files / folders) in the
# working directory.
# "Inertial Signals" folders and files inside it will be ignored 
# for this analysis
# Following input files will be used
    # 1. X_train.txt
    # 1. subject_train.txt
    # 1. y_train.txt
    # 1. X_test.txt
    # 1. subject_test.txt
    # 1. y_test.txt
    # 1. features.txt
    # 1. activity_labels.txt
# Variables with mean() and std() in its name will be used for calcualtion

# Setup the working directory
setwd(DirectoryPath)
install.packages("gdata")
library(gdata)
library(reshape2)
#install.packages("stringr")
#library(stringr)

# Read the three training files
X_train <- read.table(paste(DirectoryPath,
          "UCI HAR Dataset/train/X_train.txt", sep = ""), header = FALSE)
subject_train <- read.table(paste(DirectoryPath,
        "UCI HAR Dataset/train/subject_train.txt",sep = ""), header = FALSE)
y_train <- read.table(paste(DirectoryPath, "UCI HAR Dataset/train/y_train.txt",
                            sep = ""), header = FALSE)

# Read the three test files

X_test <- read.table(paste(DirectoryPath,
          "UCI HAR Dataset/test/X_test.txt", sep = ""), header = FALSE)
subject_test <- read.table(paste(DirectoryPath,
              "UCI HAR Dataset/test/subject_test.txt", sep = ""),
              header = FALSE)
y_test <- read.table(paste(DirectoryPath, "UCI HAR Dataset/test/y_test.txt", 
                           sep = ""),  header = FALSE)

#Reading the features file
features <- read.table(paste(DirectoryPath, "UCI HAR Dataset/features.txt",
                             sep = ""),  header = FALSE)
featureName <- features$V2

#Reading the activity file
activity_labels <- read.table(paste(DirectoryPath,
                              "UCI HAR Dataset/activity_labels.txt",
                                    sep = ""),  header = FALSE)
names(activity_labels)<- c("Activity", "ActivityDescription")

# Assiging variable names to training data
names(X_train) <- featureName
names(subject_train)<- c("Subject")
names(y_train)<- c("Activity")

# Assiging variable names to testing data
names(X_test) <- featureName
names(subject_test)<- c("Subject")
names(y_test)<- c("Activity")

# Assigning the sequence Id to x, y and subject data for training and test
seq_id_train<-c(1:nrow(X_train))
seq_id_test<-c(1:nrow(X_test))


# Adding a sequence Id field in Training data
X_train$seq_id <- seq_id_train
subject_train$seq_id <- seq_id_train
y_train$seq_id <- seq_id_train

# Adding a sequence Id field in Test data
X_test$seq_id <- seq_id_test
subject_test$seq_id <- seq_id_test
y_test$seq_id <- seq_id_test

# Merging all the training data
MergeTraining <- merge(X_train, subject_train, by.x="seq_id")
MergeTraining <- merge(MergeTraining, y_train, by.x="seq_id")

# Merging all the testing data
MergeTesting <- merge(X_test, subject_test, by.x="seq_id")
MergeTesting <- merge(MergeTesting, y_test, by.x="seq_id")

################### Answer to Step 1 in the assignment ####################
# Appending Training and Testing data
TestTrain <- rbind(MergeTraining, MergeTesting)

################### Answer to Step 2 in the assignment ####################

# Selecting mean and SD data
MeanSDData <- TestTrain[, grep('mean\\(|std\\(', names(TestTrain))] 
namesData <- names(MeanSDData)
MeanSDData$Activity <- TestTrain$Activity
MeanSDData$Subject <- TestTrain$Subject

################### Answer to Step 3-4 in the assignment ####################
# Merging MeanSDData Dataset with the Activity Table
MeanSDData <- merge(MeanSDData, activity_labels, by.x="Activity")


################### Answer to Step 5 in the assignment ####################
# Computing the average
AvgData <- aggregate( MeanSDData[,2:67], MeanSDData[,68:69], FUN = mean )

# Converting to Tidy Dataset using melt
AvgData <- melt(AvgData,id=c("Subject","ActivityDescription"),
                measure.vars=namesData)

## Renaming variables
names(AvgData)<- c("Subject", "ActivityDesc        ",
                   "MeanVariable               ", "MeanValue     " )

# Exporting the AvgData dataset to a text file "Avgdata.txt" in the
# current working directory with the proper alignment
write.fwf(AvgData, file=paste(DirectoryPath, "tidy.data.txt"), 
          width=c(7,20,27, 13), colnames=TRUE)
