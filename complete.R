#function to find total non-NA observations in dataframes given to corresponding i
complete<-function(directory,id=1:332)
{
  data_complete<-data.frame(id=numeric(),nobs=numeric())
  for(i in id)
  {
    filename <- sprintf("%03d.csv", i)
    filepath <- paste(directory, filename, sep="/")
    temp_data <- read.csv(filepath)
    good<-na.omit(temp_data)
    df<-list(id=i,nobs=nrow(good))
    data_complete=rbind(data_complete,df)
  }
  data_complete
}