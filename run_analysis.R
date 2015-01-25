#
# DESCRIPTION:
# This script extracts the raw informations from a series of files located in the directory
# "UCI_HAR_Dataset" and performs the following tasks:
# 1. Extract the raw datasets from files (training and test data)
# 2. Merges the training and the test datasets into a single set.
# 3. Rename the variables with meaningful names to facilitate their interpretations.
# 4. Extracts only the relevant informations (mean and std deviation variables) for each measurement.
# 5. From the data set created previously, compute an independent tidy dataset by averaging each of 
#    the variables according to its subject/activity membership.
# 6. Replace activity codes with descriptive activity names to describe the activity variable
# 7. Write the final table (tidy set) to the output file "meanFeatures.txt". 
#
run_analysis <- function()
{
      library(dplyr)
      homeDir <- getwd()
      dataDir <- paste(homeDir, "UCI_HAR_Dataset", sep="/")
      
      # 1. Read files to tbl data frames
      setwd(paste(dataDir, "test/", sep="/"))
      fileList <- list.files(pattern="*.txt")
      testDF <- tbl_df(do.call("cbind", lapply(fileList, FUN=function(files){read.table(files, header=F)})))
      
      setwd(paste(dataDir, "train/", sep="/"))
      fileList <- list.files(pattern="*.txt")
      trainDF <- tbl_df(do.call("cbind", lapply(fileList, FUN=function(files){read.table(files, header=F)})))
      setwd(homeDir)
      
      
      # 2. Append the training and the test sets to create one data set
      mergeDF <- rbind(testDF, trainDF)
      rm(trainDF, testDF)  # free unnecessary spaces
      
      
      # 3. Read variable names and format them by removing/replacing irregular characters. The Camel
      #    case code is adopted (function CamelCase()) to name variables.
      #    Note: some columns have duplicated variable names and could be removed, but since they 
      #    will be dropped in the next step, their removal is ommitted to alleviate the operations.
      colNames <- as.character(read.table("./UCI_HAR_Dataset/features.txt")[,2])
      colNames <- gsub("BodyBody", "Body", colNames) # replace 'BodyBody' by 'Body'
      colNames <- gsub("\\()", "", colNames)  # remove all '()'
      colNames <- gsub("\\,", ".", colNames)  # replace ',' with '.'
      colNames <- gsub("\\(", "_", colNames)  # replace '(' with '_'
      colNames <- gsub("\\)", "", colNames)   # remove ')'
      colNames <- sapply(colNames, FUN=CamelCase, splitChar="-", USE.NAMES=F)
      varNames <- c("subjectNum", colNames, "activity")
      names(mergeDF) <- varNames
      
      
      # 4. Extracts the mean and standard deviation for each measurement.
      #    a. identify indices of variables to keep (mean and std) and those to let go (angle)
      meanStr <- grepl("mean", varNames, ignore.case=T)
      stdStr <- grepl("std", varNames, ignore.case=T)
      angleStr <- grepl("angle", varNames, ignore.case=T)
      
      #    b. build the tidy DF by subsetting the initial raw data
      tidyDF <- mergeDF[, c(1, 563, which( (meanStr | stdStr) & !angleStr ))]
      
      
      # 5. Creates an independent tidy data set with the average of ea. variable for ea. activity/ 
      #    subject combination.
      meanTidyDF <- tidyDF %>% group_by(subjectNum, activity) %>% summarise_each(funs(mean))
      
      #    Append a suffix ".Mean" to variables names (except subjectNum and activity) to describe
      #    that their values are averages
      tmpname <- colnames(meanTidyDF)
      tmpname[3:length(tmpname)] <- paste(tmpname[3:length(tmpname)], "Mean", sep=".")
      names(meanTidyDF) <- tmpname
      
      
      # 6. Name the activities in the new data set with descriptive names
      activities <- as.character(read.table("./UCI_HAR_Dataset/activity_labels.txt")[,2])
      meanTidyDF$activity <- factor(activities, levels=activities)
      
      # 7. Write the output to a text file
      write.table(meanTidyDF, file="meanFeatures.txt", row.names=F)
      meanTidyDF
}


#===================================================================================================
# DESCRIPTION:
#     This function capitalize the 1st character of words in a string (words are separated by the 
#     character 'splitChar') and collapse them into a single word. Eg. "zip code" will give
#     "zipCode" (splitChar=' ') or "pizzas-are-so-cool" gives "pizzasAreSoCool" (splitChar='-')
#===================================================================================================
CamelCase <- function(x, splitChar=" ")
{
      s <- strsplit(x, split=splitChar)[[1]]
      if ( length(s) > 1 ){
            s2 <- paste(toupper(substring(s[2:length(s)], 1,1)), substring(s[2:length(s)], 2), 
                        sep="", collapse="")
            paste(s[1], s2, sep="")
      } else {
            x
      }
}
