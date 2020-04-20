# Reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases
# Validation Data https://d3c33hcgiwev3.cloudfront.net/_3b0da118473bfa0845efddcbe29cc336_complete-demo.html?Expires=1587513600&Signature=H0VC~6gRj-i80IjXRNmzKjhbE40seYodoza9ss-Smk7EfAbGlA5eQ7IvKsiuvz6Uis1cYLqVLkNiHwKosq0mNRW6NA7Lh9zwALKGBXEAUA6pws7XQ0mvh0298YeXJVDbCDsG7LqAKcJWhULNLNAT1UnCSyiKU1T1beEVbXd2bMA_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A

complete <- function (directory, id=1:332){
    # Get directory of the source where CSV are
    directory <- paste(getwd(),"/",directory,"/",sep="")
    
    # Read all Files of the Dir to a Vector
    temp = list.files(directory)
    
    # Create empty Data Frame to create the table
    final_data <- data.frame()

    # Loop the whole IDs inside the ID
    for (i in id) {
        # Create Placeholder for the Path to the CSVs
        f_dir <- paste(directory,temp[i],sep="")
        # Read the CSVs based on the previous step
        a <- read.csv(f_dir)
        # Remove NAs from the currently opened CSV
        a <- na.omit(a)1

        # This has an error
        # vec <- c(i,nrow(a[i]))
        
        # Create a variable that contains the Vector of ID and Rows without NAs 
        vec <- c(i,nrow(a))
        # Add to Final Data the new Entry which is vec
        final_data <- rbind(final_data, vec)
    }
    
    # Add the names to the final columns
    colnames(final_data) <- c("id","nobs")
    # Show the final Data Frame
    final_data
}