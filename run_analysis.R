library (dplyr)
library (reshape2)

run_analysis<-function(){
  x_test<-read.table('./test/X_test.txt',stringsAsFactors=F)          		###importing data from working directory assuming in the UCI HAR folder
  test_sub<-read.table('./test/subject_test.txt',stringsAsFactors=F)
  y_test<-read.table('./test/y_test.txt', stringsAsFactors=F)
  x_train<-read.table('./train/X_train.txt',stringsAsFactors=F)          	###importing data from working directory assuming in the UCI HAR folder
  train_sub<-read.table('./train/subject_train.txt',stringsAsFactors=F)
  y_train<-read.table('./train/y_train.txt', stringsAsFactors=F)
  features<-read.table('features.txt', stringsAsFactors=F)
  
  x<-rbind(x_test,x_train)
  sub<-rbind(test_sub, train_sub)
  y<-rbind(y_test,y_train)
  rm(x_test,x_train, test_sub, train_sub,y_test,y_train)
  y[,1]<-as.factor(y[,1])
  levels(y[,1])<-list('walking'='1','walking_upstairs'='2',			###Assign the descriptive labels to factors of dataframe
			'walking_downstairs'='3','sitting'='4',
			'standing'='5','laying'='6')

  colnames(x)<-features[,2]         						###rename columns to describe variables observed
  colnames(sub)<-"Subject"          						###rename column to reflect subject observation
  colnames(y)<-"Activity"           						###rename column to reflect activity observation
  
  dat<-cbind(sub,y,x)               						### merges data into one set with descriptive variables and observation
  dat<-dat[,c(1:2, grep('mean|std', names(dat)))]  				### selects all columns with 'mean' or 'std' in the name
  dat<-arrange(dat,Subject, Activity)						### arranges by subject number then activity (still by underlying number)
  dat<-melt(dat, id=c('Subject','Activity'))					### convert data to long format
  dat<-dcast(dat, Subject+Activity~variable, mean)				### aggregates the data into a new dataset with the mean of the variable values as output
}