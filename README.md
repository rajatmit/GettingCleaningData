GettingCleaningData
===================

Coursera Getting and cleaning data project repository

Obejctive: 

  This project involves collection, cleaning and combining raw data files to turn it into a useful dataset which can be further utilized for analysis work.

Data: 

  The data is related to Human activity recognition using smartphones. Overall there are 30 subjects involved in this experiment, which requires performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
   
    # Of Volunteers: 30
    
    Activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
    
    Data Captured: 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz

Files Used:
  
  
    Test -> subject_test.txt (contains subject Id in order of experiment), X_test.txt (3-axial linear acceleration) and y_test.txt (3-axial angular velocity)
  
    Train -> subject_train.txt (contains subject Id in order of experiment), X_train.txt (3-axial linear acceleration) and y_train.txt (3-axial angular velocity)
  
  General Information:
  
    features.txt (contains variables information captured like tBodyAcc-mean()-X, tBodyAcc-std()-Y, tBodyAcc-max()-X etc)
    activity_labels.txt (contains description of different activities)

  Code File:

    run_analysis.R

Output: 

A tidy data file: "tidy.data.txt" containing average values only for the variable containing 33 mean() variables and 33 std() variables as their measurement for all the subjects and related activities, combined for training and testing data.
    

Subject ActivityDesc         MeanVariable                MeanValue     
      1 LAYING               tBodyAcc-mean()-X            2.215982e-01
      2 LAYING               tBodyAcc-mean()-X            2.813734e-01
      3 LAYING               tBodyAcc-mean()-X            2.755169e-01
      4 LAYING               tBodyAcc-mean()-X            2.635592e-01
      5 LAYING               tBodyAcc-mean()-X            2.783343e-01
      6 LAYING               tBodyAcc-mean()-X            2.486565e-01
      7 LAYING               tBodyAcc-mean()-X            2.501767e-01
      8 LAYING               tBodyAcc-mean()-X            2.612543e-01
      9 LAYING               tBodyAcc-mean()-X            2.591955e-01
     10 LAYING               tBodyAcc-mean()-X            2.802306e-01
