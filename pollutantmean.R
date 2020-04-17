# Script that calculates the mean of a pollutant (sulfate or nitrate)
# across a specified list of monitors. The function 'pollutantmean' takes
# three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor
# ID numbers, 'pollutantmean' reads that monitors' particulate matter data
# from the directory specified in the 'directory' argument and returns
# the mean of the pollutant across all of the monitors, ignoring any
# missing values coded as NA.

# Validation Data URL:
# https://d3c33hcgiwev3.cloudfront.net/_3b0da118473bfa0845efddcbe29cc336_pollutantmean-demo.html?Expires=1587254400&Signature=bdfIFi4FEEWDzSUH7pV1MzLPB0tgdnODCCS3qNeooLZzOfl-X1kiId5Ybcu6iORBXJiO9eEAYDu3OdiakZ1rHxxJlQzQF3iduY95ehunvL11kieJN8VGXTyO~WmvymuiG9deSOVyZ-iYhwQi0Ytk-T2-EOHr7PpjyJ1qKv09Niw_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A

pollutantmean <- function (directory, pollutant, id=1:332){
    # Get directory of the source where CSV are
    directory <- paste(getwd(),"/",directory,"/",sep="")
    
    # This would have read all CSV inside the Directory, not needed
    # temp = list.files(pattern="*.csv")

    # Read all Files of the Dir to a Vector
    temp = list.files(directory)
    
    # Create empty final data to present the Mean
    final_data <- NA
    
    # Loop the whole IDs inside the ID
    for (i in id) {
        # Create Placeholder for the Path to the CSVs
        f_dir <- paste(directory,temp[i],sep="")
        # Read the CSVs based on the previous step
        a <- read.csv(f_dir)
        # Join the data on the final row, to the Final Data
        final_data <- rbind(final_data,a)
    }
    # Calculate the mean without the NAs just the values not the names of fields and columns
    mean(final_data[[pollutant]], na.rm = TRUE)
}