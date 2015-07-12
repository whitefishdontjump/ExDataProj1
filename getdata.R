### Get data for ExDataAnalysis Project 1 
### and return data.frame for use by plotN.R scripts.
### download date/time and url are recorded in file "SourceInfo.txt"
### complete URL and column explanations are in MD in this repo.

getdata <- function(RmNA= FALSE){
    
    if(!file.exists("powerdata.zip")) {
        
        fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        download.file(fileurl,method="wininet", destfile="powerdata.zip")
        
        dateAcquired <- date()
        
        write.table(c(dateAcquired, fileurl), file="SourceInfo.txt")
        
        unzip("powerdata.zip")
    }

    filelocal <- "household_power_consumption.txt"

    colcls <- c( "character", "character", rep("numeric", 7))
    
    message( "The data are being read . . . ."  )
    
    powerdata <- read.table(filelocal, header = TRUE, sep =";", na.strings ="?", colClasses = colcls)
    
    message("Done reading data into data.frame. " )
    
    if(RmNA) {
        powerdata <- powerdata[complete.cases(powerdata),]

        message( "The NA values have been removed using complete.cases() . . .  " )
    }
        
    ### reduce the df to the subset of dates required for assignment
    
    powerdata[,1] <- as.Date(powerdata[,1], "%d/%m/%Y")
    
    message("Converted 'Date' column to POSIXlt date format "   )
    message( "Removing rows outside of the desired two day period  "  )
    
    workingdata <- powerdata[(powerdata[,1] =="2007-02-01")|(powerdata[,1] =="2007-02-02"),]


    workingdata <<- workingdata  #export to calling environment
    rm(powerdata)  ## cleanup
    write.csv(workingdata, file = "workingdata.csv")
    message("Data acquired and exported to 'workingdata' data.frame")

    if(!nrow(workingdata)==2880) {
        stop("there are not 2880 rows (2 days of data) in workingdata!!")
    }
### create day of week array

    day_axis <- c(weekdays(workingdata[1,1], abbreviate = TRUE), weekdays(workingdata[1441,1], abbreviate = TRUE),weekdays(workingdata[2880,1] +1, abbreviate = TRUE))
    day_axis <<- day_axis
    tickpts <- c("1", "1441", "2880")
    tickpts <<- tickpts
    message("day_axis and tickpoints vectors created for use in plot scripts")

}
