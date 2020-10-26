# This script will print a format output all models. 

format_output <- function(pred, real){
  tab <- table(pred, real)
  print(tab, dnn=c("Pred","Actual"))
  error_rate <- (tab[1,1]+tab[2,2])/length(pred)
  print(paste("Error Rate is ",1- round(error_rate,digits = 3)))
}

error_rate <- function(pred, real){
  tab <- table(pred, real)
  error_rate <- (tab[1,1]+tab[2,2])/length(pred)
  return(1 - error_rate)
}