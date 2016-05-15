
#Read in the X_ datasets and combine
testXData <- read.table("week4HW/Dataset/test/X_test.txt")
trainXData <- read.table("week4HW/Dataset/train/X_train.txt")
XData <- rbind(testXData, trainXData)

#Read in the Y_ datasets and combine
testYData <- read.table("week4HW/Dataset/test/y_test.txt")
trainYData <- read.table("week4HW/Dataset/train/y_train.txt")
YData <- rbind(testYData, trainYData)

#Read in the subject datasets and combine
testSubData <- read.table("week4HW/Dataset/test/subject_test.txt")
trainSubData <- read.table("week4HW/Dataset/train/subject_train.txt")
subjectData <- rbind(testSubData, trainSubData)

#remove the no longer needed datasets
rm(testXData)
rm(trainXData)
rm(testSubData)
rm(trainSubData)
rm(testYData)
rm(trainYData)

#Read in the features.txt file
featuresList <- read.table("week4HW/Dataset/features.txt", stringsAsFactors=FALSE)

#Keep standard deviation and mean
MeanSTD <- grepl("(std|mean[^F])", featuresList$V2, perl=TRUE)

#Clean the data up
XData <- XData[, MeanSTD]
names(XData) <- featuresList$V2[MeanSTD]
names(XData) <- gsub("\\(|\\)", "", names(XData))
names(XData) <- tolower(names(XData))

#Read Activity_labels.txt in for descriptions and add labels
activityLabels <- read.table("week4HW/Dataset/activity_labels.txt")
activityLabels[,2] = gsub("_", "", tolower(as.character(activityLabels[,2])))
YData[,1] = activityLabels[YData[,1], 2]
names(YData) <- "activity"
names(subjectData) <- "subject"
Datasetw4 <- cbind(subjectData, YData, XData)
#Write out to txt
write.table(Datasetw4, "WEEK4RESULTS/Datasetw4.txt")

#Avg
U = unique(subjectData)[,1]
LU = length(U)
LA = length(activityLabels[,1])
LD = length(names(Datasetw4))
res = Datasetw4[ 1:(LU*LA), ]

row = 1
for (s in 1:LU) {
  for (a in 1:LA) {
    res[row,1] = U[s]
    res[row,2] = activityLabels[a, 2]
    tmp <- Datasetw4[Datasetw4$subject==s & Datasetw4$activity==activityLabels[a,2],]
    res[row, 3:LD] <- colMeans(tmp[, 3:LD])
    row = row + 1
  }
}
#Write out to txt
write.table(res, "WEEK4RESULTS/Dataset2w4.txt")
