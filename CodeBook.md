Getting and Cleaning Data Course Project

Step1: Assign a current working directory for the project work into the variable: "DirectoryPath"

Step2: Place the folder "UCI HAR Dataset" as provided into the current working directory assigned in Step1

Step3: Package installations and library additions (these packages will be required to tidy the dataset and output):
  Add the package: "gdata"
  Add the libraries: "gdata" and "reshape2"

Step4: Read the 3 training files X_train.txt, subject_train.txt and y_train.txt 
  into the 3 dataframes: X_train, subject_train and y_train respectively.
  
Step5: Read the 3 testing files X_test.txt, subject_test.txt and y_test.txt 
  into the 3 dataframes: X_test, subject_test and y_test respectively.
  
Step6: Read the features file "features.txt" into the dataframe: "features"
  and list all the variable names into a vector "featureName".

Step7: Read the activity file "activity_labels.txt" into the dataframe: "activity_labels", and
  rename variable names to something logical like: "Activity" and "ActivityDescription"

Step8: Assign logical names to the training dataframes using names function:
  featureName - > X_train
  "Subject" -> subject_train
  "Activity" -> y_train

Step9: Repeat the step 8 for testing data frames

Step10: Assign a row Id (using sequence Id) to each row in training and testing data frames

Step11: Merge all training data frames using the sequence Id

Step12: Merge all testing data frames using the sequence Id

Step13: Append training and testing data creating in step11 and step 12 and store it into: TestTrain dataframe

Step14: Extract columns only with the mean() and std() in the variable name along with Activity and Subject and
  store it into a new data frame: MeanSDData (with 66 measure variables and 2 Id variables)

Step15: Merge MeanSDData with activity_labels using activity Id to get the activity description

Step16: Compute the average on the MeanSDData using aggregate function where "subject"
  and "activity description" are class variables and others are measure variables. Store the 
  output in AvgData data frame.

Step17: Use melt function on AvgData to perform transpose where putting all measure variables
  into one variable field and values into a single value field and rename the fields accordingly.

Step18: Use the write.fwf function to export the data from AvgData with proper width alignment for each field
  into a text file.
