corr <- function(directory, threshold = 0) {
  # use the function created in part 2
  complete_cases = complete(directory)
  cr <- numeric(0)
  
  if (max(complete_cases$nobs) >= threshold){
    # Monitor ID that needs to compute correlations
    ID <- complete_cases$id[complete_cases$nobs>=threshold]
    for (i in ID){
      filename <- sprintf("%03d.csv", i)
      filepath <- paste(directory, filename, sep="/")
      data <- read.csv(filepath)
      cr<-c(cr,cor(data$sulfate, data$nitrate, use = "pairwise.complete.obs"))
    }
  }
  return(cr)
  
}

