run_analysis <- function() {
    
    ##setting the URLs for file locations
    testURL <- ("test/x_test.txt")
    trainURL <- ("train/x_train.txt")
    featureURL <- ("features.txt")
    
    ## simply reads in the available data and then combines them together into one dataframe
    ## column headers are then added
    full.data <- read.table(testURL) 
    training.data <- read.table(trainURL)
    full.data <- rbind(full.data, training.data)
    column.headers <- read.table(featureURL)
    names(full.data) <- column.headers[,2]
    
    
    ## Assignment wants us to only keep mean and std values. These calls are used to identify which 
    ## columns contain the words mean or std in the variable name
    means <- str_match(column.headers[,2],"mean")
    stdevs <- str_match(column.headers[,2],"std")

    len <- length(column.numbers.mean)
    count <- 1
    remove <- NULL 
    while (count <= len) {
        if (is.na(means[count]) && is.na(stdevs[count])) {
            remove <- c(remove,count)
        }
        count <- count + 1
    }
    full.data <- full.data[,-remove]
    write.table(full.data, "combinedDataSet.txt")
    tidydata <- data.frame(colMeans(full.data))
    write.table(tidydata,"tidyDataSet.txt")
    return(tidydata)
    
    
}