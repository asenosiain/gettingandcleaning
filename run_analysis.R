run_analysis <- function() {
   
   ## Loading dplyr function
   library(dplyr)
   
   ## Read data
   temp_test <- read.table('./test/X_test.txt')
   temp_test_act <- read.table('./test/Y_test.txt')
   temp_test_sub <- read.table('./test/subject_test.txt')
   
   temp_train <- read.table('./train/X_train.txt')
   temp_train_act <- read.table('./train/Y_train.txt')
   temp_train_sub <- read.table('./train/subject_train.txt')
   
   features <- read.table('./features.txt')
   act_labels <- read.table('./activity_labels.txt')
   
   ## Merge temp data
   temp_merged_data <- rbind(temp_test, temp_train)
   temp_merged_act_data <- rbind(temp_test_act, temp_train_act)
   temp_merged_sub_data <- rbind(temp_test_sub, temp_train_sub)
   
   ## Filter mean() and std() from merged data
   merged_data <- temp_merged_data[,grep('mean\\(\\)|std\\(\\)', features$V2)]
   
   ## Setting appropiate labels
   names(merged_data) <- grep('mean\\(\\)|std\\(\\)', features$V2, value = TRUE)
   
   ## Replace Activity codes with names
   temp_merged_act_data <- merge(temp_merged_act_data, act_labels)[,2]
   
   ## Merge data with Activity and Subject
   merged_data[, 'Activity'] <- temp_merged_act_data
   merged_data[, 'Subject'] <- temp_merged_sub_data
   
   ## Group data
   grouped_data <- group_by(merged_data, Activity, Subject)
   sum_data <- summarise_each(grouped_data, funs(mean))

   ## Write resulting data frame
   write.table(sum_data, file = './output.txt', row.names = FALSE)
   
}
