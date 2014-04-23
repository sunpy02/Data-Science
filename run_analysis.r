X_train<-read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
y_train<-read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")
subj_train<-read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")
feature<-read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\features.txt")
activity<-read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt")
colnames(activity)<-c("Label","Activity")
colnames(y_train)<-"Label"
colnames(subj_train)<-"Subject"
activities<-merge(y_train,activity,by="Label")
feature$names<-sapply(feature[,2],as.character)
colnames(X_train)<-feature$names
X_train_sel<-X_train[sapply(strsplit(colnames(X_train),"-"),"[",2)=="mean()" | sapply(strsplit(colnames(X_train),"-"),"[",2)=="std()"| is.na( sapply(strsplit(colnames(X_train),"-"),"[",2))]
train<-cbind(subj_train,X_train_sel,activities$Activity)
X_test<-read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
y_test<-read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")
subj_test<-read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")
colnames(y_test)<-"Label"
colnames(subj_test)<-"Subject"
activities<-merge(y_test,activity,by="Label")
colnames(X_test)<-feature$names
X_test_sel<-X_test[sapply(strsplit(colnames(X_test),"-"),"[",2)=="mean()" | sapply(strsplit(colnames(X_test),"-"),"[",2)=="std()"| is.na( sapply(strsplit(colnames(X_test),"-"),"[",2))]
test<-cbind(subj_test,X_test_sel,activities$Activity)
dataset<-rbind(train,test)
write.table(dataset,"getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\getdata.txt")
