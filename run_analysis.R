getTidyData <- function(path) { 

## ------------------ Begining -----------------------------------------

setwd(path)


##----- Load the datasets in the enviroment --------------------- ##

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep="")
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, sep="")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep="")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE, sep="")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep="")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE, sep="")

##----- Create a unique database mergin the test & train datasets --------------##

test <- cbind(X_test, Y_test, subject_test)
train <- cbind(X_train, Y_train, subject_train)
data <- rbind(test,train)


## ----- Set the Colnames into the database ----------------------------##

colnames(data) <- c(as.vector(features[,2]),"Activity", "Subject")


## ----- Get the MEAN & STD columns into the final dataset (fDataset)  ----------

stringFeatures <- as.vector(features[,2])

textMEAN <- grep("mean()", stringFeatures, fixed=TRUE)

textSTD <- grep("std()", stringFeatures, fixed=TRUE)

text_MEAN_STD_ACT_SUB <- c(textMEAN, textSTD, 562, 563)

fDataset <- data[,text_MEAN_STD_ACT_SUB]

## ------- Label the activities with the correct  names -----------------


aLabels <- as.vector(activityLabels[,2])

for (i in 1:6) {
  fDataset$Activity <- gsub(i,aLabels[i],fDataset$Activity)
}


## -------- Create a tidy dataset with the MEAN for each Acitivites and for each subject -----


tmpset <- fDataset[,67:68]


tmpset <- tmpset[!duplicated(tmpset[1:2]),]

tmpset2 <- data.frame()
tidyDataset <- data.frame()

n <- dim(tmpset)[1]

for (i in 1:n) {
  tmpset3 <- subset(fDataset, fDataset$Activity == tmpset[i,1] & fDataset$Subject == tmpset[i,2])
  tmpset4 <- as.data.frame(lapply(tmpset3[,1:66], mean))
  tmpset2 <- cbind(tmpset[i,2], tmpset[i,1], tmpset4 )
  
  tidyDataset <- rbind(tidyDataset, tmpset2)
  
  tmpset2 <- data.frame()
  
}

colnames(tidyDataset)[1] <- "Subject"
colnames(tidyDataset)[2] <- "Activity"





## ------------------ End -----------------------------------------

tidyDataset

}






