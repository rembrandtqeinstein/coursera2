# Takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0
# Testing Scenarios https://d3c33hcgiwev3.cloudfront.net/_e92e575b8e62dcb1e3a086d2ff0d5a1e_corr-demo.html?Expires=1587513600&Signature=AV2D62tA~DrNicAmg4x-lQujNOrSiC3qE9o5ZMkQc9VoSzTid-KugMOGpcYvpUJS9pQTrn~~58I2tb5J8Qto8GyTqltBj-O3ke7Dipe7vmgI4TlA1sUOGJKWqNcIa7OcUzByzaPt3zjbjsLpnOcZ9NCCwYy2dBRTrDGCxgHUL-0_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A

corr <- function(directory, threshold = 0) {
    files_list <- dir(directory, full.names = TRUE)
    output <- numeric()
    for (i in files_list){
        corval <- 0        
        data <- read.csv(i) #Bind CSV files in data 
        value <- sum(complete.cases(data))
        data <- data[complete.cases(data),]
        if (value > threshold){ 
            sulfate <- data[["sulfate"]]
            nitrate <- data[["nitrate"]]
            corval <- cor(nitrate,sulfate,use="pairwise.complete.obs")            
            output <- c(output,corval)
        }
    }
    output
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)

# corr <- function (directory, threshold = 0){
#     ini <- complete(directory)
#     directory <- paste(getwd(),"/",directory,"/",sep="")
#     
#     temp = list.files(directory)
#     id <- 1:nrow(ini)
#     
#     if(ini$nobs >= threshold){
#         print(ini$id)
#     }
# 
#     final_data <- NA
#     for (i in id) {
#         f_dir <- paste(directory,temp[i],sep="")
#         a <- read.csv(f_dir)
#         #a <- na.omit(a)
#         a <- a[complete.cases(a),]
#         if (ini[id==i]$nobs >= threshold){
#             print(ini[i]$nobs)
#             final_data <- rbind(final_data,a)
#         }
#     }
#     resul <- cor(final_data$sulfate, final_data$nitrate, use="complete.obs")
#     #print(resul)
# }