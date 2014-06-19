# MERGING

testd <- read.table("X_test.txt")

traind <- read.table("X_train.txt")

mergedset <- rbind(traind, testd)



# EXTRACTING MEAN AND STD

features <- read.table("features.txt", colClasses=c("integer", "character"))

ftmean <- grep("mean|std", features$V2)

meanset <- mergedset[,ftmean]



# NAMING

colnames(meanset) <- features[ftmean, 'V2']

subject_test <- read.table("subject_test.txt")
activity_test <- read.table("y_test.txt", colClasses=c("factor"))
testid <- cbind(subject_test, activity_test)

subject_train <- read.table("subject_train.txt")
activity_train <- read.table("y_train.txt", colClasses=c("factor"))
trainid <- cbind(subject_train, activity_train)

mergedids <- rbind(trainid, testid)

colnames(mergedids) <- c("subjectid", "activityid")

meanset <- cbind(mergedids, meanset)

act_labels <- read.table("activity_labels.txt")
levels(meanset$activityid) <- act_labels$V2


# TIDYSET

library(data.table)
meanset <- data.table(meanset)
tidyset <- meanset[,lapply(.SD, mean), by=list(subjectid,activityid)]


# WRITING CSV

write.csv(tidyset, file="tidyset.csv")
