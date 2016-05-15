##Code Description for Getting and Cleaning Data Week 4 Project

####Source of Data Analyzed
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
####Description of Data
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
####Citation
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

###Code Process Explanation
1. The training and test results for the X and Y datasets were read in and merged. 
2. Information on the subjects for the datasets were read in and then were merged.
3. The original loaded datasets were removed to get rid of unused variables. 
4. The features.txt file was read in to retrieve the mean averages and standard deviation for the measurements reported in the study
5. The activity_labels.txt file was loaded in for the purposes of assisting with the cleaning of the data and applying activity names to the datasets
6. Data is cleaned and converted to lowercase
7. Results of the data are saved
8. The averages of the reported measurements are extracted and merged
9. Results of the merge are saved

###Variables and Datasets
-testXData = Dataset for X_test.txt

-trainXData = Dataset for X_train.txt

-XData = Merged dataset for X_test.txt and X_train.txt

-testYData = Dataset for Y_test.txt

-trainYData = Dataset for Y_train.txt

-YData = Merged dataset for Y_test.txt and Y_train.txt

-testSubData = Dataset for subject_test.txt

-trainSubData = Dataset for subject_train.txt

-subjectData = Merged dataset for subject_test.txt and subject_train.txt

-featuresList = features.txt contents file

-MeanSTD = standard deviation and mean by featuresList information

-activityLabels = Activity_labels.txt contents file

-Datasetw4 = the bound tiday dataset of XData, YData, and subjectData

-U = Unique data from subjectData

-LU = Number of Unique in subjectData

-LA = Number of Activities

-LD = Number of columns in DatasetW4

-res = Results output to a file - the tidy data mean for activities and subjectData
